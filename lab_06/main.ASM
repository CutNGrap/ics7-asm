extrn read_command: near
extrn read_decimal: near
extrn print_bin_uns: near
extrn print_hex_sig: near

public number

STK segment public 'STACK'
    db 100 dup(0)
STK ends

SD segment word public 'DATA'
    number dw "nn"
    f_ptr dw 3 dup("ff")
    enter_msg:
    db 10, 13
    db "Choose menu option:"
    db 10, 13
    db "1.Enter as signed number in 10 ns"
    db 10, 13
    db "2.Print as unsigned number in 2 ns"
    db 10, 13
    db "3.Print as signed number in 16 ns"
    db 10, 13
    db 10, 13
    db "0.Exit"
    db 10, 13
    db 10, 13
    db "Enter your command number here:"
    db "$"
    
    exit_msg:
    db 10, 13
    db "Goodbye!"
    db 10, 13
    db "$"
SD ends

CSEG segment para public'CODE'
	assume DS:SD
main:
    mov ax, SD
    mov ds, ax

    mov f_ptr[0], read_decimal
    mov f_ptr[2], print_bin_uns
    mov f_ptr[4], print_hex_sig
    

    while_menu:
        mov dx, enter_msg
        mov ah, 9h
        int 21h

        call read_command ;считывает в al

        cmp al, 0 ; проверка правильности ввода команды 
        je while_menu_end
        cmp al, 3
        ja while_menu

        mov ah, 0 ;приведение номера команды к индексу массива
        sub al, 1
        mov dl, 2
        mul dl
        mov di, ax
        call f_ptr[di]

	
        jmp while_menu
    while_menu_end:
    mov dx, exit_msg
    mov ah, 9h
    int 21h

	mov ax, 4c00h
	int 21h
CSEG ENDS
END main