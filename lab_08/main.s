	.file	"main.c"
	.text
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "ASM length: %d\12C length: %d\12\0"
.LC1:
	.ascii "ORIGINAL: %s\12COPY: %s\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	subq	$184, %rsp
	.seh_stackalloc	184
	leaq	176(%rsp), %rbp
	.seh_setframe	%rbp, 176
	.seh_endprologue
	call	__main
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movl	$0, %edx
	movq	%rax, %rcx
	call	setbuf
	movabsq	$2338620986093435213, %rax
	movabsq	$7358995515036562547, %rdx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$1629516399, -16(%rbp)
	movw	$28019, -12(%rbp)
	movb	$0, -10(%rbp)
	movl	$0, -4(%rbp)
	leaq	-32(%rbp), %rdx
/APP
 # 15 "main.c" 1
	.intel_syntax noprefix
	mov ecx, 0
	not ecx
	mov al, 0
	lea rdi, [%rdx]
	repne scasb
	not ecx
	dec ecx
	mov eax, ecx
	mov %edx, eax
	
 # 0 "" 2
/NO_APP
	movl	%edx, -4(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	movq	%rax, %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
/APP
 # 37 "main.c" 1
	.intel_syntax noprefix
	mov ecx, 0
	
 # 0 "" 2
/NO_APP
	movl	-4(%rbp), %ecx
	leaq	-144(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	my_copy
	leaq	-144(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	addq	$184, %rsp
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev10, Built by MSYS2 project) 11.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	setbuf;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	my_copy;	.scl	2;	.type	32;	.endef
