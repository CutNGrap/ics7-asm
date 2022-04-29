public add_and_print

SD segment word common 'DATA'
	b1 Label byte
	org 1
	b2 Label byte
SD ends


CSEG SEGMENT PARA PUBLIC 'CODE'

	assume DS:SD
add_and_print proc near
	mov ah, 2h
	mov dl, 10
	int 21h
	
	mov dl, b1
	mov al, b2
	
	add dl, al
	sub dl, '0'
	
	mov ah, 2h
	int 21h
	ret
add_and_print endp
CSEG ENDS
end