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
	.def	__divxf3;	.scl	2;	.type	32;	.endef
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
	push	r13
	.seh_pushreg	r13
	push	r12
	.seh_pushreg	r12
	push	rdi
	.seh_pushreg	rdi
	push	rsi
	.seh_pushreg	rsi
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 184
	.seh_stackalloc	184
	lea	rbp, 176[rsp]
	.seh_setframe	rbp, 176
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
	lea	rcx, -112[rbp]
	movabs	rax, -6917529027641081856
	mov	edx, 16385
	mov	QWORD PTR -128[rbp], rax
	mov	DWORD PTR -120[rbp], edx
	movabs	rax, -4611686018427387904
	mov	edx, 16384
	mov	QWORD PTR -144[rbp], rax
	mov	DWORD PTR -136[rbp], edx
	lea	rdx, -144[rbp]
	lea	rax, -128[rbp]
	mov	r8, rdx
	mov	rdx, rax
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
	lea	rcx, -112[rbp]
	movabs	rax, -6917529027641081856
	mov	edx, 16385
	mov	QWORD PTR -128[rbp], rax
	mov	DWORD PTR -120[rbp], edx
	movabs	rax, -4611686018427387904
	mov	edx, 16384
	mov	QWORD PTR -144[rbp], rax
	mov	DWORD PTR -136[rbp], edx
	lea	rdx, -144[rbp]
	lea	rax, -128[rbp]
	mov	r8, rdx
	mov	rdx, rax
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
	lea	rcx, -112[rbp]
	movabs	rax, -6917529027641081856
	mov	edx, 16385
	mov	QWORD PTR -128[rbp], rax
	mov	DWORD PTR -120[rbp], edx
	movabs	rax, -4611686018427387904
	mov	edx, 16384
	mov	QWORD PTR -144[rbp], rax
	mov	DWORD PTR -136[rbp], edx
	lea	rdx, -144[rbp]
	lea	rax, -128[rbp]
	mov	r8, rdx
	mov	rdx, rax
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
	lea	rcx, -112[rbp]
	movabs	rax, -6917529027641081856
	mov	edx, 16385
	mov	QWORD PTR -128[rbp], rax
	mov	DWORD PTR -120[rbp], edx
	movabs	rax, -4611686018427387904
	mov	edx, 16384
	mov	QWORD PTR -144[rbp], rax
	mov	DWORD PTR -136[rbp], edx
	lea	rdx, -144[rbp]
	lea	rax, -128[rbp]
	mov	r8, rdx
	mov	rdx, rax
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
	lea	rcx, -112[rbp]
	movabs	rax, -3966049975847553024
	mov	edx, 16383
	mov	QWORD PTR -128[rbp], rax
	mov	DWORD PTR -120[rbp], edx
	lea	rax, -128[rbp]
	mov	rdx, rax
	call	asm_sin
	mov	rsi, QWORD PTR -112[rbp]
	mov	edi, DWORD PTR -104[rbp]
	lea	rcx, -112[rbp]
	movabs	rax, -3966049975847553024
	mov	edx, 16384
	mov	QWORD PTR -128[rbp], rax
	mov	DWORD PTR -120[rbp], edx
	lea	rax, -128[rbp]
	mov	rdx, rax
	call	asm_sin
	mov	rax, QWORD PTR -112[rbp]
	mov	edx, DWORD PTR -104[rbp]
	mov	QWORD PTR -112[rbp], rax
	mov	DWORD PTR -104[rbp], edx
	mov	QWORD PTR -128[rbp], rsi
	mov	DWORD PTR -120[rbp], edi
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
	lea	rcx, -112[rbp]
	movabs	rax, -3958689724962144256
	mov	edx, 16383
	mov	QWORD PTR -128[rbp], rax
	mov	DWORD PTR -120[rbp], edx
	lea	rax, -128[rbp]
	mov	rdx, rax
	call	asm_sin
	mov	rsi, QWORD PTR -112[rbp]
	mov	edi, DWORD PTR -104[rbp]
	lea	rcx, -112[rbp]
	movabs	rax, -3958689724962144256
	mov	edx, 16384
	mov	QWORD PTR -128[rbp], rax
	mov	DWORD PTR -120[rbp], edx
	lea	rax, -128[rbp]
	mov	rdx, rax
	call	asm_sin
	mov	rax, QWORD PTR -112[rbp]
	mov	edx, DWORD PTR -104[rbp]
	mov	QWORD PTR -112[rbp], rax
	mov	DWORD PTR -104[rbp], edx
	mov	QWORD PTR -128[rbp], rsi
	mov	DWORD PTR -120[rbp], edi
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
	mov	rcx, QWORD PTR -112[rbp]
	mov	ebx, DWORD PTR -104[rbp]
	lea	r9, -112[rbp]
	lea	r10, -128[rbp]
	movabs	rax, -9223372036854775808
	mov	edx, 16384
	lea	r8, -144[rbp]
	mov	QWORD PTR -128[rbp], rcx
	mov	DWORD PTR -120[rbp], ebx
	mov	QWORD PTR -144[rbp], rax
	mov	DWORD PTR -136[rbp], edx
	mov	rdx, r10
	mov	rcx, r9
	call	__divxf3
	mov	rax, QWORD PTR -112[rbp]
	mov	edx, DWORD PTR -104[rbp]
	lea	rcx, -112[rbp]
	mov	QWORD PTR -128[rbp], rax
	mov	DWORD PTR -120[rbp], edx
	lea	rax, -128[rbp]
	mov	rdx, rax
	call	asm_sin
	mov	rsi, QWORD PTR -112[rbp]
	mov	edi, DWORD PTR -104[rbp]
	lea	rax, -112[rbp]
	mov	rcx, rax
	call	asm_pi
	mov	rax, QWORD PTR -112[rbp]
	mov	edx, DWORD PTR -104[rbp]
	lea	rcx, -112[rbp]
	mov	QWORD PTR -128[rbp], rax
	mov	DWORD PTR -120[rbp], edx
	lea	rax, -128[rbp]
	mov	rdx, rax
	call	asm_sin
	mov	r12, QWORD PTR -112[rbp]
	mov	r13d, DWORD PTR -104[rbp]
	lea	rax, -112[rbp]
	mov	rcx, rax
	call	asm_pi
	mov	rax, QWORD PTR -112[rbp]
	mov	edx, DWORD PTR -104[rbp]
	mov	QWORD PTR -112[rbp], rax
	mov	DWORD PTR -104[rbp], edx
	mov	QWORD PTR -128[rbp], r12
	mov	DWORD PTR -120[rbp], r13d
	mov	QWORD PTR -144[rbp], rsi
	mov	DWORD PTR -136[rbp], edi
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
	add	rsp, 184
	pop	rbx
	pop	rsi
	pop	rdi
	pop	r12
	pop	r13
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
	.def	__addxf3;	.scl	2;	.type	32;	.endef
	.globl	c_add80
	.def	c_add80;	.scl	2;	.type	32;	.endef
	.seh_proc	c_add80
c_add80:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 120
	.seh_stackalloc	120
	lea	rbp, 112[rsp]
	.seh_setframe	rbp, 112
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	rbx, rdx
	mov	rax, QWORD PTR [rbx]
	mov	edx, DWORD PTR 8[rbx]
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -8[rbp], edx
	mov	rbx, r8
	mov	rax, QWORD PTR [rbx]
	mov	edx, DWORD PTR 8[rbx]
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -24[rbp], edx
	lea	r9, -48[rbp]
	mov	rcx, QWORD PTR -16[rbp]
	mov	ebx, DWORD PTR -8[rbp]
	lea	r10, -64[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR -24[rbp]
	lea	r8, -80[rbp]
	mov	QWORD PTR -64[rbp], rcx
	mov	DWORD PTR -56[rbp], ebx
	mov	QWORD PTR -80[rbp], rax
	mov	DWORD PTR -72[rbp], edx
	mov	rdx, r10
	mov	rcx, r9
	call	__addxf3
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR -40[rbp]
	mov	rcx, QWORD PTR 32[rbp]
	mov	QWORD PTR [rcx], rax
	mov	DWORD PTR 8[rcx], edx
	mov	rax, QWORD PTR 32[rbp]
	add	rsp, 120
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.def	__mulxf3;	.scl	2;	.type	32;	.endef
	.globl	c_mul80
	.def	c_mul80;	.scl	2;	.type	32;	.endef
	.seh_proc	c_mul80
c_mul80:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 120
	.seh_stackalloc	120
	lea	rbp, 112[rsp]
	.seh_setframe	rbp, 112
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	rbx, rdx
	mov	rax, QWORD PTR [rbx]
	mov	edx, DWORD PTR 8[rbx]
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -8[rbp], edx
	mov	rbx, r8
	mov	rax, QWORD PTR [rbx]
	mov	edx, DWORD PTR 8[rbx]
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -24[rbp], edx
	lea	r9, -48[rbp]
	mov	rcx, QWORD PTR -16[rbp]
	mov	ebx, DWORD PTR -8[rbp]
	lea	r10, -64[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR -24[rbp]
	lea	r8, -80[rbp]
	mov	QWORD PTR -64[rbp], rcx
	mov	DWORD PTR -56[rbp], ebx
	mov	QWORD PTR -80[rbp], rax
	mov	DWORD PTR -72[rbp], edx
	mov	rdx, r10
	mov	rcx, r9
	call	__mulxf3
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR -40[rbp]
	mov	rcx, QWORD PTR 32[rbp]
	mov	QWORD PTR [rcx], rax
	mov	DWORD PTR 8[rcx], edx
	mov	rax, QWORD PTR 32[rbp]
	add	rsp, 120
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
	mov	rax, QWORD PTR [rbx]
	mov	edx, DWORD PTR 8[rbx]
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -24[rbp], edx
	mov	rbx, r8
	mov	rax, QWORD PTR [rbx]
	mov	edx, DWORD PTR 8[rbx]
	mov	QWORD PTR -48[rbp], rax
	mov	DWORD PTR -40[rbp], edx
/APP
 # 121 "main.c" 1
	.intel_syntax noprefix
	fld TBYTE PTR -32[rbp]
	fld TBYTE PTR -48[rbp]
	faddp
	fstp TBYTE PTR -16[rbp]
	
 # 0 "" 2
/NO_APP
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR -8[rbp]
	mov	rcx, QWORD PTR 32[rbp]
	mov	QWORD PTR [rcx], rax
	mov	DWORD PTR 8[rcx], edx
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
	mov	rax, QWORD PTR [rbx]
	mov	edx, DWORD PTR 8[rbx]
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -24[rbp], edx
	mov	rbx, r8
	mov	rax, QWORD PTR [rbx]
	mov	edx, DWORD PTR 8[rbx]
	mov	QWORD PTR -48[rbp], rax
	mov	DWORD PTR -40[rbp], edx
/APP
 # 136 "main.c" 1
	.intel_syntax noprefix
	fld TBYTE PTR -32[rbp]
	fld TBYTE PTR -48[rbp]
	fmulp
	fstp TBYTE PTR -16[rbp]
	
 # 0 "" 2
/NO_APP
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR -8[rbp]
	mov	rcx, QWORD PTR 32[rbp]
	mov	QWORD PTR [rcx], rax
	mov	DWORD PTR 8[rcx], edx
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
	mov	rax, QWORD PTR [rbx]
	mov	edx, DWORD PTR 8[rbx]
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -24[rbp], edx
/APP
 # 153 "main.c" 1
	.intel_syntax noprefix
	fld TBYTE PTR -32[rbp]
	fsin
	fstp TBYTE PTR -16[rbp]
	
 # 0 "" 2
/NO_APP
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR -8[rbp]
	mov	rcx, QWORD PTR 32[rbp]
	mov	QWORD PTR [rcx], rax
	mov	DWORD PTR 8[rcx], edx
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
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, DWORD PTR -8[rbp]
	mov	rcx, QWORD PTR 16[rbp]
	mov	QWORD PTR [rcx], rax
	mov	DWORD PTR 8[rcx], edx
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
	.ident	"GCC: (Rev10, Built by MSYS2 project) 11.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	clock;	.scl	2;	.type	32;	.endef
