.MODEL TINY
.CODE
.186
ORG 100H

main:
    jmp init

    repeat_speed db 00011111b ;00011111b - 2 символа в секунду, 00000000b - 30 символов в секунду
    handler dd 0
    already_working db 0
    seconds db 0

turn_on:
    mov already_working, 1

    ; установка обработчика
    mov ah, 25h
    mov al, 1Ch 
    mov dx, offset my_handler
    int 21h

    mov dx, offset init
    INT 27h ; завершения программы с сохранением в памяти, в dx количество байтов, которые следует оставить от начала PSP

turn_off:
    mov already_working, 0
    ; восстановить предыдущий обработчик
    mov ah, 25h
    mov al, 1Ch
    mov dx, word ptr es:handler
    mov ds, word ptr es:handler + 2
    int 21h

    ; команда F3h отвечает за параметры режима автоповтора нажатой клавиши.
    mov al, 0f3h
    out 60h, al ;Порт 60h доступен для записи и обычно принимает пары байтов последовательно: первый - код команды, второй - данные.

    mov al, 0h
    out 60h, al

    mov ah, 4ch
    int 21h


my_handler proc far
    pushf
    pusha

    ; выход: CH = часы в коде BCD   (пример: CX = 1243H = 12:43)
    ;        CL = минуты в коде BCD
    ;        DH = секунды в коде BCD
    ; выход: CF = 1, если часы не работают
    mov ah, 02h
    int 1ah
    
    jc my_handler_finish ;если CF = 1

    cmp seconds, dh
    je my_handler_finish

    mov seconds, dh
    dec repeat_speed
    
    mov al, 0f3h ; команда F3h отвечает за параметры режима автоповтора нажатой клавиши.
    out 60h, al ;Порт 60h доступен для записи и обычно принимает пары байтов последовательно: первый - код команды, второй - данные.

    mov al, repeat_speed
    out 60h, al

    cmp repeat_speed, 0h
    jne my_handler_finish

    mov repeat_speed, 00011111b

my_handler_finish:
    popa
    popf

    jmp cs:handler ; возвращение к запомненному

my_handler endp

init proc
    ; Сохранить адрес предыдущего обработчика прерывания 1Ch
    mov ah,35h
    mov al, 1Ch
    int 21h

    mov word ptr handler, bx
    mov word ptr handler + 2, es ;(возвращается в ex:bx)

    cmp es:already_working, 1

    je turn_off
    jne turn_on

init endp
end main