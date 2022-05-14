global my_copy

section .data 


section .text
my_copy:

    ;The first four integer arguments are passed in RCX, RDX, R8 and R9, in that order.
    ; rcx - dst
    ; rdx - src
    ; r8 - len

    lea rdi, [rcx] ;dst
    lea rsi, [rdx] ;src
    mov rcx, r8    ;len

    cmp rdi, rsi ; src == dst ? quit : not_equal()
    jne not_equal
    je quit

not_equal:
    cmp rdi, rsi
    jl simple_copy

    mov rax, rdi
    sub rax, rsi
    cmp rax, rcx
    jge simple_copy

copy_from_end: ;копирование с конца
    add rsi, rcx ;смещение src в конец
    add rdi, rcx ;смещение dst в конец
    dec rsi
    dec rdi
    std         ;df = 1

simple_copy:
    rep movsb       ;memcpy(rdi, rsi, rcx)
    cld

quit:
    ret