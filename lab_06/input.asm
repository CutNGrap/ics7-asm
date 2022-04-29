extrn number: word

public read_command
public new_line

SD segment para public 'DATA'
    sign db "+"
    string db 9 dup("s")
    
    error_msg db 10, 13
    db 10, 13
    db "Error: non-digit input$"
    
    dec_invite_msg db 10, 13
    db 10, 13
    db "Enter a decimal number in range [-32768; 32767]:$"
    
SD ends

CSEG segment para public 'CODE'
    assume DS:SD

read_decimal proc near
    call print_dec_invite

    mov string[0], 7

    mov ah, 0Ah ;ввод строки 
    mov dx, offset string
    int 21h 

    xor cx, cx ;считывание количества введенных символов
    mov cl, string[1]
    cmp cl, 0
        je error
    

    ;обработка первого символа, проверка его на знак
    xor ax, ax ;ax - аккумулятор числа
    xor dx, dx ;dx - текущая цифра
    mov dl, string[2] 
    
    ;if '-'
    cmp dl, "-"
        je set_minus
    ;else if '+'
    cmp dl, "+"
        je set_plus

    ;else
        mov sign, "+"
        sub dl, "0"
        add al, dl
        dec cx

        cmp cx, 0
        je exit

    init_cycle:
    mov si, 3 ;индекс очередной цифры 
    for_read_decimal:
        mov dl, string[si]
        sub dl, "0"
        cmp dl, 9
        ja error

        mov di, dx

        mov bx, 10 ;умножить текущую значение числа (в ax) на 10
        mul bx

        mov dx, di
        add ax, dx ;прибавить очередную цифру к числу 
        inc si
        loop for_read_decimal
    end_for_read_decimal:

    cmp sign, '-'
        jne exit
        neg ax
        
    exit:
        mov number, ax
        ret

    error:
        call print_error
        jmp exit

    set_minus:
        mov sign, "-"
        dec cl
        je error
        jmp init_cycle

    set_plus:
        mov sign, "+"
        dec cl
        je error
        jmp init_cycle

read_decimal endp


read_command proc near
    mov ah, 1
    int 21h

    sub al, "0"
    ret
read_command endp  

print_error proc near
    mov ah, 9h
    mov dx, offset error_msg
    int 21h
    ret
print_error endp

print_dec_invite proc near
    mov ah, 9h
    mov dx, offset dec_invite_msg
    int 21h
    ret
print_dec_invite endp

new_line proc near
    mov ah, 02
    mov dl, 10
	int 21h
    mov dl, 13
	int 21h

    ret
new_line endp 


CSEG ENDS
end