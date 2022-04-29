extrn number: word
extrn new_line: near

public print_hex_sig

SD segment para public 'DATA'
    table db "0123456789ABCDEF"
    
SD ends

CSEG segment para public 'CODE'
    assume DS:SD

print_hex_sig proc near
    call new_line

    mov bx, offset table ; установка адреса таблицы

    mov dx, [number] ; dx - число 
    mov ax, dx
    rcl ax, 1 ;CF - старший бит числа
        jc print_minus_change_code

    conditional_jump_hex:

    ; 1
    xor ah, ah
    mov al, dh
    and al, 11110000b
    mov cx, 4
    shr1:
        shr ax, 1
        loop shr1
    xlat   ;помещает в al табличное представление тетрады из al. Таблица по адресу ds:bx
    call print_AL

    ; 2
    xor ah, ah
    mov al, dh
    and al, 00001111b
    xlat
    call print_AL

    ; 3
    xor ah, ah
    mov al, dl
    and al, 11110000b
    mov cx, 4
    shr2:
        sar ax, 1
        loop shr2
    xlat
    call print_AL

    ; 4
    xor ah, ah
    mov al, dl
    and al, 00001111b 
    xlat
    call print_AL

    ret

    print_minus_change_code:
            mov ah, 2h
            mov di, dx ;сохранение значения dx
            mov dl, '-'
            int 21h
            mov dx, di
            neg dx
            jmp conditional_jump_hex

print_hex_sig endp

print_AL proc near
    mov di, dx
    mov ah, 2
    mov dl, al
    int 21h
    mov dx, di
    ret
print_AL endp 

CSEG ENDS
end