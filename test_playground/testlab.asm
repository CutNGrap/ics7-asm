StkSeg SEGMENT PARA STACK 'STACK'
 DB 200h DUP (?)
StkSeg ENDS
;
DataS SEGMENT PARA 'DATA'
    sas db 30h
    db 31h
DataS ENDS

Data SEGMENT byte 'DAA'
    susus db 32h
Data ENDS
;

Code SEGMENT dword 'CODE'
 ASSUME CS:Code, DS:DataS

DispMsg:
 mov CX, 3
PrintWord:
    mov ah, 2
    mov al, '4'
    int 21h

 mov AH,4Ch ;АН=4Ch завершить процесс
 int 21h ;вызов функции DOS
Code ENDS
 END DispMsg