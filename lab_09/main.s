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
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC5:
	.ascii "c_add32\0"
.LC6:
	.ascii "%s: %lf nsec\12\0"
.LC7:
	.ascii "asm_add32\0"
.LC8:
	.ascii "\12\0"
.LC9:
	.ascii "c_mul32\0"
.LC10:
	.ascii "asm_mul32\0"
.LC13:
	.ascii "c_add64\0"
.LC14:
	.ascii "asm_add64\0"
.LC15:
	.ascii "c_mul64\0"
.LC16:
	.ascii "asm_mul64\0"
.LC19:
	.ascii "c_add80\0"
.LC20:
	.ascii "asm_add80\0"
.LC21:
	.ascii "c_mul80\0"
.LC22:
	.ascii "asm_mul80\0"
	.align 8
.LC25:
	.ascii "pi = %le; sin(pi) = %Le; sin(pi/2) = %Le\12\0"
	.align 8
.LC29:
	.ascii "pi = %Le; sin(pi) = %Le; sin(pi/2) = %Le\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	call	__main
	call	clock
	mov	DWORD PTR -52[rbp], eax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L4
.L5:
	movss	xmm1, DWORD PTR .LC0[rip]
	mov	eax, DWORD PTR .LC1[rip]
	movd	xmm0, eax
	call	c_add32
	add	DWORD PTR -4[rbp], 1
.L4:
	cmp	DWORD PTR -4[rbp], 999999
	jle	.L5
	call	clock
	sub	eax, DWORD PTR -52[rbp]
	mov	DWORD PTR -52[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -52[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC5[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -56[rbp], eax
	mov	DWORD PTR -8[rbp], 0
	jmp	.L6
.L7:
	movss	xmm1, DWORD PTR .LC0[rip]
	mov	eax, DWORD PTR .LC1[rip]
	movd	xmm0, eax
	call	asm_add32
	add	DWORD PTR -8[rbp], 1
.L6:
	cmp	DWORD PTR -8[rbp], 999999
	jle	.L7
	call	clock
	sub	eax, DWORD PTR -56[rbp]
	mov	DWORD PTR -56[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -56[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC7[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -60[rbp], eax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L8
.L9:
	movss	xmm1, DWORD PTR .LC0[rip]
	mov	eax, DWORD PTR .LC1[rip]
	movd	xmm0, eax
	call	c_mul32
	add	DWORD PTR -12[rbp], 1
.L8:
	cmp	DWORD PTR -12[rbp], 999999
	jle	.L9
	call	clock
	sub	eax, DWORD PTR -60[rbp]
	mov	DWORD PTR -60[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -60[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC9[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -64[rbp], eax
	mov	DWORD PTR -16[rbp], 0
	jmp	.L10
.L11:
	movss	xmm1, DWORD PTR .LC0[rip]
	mov	eax, DWORD PTR .LC1[rip]
	movd	xmm0, eax
	call	asm_mul32
	add	DWORD PTR -16[rbp], 1
.L10:
	cmp	DWORD PTR -16[rbp], 999999
	jle	.L11
	call	clock
	sub	eax, DWORD PTR -64[rbp]
	mov	DWORD PTR -64[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -64[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC10[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -68[rbp], eax
	mov	DWORD PTR -20[rbp], 0
	jmp	.L12
.L13:
	movsd	xmm0, QWORD PTR .LC11[rip]
	mov	rax, QWORD PTR .LC12[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	c_add64
	add	DWORD PTR -20[rbp], 1
.L12:
	cmp	DWORD PTR -20[rbp], 999999
	jle	.L13
	call	clock
	sub	eax, DWORD PTR -68[rbp]
	mov	DWORD PTR -68[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -68[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC13[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -72[rbp], eax
	mov	DWORD PTR -24[rbp], 0
	jmp	.L14
.L15:
	movsd	xmm0, QWORD PTR .LC11[rip]
	mov	rax, QWORD PTR .LC12[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	asm_add64
	add	DWORD PTR -24[rbp], 1
.L14:
	cmp	DWORD PTR -24[rbp], 999999
	jle	.L15
	call	clock
	sub	eax, DWORD PTR -72[rbp]
	mov	DWORD PTR -72[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -72[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC14[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -76[rbp], eax
	mov	DWORD PTR -28[rbp], 0
	jmp	.L16
.L17:
	movsd	xmm0, QWORD PTR .LC11[rip]
	mov	rax, QWORD PTR .LC12[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	c_mul64
	add	DWORD PTR -28[rbp], 1
.L16:
	cmp	DWORD PTR -28[rbp], 999999
	jle	.L17
	call	clock
	sub	eax, DWORD PTR -76[rbp]
	mov	DWORD PTR -76[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -76[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC15[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -80[rbp], eax
	mov	DWORD PTR -32[rbp], 0
	jmp	.L18
.L19:
	movsd	xmm0, QWORD PTR .LC11[rip]
	mov	rax, QWORD PTR .LC12[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	asm_mul64
	add	DWORD PTR -32[rbp], 1
.L18:
	cmp	DWORD PTR -32[rbp], 999999
	jle	.L19
	call	clock
	sub	eax, DWORD PTR -80[rbp]
	mov	DWORD PTR -80[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -80[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC16[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -84[rbp], eax
	mov	DWORD PTR -36[rbp], 0
	jmp	.L20
.L21:
	lea	rax, -112[rbp]
	fld	TBYTE PTR .LC17[rip]
	fstp	TBYTE PTR -128[rbp]
	fld	TBYTE PTR .LC18[rip]
	fstp	TBYTE PTR -144[rbp]
	lea	rcx, -144[rbp]
	lea	rdx, -128[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	c_add80
	add	DWORD PTR -36[rbp], 1
.L20:
	cmp	DWORD PTR -36[rbp], 999999
	jle	.L21
	call	clock
	sub	eax, DWORD PTR -84[rbp]
	mov	DWORD PTR -84[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -84[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC19[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -88[rbp], eax
	mov	DWORD PTR -40[rbp], 0
	jmp	.L22
.L23:
	lea	rax, -112[rbp]
	fld	TBYTE PTR .LC17[rip]
	fstp	TBYTE PTR -128[rbp]
	fld	TBYTE PTR .LC18[rip]
	fstp	TBYTE PTR -144[rbp]
	lea	rcx, -144[rbp]
	lea	rdx, -128[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	asm_add80
	add	DWORD PTR -40[rbp], 1
.L22:
	cmp	DWORD PTR -40[rbp], 999999
	jle	.L23
	call	clock
	sub	eax, DWORD PTR -88[rbp]
	mov	DWORD PTR -88[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -88[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC20[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -92[rbp], eax
	mov	DWORD PTR -44[rbp], 0
	jmp	.L24
.L25:
	lea	rax, -112[rbp]
	fld	TBYTE PTR .LC17[rip]
	fstp	TBYTE PTR -128[rbp]
	fld	TBYTE PTR .LC18[rip]
	fstp	TBYTE PTR -144[rbp]
	lea	rcx, -144[rbp]
	lea	rdx, -128[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	c_mul80
	add	DWORD PTR -44[rbp], 1
.L24:
	cmp	DWORD PTR -44[rbp], 999999
	jle	.L25
	call	clock
	sub	eax, DWORD PTR -92[rbp]
	mov	DWORD PTR -92[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -92[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC21[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	call	clock
	mov	DWORD PTR -96[rbp], eax
	mov	DWORD PTR -48[rbp], 0
	jmp	.L26
.L27:
	lea	rax, -112[rbp]
	fld	TBYTE PTR .LC17[rip]
	fstp	TBYTE PTR -128[rbp]
	fld	TBYTE PTR .LC18[rip]
	fstp	TBYTE PTR -144[rbp]
	lea	rcx, -144[rbp]
	lea	rdx, -128[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	asm_mul80
	add	DWORD PTR -48[rbp], 1
.L26:
	cmp	DWORD PTR -48[rbp], 999999
	jle	.L27
	call	clock
	sub	eax, DWORD PTR -96[rbp]
	mov	DWORD PTR -96[rbp], eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, DWORD PTR -96[rbp]
	movsd	xmm2, QWORD PTR .LC2[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	movsd	xmm0, QWORD PTR .LC3[rip]
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0
	mov	rdx, rax
	movq	xmm0, rdx
	movapd	xmm2, xmm0
	mov	r8, rax
	lea	rax, .LC22[rip]
	mov	rdx, rax
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	printf
	lea	rax, -112[rbp]
	fld	TBYTE PTR .LC23[rip]
	fstp	TBYTE PTR -128[rbp]
	lea	rdx, -128[rbp]
	mov	rcx, rax
	call	asm_sin
	fld	TBYTE PTR -112[rbp]
	fstp	TBYTE PTR -160[rbp]
	lea	rax, -112[rbp]
	fld	TBYTE PTR .LC24[rip]
	fstp	TBYTE PTR -128[rbp]
	lea	rdx, -128[rbp]
	mov	rcx, rax
	call	asm_sin
	fld	TBYTE PTR -112[rbp]
	fstp	TBYTE PTR -112[rbp]
	fld	TBYTE PTR -160[rbp]
	fstp	TBYTE PTR -128[rbp]
	lea	rcx, -128[rbp]
	lea	rdx, -112[rbp]
	movabs	rax, 4614253070214989087
	mov	r8, rax
	movq	xmm0, r8
	mov	r9, rcx
	mov	r8, rdx
	movapd	xmm1, xmm0
	mov	rdx, rax
	lea	rax, .LC25[rip]
	mov	rcx, rax
	call	printf
	lea	rax, -112[rbp]
	fld	TBYTE PTR .LC26[rip]
	fstp	TBYTE PTR -128[rbp]
	lea	rdx, -128[rbp]
	mov	rcx, rax
	call	asm_sin
	fld	TBYTE PTR -112[rbp]
	fstp	TBYTE PTR -160[rbp]
	lea	rax, -112[rbp]
	fld	TBYTE PTR .LC27[rip]
	fstp	TBYTE PTR -128[rbp]
	lea	rdx, -128[rbp]
	mov	rcx, rax
	call	asm_sin
	fld	TBYTE PTR -112[rbp]
	fstp	TBYTE PTR -112[rbp]
	fld	TBYTE PTR -160[rbp]
	fstp	TBYTE PTR -128[rbp]
	lea	rcx, -128[rbp]
	lea	rdx, -112[rbp]
	movabs	rax, 4614256664087491728
	mov	r8, rax
	movq	xmm0, r8
	mov	r9, rcx
	mov	r8, rdx
	movapd	xmm1, xmm0
	mov	rdx, rax
	lea	rax, .LC25[rip]
	mov	rcx, rax
	call	printf
	lea	rax, -112[rbp]
	mov	rcx, rax
	call	asm_pi
	fld	TBYTE PTR -112[rbp]
	fld	TBYTE PTR .LC28[rip]
	fdivp	st(1), st
	lea	rax, -112[rbp]
	fstp	TBYTE PTR -128[rbp]
	lea	rdx, -128[rbp]
	mov	rcx, rax
	call	asm_sin
	fld	TBYTE PTR -112[rbp]
	fstp	TBYTE PTR -160[rbp]
	lea	rax, -112[rbp]
	mov	rcx, rax
	call	asm_pi
	fld	TBYTE PTR -112[rbp]
	lea	rax, -112[rbp]
	fstp	TBYTE PTR -128[rbp]
	lea	rdx, -128[rbp]
	mov	rcx, rax
	call	asm_sin
	fld	TBYTE PTR -112[rbp]
	fstp	TBYTE PTR -176[rbp]
	lea	rax, -112[rbp]
	mov	rcx, rax
	call	asm_pi
	fld	TBYTE PTR -112[rbp]
	fstp	TBYTE PTR -112[rbp]
	fld	TBYTE PTR -176[rbp]
	fstp	TBYTE PTR -128[rbp]
	fld	TBYTE PTR -160[rbp]
	fstp	TBYTE PTR -144[rbp]
	lea	rcx, -144[rbp]
	lea	rdx, -128[rbp]
	lea	rax, -112[rbp]
	mov	r9, rcx
	mov	r8, rdx
	mov	rdx, rax
	lea	rax, .LC29[rip]
	mov	rcx, rax
	call	printf
	mov	eax, 0
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	c_add32
	.def	c_add32;	.scl	2;	.type	32;	.endef
	.seh_proc	c_add32
c_add32:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	movss	DWORD PTR 16[rbp], xmm0
	movss	DWORD PTR 24[rbp], xmm1
	movss	xmm0, DWORD PTR 16[rbp]
	addss	xmm0, DWORD PTR 24[rbp]
	pop	rbp
	ret
	.seh_endproc
	.globl	c_mul32
	.def	c_mul32;	.scl	2;	.type	32;	.endef
	.seh_proc	c_mul32
c_mul32:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	movss	DWORD PTR 16[rbp], xmm0
	movss	DWORD PTR 24[rbp], xmm1
	movss	xmm0, DWORD PTR 16[rbp]
	mulss	xmm0, DWORD PTR 24[rbp]
	pop	rbp
	ret
	.seh_endproc
	.globl	c_add64
	.def	c_add64;	.scl	2;	.type	32;	.endef
	.seh_proc	c_add64
c_add64:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	movsd	QWORD PTR 16[rbp], xmm0
	movsd	QWORD PTR 24[rbp], xmm1
	movsd	xmm0, QWORD PTR 16[rbp]
	addsd	xmm0, QWORD PTR 24[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.seh_endproc
	.globl	c_mul64
	.def	c_mul64;	.scl	2;	.type	32;	.endef
	.seh_proc	c_mul64
c_mul64:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	movsd	QWORD PTR 16[rbp], xmm0
	movsd	QWORD PTR 24[rbp], xmm1
	movsd	xmm0, QWORD PTR 16[rbp]
	mulsd	xmm0, QWORD PTR 24[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	ret
	.seh_endproc
	.globl	c_add80
	.def	c_add80;	.scl	2;	.type	32;	.endef
	.seh_proc	c_add80
c_add80:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 40
	.seh_stackalloc	40
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	rbx, rdx
	fld	TBYTE PTR [rbx]
	fstp	TBYTE PTR -16[rbp]
	mov	rbx, r8
	fld	TBYTE PTR [rbx]
	fstp	TBYTE PTR -32[rbp]
	fld	TBYTE PTR -16[rbp]
	fld	TBYTE PTR -32[rbp]
	faddp	st(1), st
	mov	rax, QWORD PTR 32[rbp]
	fstp	TBYTE PTR [rax]
	mov	rax, QWORD PTR 32[rbp]
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	c_mul80
	.def	c_mul80;	.scl	2;	.type	32;	.endef
	.seh_proc	c_mul80
c_mul80:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 40
	.seh_stackalloc	40
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	rbx, rdx
	fld	TBYTE PTR [rbx]
	fstp	TBYTE PTR -16[rbp]
	mov	rbx, r8
	fld	TBYTE PTR [rbx]
	fstp	TBYTE PTR -32[rbp]
	fld	TBYTE PTR -16[rbp]
	fld	TBYTE PTR -32[rbp]
	fmulp	st(1), st
	mov	rax, QWORD PTR 32[rbp]
	fstp	TBYTE PTR [rax]
	mov	rax, QWORD PTR 32[rbp]
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	asm_add32
	.def	asm_add32;	.scl	2;	.type	32;	.endef
	.seh_proc	asm_add32
asm_add32:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	movss	DWORD PTR 16[rbp], xmm0
	movss	DWORD PTR 24[rbp], xmm1
/APP
 # 62 "main.c" 1
	.intel_syntax noprefix
	fld DWORD PTR 16[rbp]
	fld DWORD PTR 24[rbp]
	faddp
	fstp DWORD PTR -4[rbp]
	
 # 0 "" 2
/NO_APP
	movss	xmm0, DWORD PTR -4[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	asm_mul32
	.def	asm_mul32;	.scl	2;	.type	32;	.endef
	.seh_proc	asm_mul32
asm_mul32:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	movss	DWORD PTR 16[rbp], xmm0
	movss	DWORD PTR 24[rbp], xmm1
/APP
 # 76 "main.c" 1
	.intel_syntax noprefix
	fld DWORD PTR 16[rbp]
	fld DWORD PTR 24[rbp]
	fmulp
	fstp DWORD PTR -4[rbp]
	
 # 0 "" 2
/NO_APP
	movss	xmm0, DWORD PTR -4[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	asm_add64
	.def	asm_add64;	.scl	2;	.type	32;	.endef
	.seh_proc	asm_add64
asm_add64:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	movsd	QWORD PTR 16[rbp], xmm0
	movsd	QWORD PTR 24[rbp], xmm1
/APP
 # 91 "main.c" 1
	.intel_syntax noprefix
	fld QWORD PTR 16[rbp]
	fld QWORD PTR 24[rbp]
	faddp
	fstp QWORD PTR -8[rbp]
	
 # 0 "" 2
/NO_APP
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	asm_mul64
	.def	asm_mul64;	.scl	2;	.type	32;	.endef
	.seh_proc	asm_mul64
asm_mul64:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	movsd	QWORD PTR 16[rbp], xmm0
	movsd	QWORD PTR 24[rbp], xmm1
/APP
 # 106 "main.c" 1
	.intel_syntax noprefix
	fld QWORD PTR 16[rbp]
	fld QWORD PTR 24[rbp]
	fmulp
	fstp QWORD PTR -8[rbp]
	
 # 0 "" 2
/NO_APP
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	rax, xmm0
	movq	xmm0, rax
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	asm_add80
	.def	asm_add80;	.scl	2;	.type	32;	.endef
	.seh_proc	asm_add80
asm_add80:
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
	mov	rbx, rdx
	fld	TBYTE PTR [rbx]
	fstp	TBYTE PTR -32[rbp]
	mov	rbx, r8
	fld	TBYTE PTR [rbx]
	fstp	TBYTE PTR -48[rbp]
/APP
 # 121 "main.c" 1
	.intel_syntax noprefix
	fld TBYTE PTR -32[rbp]
	fld TBYTE PTR -48[rbp]
	faddp
	fstp TBYTE PTR -16[rbp]
	
 # 0 "" 2
/NO_APP
	fld	TBYTE PTR -16[rbp]
	mov	rax, QWORD PTR 32[rbp]
	fstp	TBYTE PTR [rax]
	mov	rax, QWORD PTR 32[rbp]
	add	rsp, 56
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	asm_mul80
	.def	asm_mul80;	.scl	2;	.type	32;	.endef
	.seh_proc	asm_mul80
asm_mul80:
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
	mov	rbx, rdx
	fld	TBYTE PTR [rbx]
	fstp	TBYTE PTR -32[rbp]
	mov	rbx, r8
	fld	TBYTE PTR [rbx]
	fstp	TBYTE PTR -48[rbp]
/APP
 # 136 "main.c" 1
	.intel_syntax noprefix
	fld TBYTE PTR -32[rbp]
	fld TBYTE PTR -48[rbp]
	fmulp
	fstp TBYTE PTR -16[rbp]
	
 # 0 "" 2
/NO_APP
	fld	TBYTE PTR -16[rbp]
	mov	rax, QWORD PTR 32[rbp]
	fstp	TBYTE PTR [rax]
	mov	rax, QWORD PTR 32[rbp]
	add	rsp, 56
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	asm_sin
	.def	asm_sin;	.scl	2;	.type	32;	.endef
	.seh_proc	asm_sin
asm_sin:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 40
	.seh_stackalloc	40
	lea	rbp, 32[rsp]
	.seh_setframe	rbp, 32
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	rbx, rdx
	fld	TBYTE PTR [rbx]
	fstp	TBYTE PTR -32[rbp]
/APP
 # 153 "main.c" 1
	.intel_syntax noprefix
	fld TBYTE PTR -32[rbp]
	fsin
	fstp TBYTE PTR -16[rbp]
	
 # 0 "" 2
/NO_APP
	fld	TBYTE PTR -16[rbp]
	mov	rax, QWORD PTR 32[rbp]
	fstp	TBYTE PTR [rax]
	mov	rax, QWORD PTR 32[rbp]
	add	rsp, 40
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	asm_pi
	.def	asm_pi;	.scl	2;	.type	32;	.endef
	.seh_proc	asm_pi
asm_pi:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
/APP
 # 169 "main.c" 1
	.intel_syntax noprefix
	fldpi
	fstp TBYTE PTR -16[rbp]
	
 # 0 "" 2
/NO_APP
	fld	TBYTE PTR -16[rbp]
	mov	rax, QWORD PTR 16[rbp]
	fstp	TBYTE PTR [rax]
	mov	rax, QWORD PTR 16[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 4
.LC0:
	.long	1077936128
	.align 4
.LC1:
	.long	1084227584
	.align 8
.LC2:
	.long	0
	.long	1083129856
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.align 8
.LC4:
	.long	0
	.long	1093567616
	.align 8
.LC11:
	.long	0
	.long	1074266112
	.align 8
.LC12:
	.long	0
	.long	1075052544
	.align 16
.LC17:
	.long	0
	.long	-1610612736
	.long	16385
	.long	0
	.align 16
.LC18:
	.long	0
	.long	-1073741824
	.long	16384
	.long	0
	.align 16
.LC23:
	.long	1546188800
	.long	-923417969
	.long	16383
	.long	0
	.align 16
.LC24:
	.long	1546188800
	.long	-923417969
	.long	16384
	.long	0
	.align 16
.LC26:
	.long	1336180736
	.long	-921704277
	.long	16383
	.long	0
	.align 16
.LC27:
	.long	1336180736
	.long	-921704277
	.long	16384
	.long	0
	.align 16
.LC28:
	.long	0
	.long	-2147483648
	.long	16384
	.long	0
	.ident	"GCC: (Rev10, Built by MSYS2 project) 11.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	clock;	.scl	2;	.type	32;	.endef
