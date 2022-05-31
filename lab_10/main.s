	.file	"main.c"
	.intel_syntax noprefix
	.text
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 56
	.seh_stackalloc	56
	lea	rbp, 48[rsp]
	.seh_setframe	rbp, 48
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	QWORD PTR 40[rbp], rdx
	mov	QWORD PTR 48[rbp], r8
	mov	QWORD PTR 56[rbp], r9
	lea	rax, 40[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rbx, QWORD PTR -16[rbp]
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	r8, rbx
	mov	rdx, QWORD PTR 32[rbp]
	mov	rcx, rax
	call	__mingw_vfprintf
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	add	rsp, 56
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "%f %f %f\12\0"
	.text
	.globl	print_vector
	.def	print_vector;	.scl	2;	.type	32;	.endef
	.seh_proc	print_vector
print_vector:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	movss	xmm0, DWORD PTR 8[rax]
	pxor	xmm2, xmm2
	cvtss2sd	xmm2, xmm0
	mov	rax, QWORD PTR 16[rbp]
	movss	xmm0, DWORD PTR 4[rax]
	pxor	xmm1, xmm1
	cvtss2sd	xmm1, xmm0
	mov	rax, QWORD PTR 16[rbp]
	movss	xmm0, DWORD PTR [rax]
	cvtss2sd	xmm0, xmm0
	movq	rax, xmm2
	mov	rdx, rax
	movq	xmm2, rdx
	mov	rcx, rax
	movq	rax, xmm1
	mov	rdx, rax
	movq	xmm1, rdx
	mov	rdx, rax
	movq	rax, xmm0
	mov	r8, rax
	movq	xmm0, r8
	movapd	xmm3, xmm2
	mov	r9, rcx
	movapd	xmm2, xmm1
	mov	r8, rdx
	movapd	xmm1, xmm0
	mov	rdx, rax
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	printf
	nop
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	c_scal_mul
	.def	c_scal_mul;	.scl	2;	.type	32;	.endef
	.seh_proc	c_scal_mul
c_scal_mul:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	movss	xmm1, DWORD PTR [rax]
	mov	rax, QWORD PTR 24[rbp]
	movss	xmm0, DWORD PTR [rax]
	mulss	xmm1, xmm0
	mov	rax, QWORD PTR 16[rbp]
	movss	xmm2, DWORD PTR 4[rax]
	mov	rax, QWORD PTR 24[rbp]
	movss	xmm0, DWORD PTR 4[rax]
	mulss	xmm0, xmm2
	addss	xmm1, xmm0
	mov	rax, QWORD PTR 16[rbp]
	movss	xmm2, DWORD PTR 8[rax]
	mov	rax, QWORD PTR 24[rbp]
	movss	xmm0, DWORD PTR 8[rax]
	mulss	xmm0, xmm2
	addss	xmm0, xmm1
	pop	rbp
	ret
	.seh_endproc
	.globl	asm_scal_mul
	.def	asm_scal_mul;	.scl	2;	.type	32;	.endef
	.seh_proc	asm_scal_mul
asm_scal_mul:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	pxor	xmm0, xmm0
	movss	DWORD PTR -4[rbp], xmm0
	mov	rax, QWORD PTR 16[rbp]
	mov	rdx, QWORD PTR 24[rbp]
/APP
 # 31 "main.c" 1
	.intel_syntax noprefix 
	movaps xmm0, XMMWORD PTR [rax] 
 	movaps xmm1, XMMWORD PTR [rdx] 
 	mulps xmm0, xmm1 
 	movhlps xmm1, xmm0 
 	addps xmm0, xmm1 
 	movaps xmm1, xmm0 
 	shufps xmm0, xmm0, 1 
 	addps xmm0, xmm1 
 	movss DWORD PTR -4[rbp], xmm0 
 	
 # 0 "" 2
/NO_APP
	movss	xmm0, DWORD PTR -4[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC8:
	.ascii "c_scal_mul\0"
.LC9:
	.ascii "%s: %lf nsec\12\0"
.LC10:
	.ascii "asm_scal_mul\0"
.LC11:
	.ascii "%f\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	call	__main
	mov	QWORD PTR -32[rbp], 0
	mov	QWORD PTR -24[rbp], 0
	movss	xmm0, DWORD PTR .LC2[rip]
	movss	DWORD PTR -32[rbp], xmm0
	movss	xmm0, DWORD PTR .LC2[rip]
	movss	DWORD PTR -28[rbp], xmm0
	movss	xmm0, DWORD PTR .LC3[rip]
	movss	DWORD PTR -24[rbp], xmm0
	mov	QWORD PTR -48[rbp], 0
	mov	QWORD PTR -40[rbp], 0
	movss	xmm0, DWORD PTR .LC2[rip]
	movss	DWORD PTR -48[rbp], xmm0
	movss	xmm0, DWORD PTR .LC4[rip]
	movss	DWORD PTR -44[rbp], xmm0
	movss	xmm0, DWORD PTR .LC3[rip]
	movss	DWORD PTR -40[rbp], xmm0
	call	clock
	mov	DWORD PTR -12[rbp], eax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L9
.L10:
	lea	rdx, -48[rbp]
	lea	rax, -32[rbp]
	mov	rcx, rax
	call	c_scal_mul
	add	DWORD PTR -4[rbp], 1
.L9:
	cmp	DWORD PTR -4[rbp], 999999
	jle	.L10
	call	clock
	sub	eax, DWORD PTR -12[rbp]
	mov	DWORD PTR -12[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -12[rbp]
	movsd	xmm2, QWORD PTR .LC5[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC6[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC7[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC8[rip]
	mov	rdx, rax
	lea	rax, .LC9[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -16[rbp], eax
	mov	DWORD PTR -8[rbp], 0
	jmp	.L11
.L12:
	lea	rdx, -48[rbp]
	lea	rax, -32[rbp]
	mov	rcx, rax
	call	asm_scal_mul
	add	DWORD PTR -8[rbp], 1
.L11:
	cmp	DWORD PTR -8[rbp], 999999
	jle	.L12
	call	clock
	sub	eax, DWORD PTR -16[rbp]
	mov	DWORD PTR -16[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -16[rbp]
	movsd	xmm2, QWORD PTR .LC5[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC6[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC7[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC10[rip]
	mov	rdx, rax
	lea	rax, .LC9[rip]
	mov	rcx, rax
	call	printf
	lea	rdx, -48[rbp]
	lea	rax, -32[rbp]
	mov	rcx, rax
	call	c_scal_mul
	cvtss2sd	xmm0, xmm0
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm1, xmm0
	mov	rdx, rax
	lea	rax, .LC11[rip]
	mov	rcx, rax
	call	printf
	lea	rdx, -48[rbp]
	lea	rax, -32[rbp]
	mov	rcx, rax
	call	asm_scal_mul
	cvtss2sd	xmm0, xmm0
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm1, xmm0
	mov	rdx, rax
	lea	rax, .LC11[rip]
	mov	rcx, rax
	call	printf
	mov	eax, 0
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC2:
	.long	1065353216
	.align 4
.LC3:
	.long	1086324736
	.align 4
.LC4:
	.long	1077936128
	.align 8
.LC5:
	.long	0
	.long	1083129856
	.align 8
.LC6:
	.long	0
	.long	1104006501
	.align 8
.LC7:
	.long	0
	.long	1093567616
	.ident	"GCC: (Rev10, Built by MSYS2 project) 11.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	clock;	.scl	2;	.type	32;	.endef
