extrn add_and_print : far
SD segment word common 'DATA'
	b1 Label byte
	org 1
	b2 Label byte
SD ends

CSEG segment para public 'CODE'
	assume CS:CSEG, DS:SD
	
main:
	
	mov ah, 01 ;считывание цифры
	int 21h
	mov b1, al
	
	mov ah, 01 ;считывание цифры
	int 21h
	mov b2, al
	
	call add_and_print
	
	mov ax, 4c00h
	int 21h
	
CSEG ENDS
END main