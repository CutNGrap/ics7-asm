extrn STK

CSEG segment para public 'CODE'

	assume CS:CSEG, SS:STK	
	
	add b1, b2
	mov b2, '0'
	mul b2, 2
	sub b1, b2
	mov ax, 02
	mov dl, b1
	int 21h
	
	mov ax, 4c00h
	int 21h
CSEG ENDS