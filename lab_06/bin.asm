extrn number: word
extrn new_line: near

public print_bin_uns

CSEG segment para public 'CODE'

print_bin_uns proc near
    call new_line

    mov bx, [number] ; bx - число 

    mov cx, 4 ; сработать 4 раза по 4 цифры
    for_dot:
        mov di, cx ;di - количество повторений для внешнего цикла

        mov cx, 4
        for_print_bin:
            rcl bx, 1 ;сдвиг влево, старший бит ax --> CF
                jc print_one_bin
                jnc print_zero_bin
            
            conditional_jump_bin:
            loop for_print_bin

        cmp di, 1
        jne print_dot

        after_dot:
        mov cx, di
        loop for_dot

    call new_line
    ret

    print_zero_bin:
            mov ah, 2h
            mov dl, '0'
            int 21h
            jmp conditional_jump_bin

    print_one_bin:
            mov ah, 2h
            mov dl, '1'
            int 21h
            jmp conditional_jump_bin

    print_dot:
            mov ah, 2h
            mov dl, '.'
            int 21h
            jmp after_dot

print_bin_uns endp

CSEG ENDS
end