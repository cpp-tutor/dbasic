	.cpu arm3
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"basic_lib.c"
	.text
	.align	2
	.global	print_string
	.arch armv2
	.syntax unified
	.arm
	.fpu vfp
	.type	print_string, %function
print_string:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldrb	r0, [r0]	@ zero_extendqisi2
	ldr	r2, .L15
	cmp	r0, #0
.LPIC0:
	add	r2, pc, r2
	popeq	{r4, r5, r6, r7, r8, pc}
	ldr	r3, .L15+4
	ldr	r7, .L15+8
	ldr	r5, .L15+12
	ldr	r6, [r2, r3]
.LPIC3:
	add	r7, pc, r7
.LPIC1:
	add	r5, pc, r5
.L2:
	ldr	r3, [r7]
.L13:
	cmp	r3, #74
	bgt	.L2
	ldr	r1, [r6]
	bl	putc(PLT)
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L13
	pop	{r4, r5, r6, r7, r8, pc}
.L16:
	.align	2
.L15:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC3+8)
	.word	.LANCHOR0-(.LPIC1+8)
	.size	print_string, .-print_string
	.align	2
	.global	print_number
	.syntax unified
	.arm
	.fpu vfp
	.type	print_number, %function
print_number:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r2, .L30
	sub	sp, sp, #28
	add	r5, sp, #8
.LPIC4:
	add	r2, pc, r2
	vstr.64	d0, [sp]
	mov	r0, r5
	mov	r1, #16
	bl	snprintf(PLT)
	ldrb	r0, [sp, #8]	@ zero_extendqisi2
	ldr	r2, .L30+4
	cmp	r0, #0
.LPIC5:
	add	r2, pc, r2
	beq	.L17
	ldr	r3, .L30+8
	ldr	r6, .L30+12
	ldr	r4, .L30+16
	ldr	r7, [r2, r3]
.LPIC8:
	add	r6, pc, r6
.LPIC6:
	add	r4, pc, r4
.L18:
	ldr	r3, [r6]
.L29:
	cmp	r3, #74
	bgt	.L18
	ldr	r1, [r7]
	bl	putc(PLT)
	ldr	r3, [r4]
	ldrb	r0, [r5, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r4]
	bne	.L29
.L17:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L31:
	.align	2
.L30:
	.word	.LC0-(.LPIC4+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC5+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC8+8)
	.word	.LANCHOR0-(.LPIC6+8)
	.size	print_number, .-print_number
	.align	2
	.global	print_integer
	.syntax unified
	.arm
	.fpu vfp
	.type	print_integer, %function
print_integer:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #20
	mov	r5, sp
	ldr	r2, .L45
	mov	r3, r0
.LPIC9:
	add	r2, pc, r2
	mov	r0, r5
	mov	r1, #16
	bl	snprintf(PLT)
	ldrb	r0, [sp]	@ zero_extendqisi2
	ldr	r2, .L45+4
	cmp	r0, #0
.LPIC10:
	add	r2, pc, r2
	beq	.L32
	ldr	r3, .L45+8
	ldr	r6, .L45+12
	ldr	r4, .L45+16
	ldr	r7, [r2, r3]
.LPIC13:
	add	r6, pc, r6
.LPIC11:
	add	r4, pc, r4
.L33:
	ldr	r3, [r6]
.L44:
	cmp	r3, #74
	bgt	.L33
	ldr	r1, [r7]
	bl	putc(PLT)
	ldr	r3, [r4]
	ldrb	r0, [r5, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r4]
	bne	.L44
.L32:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L46:
	.align	2
.L45:
	.word	.LC1-(.LPIC9+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC10+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC13+8)
	.word	.LANCHOR0-(.LPIC11+8)
	.size	print_integer, .-print_integer
	.align	2
	.global	print_newline
	.syntax unified
	.arm
	.fpu vfp
	.type	print_newline, %function
print_newline:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L49
	ldr	r2, .L49+4
.LPIC14:
	add	r3, pc, r3
	ldr	r3, [r3, r2]
	mov	r0, #10
	ldr	r1, [r3]
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L49+8
.LPIC15:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	pop	{r4, pc}
.L50:
	.align	2
.L49:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC14+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC15+8)
	.size	print_newline, .-print_newline
	.global	__aeabi_idivmod
	.align	2
	.global	print_comma
	.syntax unified
	.arm
	.fpu vfp
	.type	print_comma, %function
print_comma:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L61
	ldr	r2, .L61+4
.LPIC18:
	add	r3, pc, r3
	ldr	r5, .L61+8
	ldr	r6, [r3, r2]
.LPIC19:
	add	r5, pc, r5
.L60:
	ldr	r1, [r6]
	mov	r0, #32
	bl	putc(PLT)
	ldr	r4, [r5]
	add	r4, r4, #1
	str	r4, [r5]
	mov	r0, r4
	mov	r1, #15
	bl	__aeabi_idivmod(PLT)
	cmp	r1, #0
	bne	.L60
	cmp	r4, #60
	pople	{r4, r5, r6, pc}
	ldr	r1, [r6]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L61+12
.LPIC23:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, pc}
.L62:
	.align	2
.L61:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC18+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC19+8)
	.word	.LANCHOR0-(.LPIC23+8)
	.size	print_comma, .-print_comma
	.align	2
	.global	print_semicolon
	.syntax unified
	.arm
	.fpu vfp
	.type	print_semicolon, %function
print_semicolon:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L73
	ldr	r2, .L73+4
.LPIC26:
	add	r3, pc, r3
	ldr	r5, .L73+8
	ldr	r6, [r3, r2]
.LPIC27:
	add	r5, pc, r5
.L72:
	ldr	r1, [r6]
	mov	r0, #32
	bl	putc(PLT)
	ldr	r4, [r5]
	add	r4, r4, #1
	str	r4, [r5]
	mov	r0, r4
	mov	r1, #3
	bl	__aeabi_idivmod(PLT)
	cmp	r1, #0
	bne	.L72
	cmp	r4, #60
	pople	{r4, r5, r6, pc}
	ldr	r1, [r6]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L73+12
.LPIC31:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, pc}
.L74:
	.align	2
.L73:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC26+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC27+8)
	.word	.LANCHOR0-(.LPIC31+8)
	.size	print_semicolon, .-print_semicolon
	.align	2
	.global	read_number
	.syntax unified
	.arm
	.fpu vfp
	.type	read_number, %function
read_number:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r0
	mov	r5, #63
	ldr	r6, .L84
	ldr	r3, .L84+4
	ldr	r2, .L84+8
.LPIC36:
	add	r6, pc, r6
.LPIC35:
	add	r3, pc, r3
	ldr	r8, .L84+12
	ldr	r4, .L84+16
	ldr	r9, [r6, r2]
	ldr	r3, [r3]
	sub	sp, sp, #20
.LPIC34:
	add	r8, pc, r8
.LPIC37:
	add	r4, pc, r4
.L76:
	cmp	r3, #74
	bgt	.L76
	mov	r0, r5
	ldr	r1, [r9]
	bl	putc(PLT)
	ldr	r3, [r4]
	ldrb	r5, [r8, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r5, #0
	str	r3, [r4]
	bne	.L76
	ldr	r3, .L84+20
	ldr	r3, [r6, r3]
	mov	r6, sp
	ldr	r2, [r3]
	mov	r0, r6
	mov	r1, #16
	bl	fgets(PLT)
	ldr	r1, .L84+24
	mov	r2, r7
	mov	r0, r6
.LPIC39:
	add	r1, pc, r1
	bl	__isoc99_sscanf(PLT)
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	str	r5, [r4]
	str	r3, [r4, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L85:
	.align	2
.L84:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC36+8)
	.word	.LANCHOR0-(.LPIC35+8)
	.word	stdout(GOT)
	.word	.LC2-(.LPIC34+8)
	.word	.LANCHOR0-(.LPIC37+8)
	.word	stdin(GOT)
	.word	.LC3-(.LPIC39+8)
	.size	read_number, .-read_number
	.align	2
	.global	read_string
	.syntax unified
	.arm
	.fpu vfp
	.type	read_string, %function
read_string:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	ldr	r3, .L91
	ldr	r2, .L91+4
.LPIC43:
	add	r3, pc, r3
	ldr	r3, [r3, r2]
	ldr	r2, [r3]
	bl	fgets(PLT)
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #31
	bls	.L87
.L88:
	ldrb	r3, [r4, #1]!	@ zero_extendqisi2
	cmp	r3, #31
	bhi	.L88
.L87:
	mov	r1, #0
	ldr	r3, .L91+8
	strb	r1, [r4]
.LPIC44:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	pop	{r4, pc}
.L92:
	.align	2
.L91:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC43+8)
	.word	stdin(GOT)
	.word	.LANCHOR0-(.LPIC44+8)
	.size	read_string, .-read_string
	.align	2
	.global	random_lcg
	.syntax unified
	.arm
	.fpu vfp
	.type	random_lcg, %function
random_lcg:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L94+8
.LPIC47:
	add	r2, pc, r2
	ldr	r3, [r2]
	ldr	r1, .L94+12
	mul	r0, r1, r3
	add	r3, r0, #12288
	add	r3, r3, #57
	bic	r3, r3, #-2147483648
	vmov	s15, r3	@ int
	vcvt.f64.s32	d0, s15
	vldr.64	d7, .L94
	str	r3, [r2]
	vmul.f64	d0, d0, d7
	mov	pc, lr
.L95:
	.align	3
.L94:
	.word	0
	.word	1040187392
	.word	.LANCHOR1-(.LPIC47+8)
	.word	1103515245
	.size	random_lcg, .-random_lcg
	.align	2
	.global	runtime_error
	.syntax unified
	.arm
	.fpu vfp
	.type	runtime_error, %function
runtime_error:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r5, .L106
	sub	r3, r0, #1
	push	{r4, lr}
	mov	r6, r1
	mov	r4, r0
.LPIC56:
	add	r5, pc, r5
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L97
.L99:
	b	.L103
	b	.L102
	b	.L101
	b	.L100
	b	.L98
	.p2align 1
.L98:
	ldr	r0, .L106+4
.LPIC53:
	add	r0, pc, r0
	bl	print_string(PLT)
.L104:
	ldr	r0, .L106+8
.LPIC55:
	add	r0, pc, r0
	bl	print_string(PLT)
	mov	r0, r6
	bl	print_integer(PLT)
	ldr	r3, .L106+12
	ldr	r3, [r5, r3]
	mov	r0, #10
	ldr	r1, [r3]
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L106+16
.LPIC57:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	mov	r0, r4
	add	r2, r2, #1
	stm	r3, {r1, r2}
	bl	exit(PLT)
.L103:
	ldr	r0, .L106+20
.LPIC49:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L104
.L102:
	ldr	r0, .L106+24
.LPIC50:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L104
.L101:
	ldr	r0, .L106+28
.LPIC51:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L104
.L100:
	ldr	r0, .L106+32
.LPIC52:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L104
.L97:
	ldr	r0, .L106+36
.LPIC54:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L104
.L107:
	.align	2
.L106:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC56+8)
	.word	.LC8-(.LPIC53+8)
	.word	.LC10-(.LPIC55+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC57+8)
	.word	.LC4-(.LPIC49+8)
	.word	.LC5-(.LPIC50+8)
	.word	.LC6-(.LPIC51+8)
	.word	.LC7-(.LPIC52+8)
	.word	.LC9-(.LPIC54+8)
	.size	runtime_error, .-runtime_error
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	basic_run(PLT)
	.size	main, .-main
	.global	SemiColon
	.global	Comma
	.global	PrintWidth
	.global	TmpBufSz
	.global	vpos
	.global	pos
	.section	.rodata
	.align	2
	.type	SemiColon, %object
	.size	SemiColon, 4
SemiColon:
	.word	3
	.type	Comma, %object
	.size	Comma, 4
Comma:
	.word	15
	.type	PrintWidth, %object
	.size	PrintWidth, 4
PrintWidth:
	.word	75
	.type	TmpBufSz, %object
	.size	TmpBufSz, 4
TmpBufSz:
	.word	16
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	x.6576, %object
	.size	x.6576, 4
x.6576:
	.word	524288
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pos, %object
	.size	pos, 4
pos:
	.space	4
	.type	vpos, %object
	.size	vpos, 4
vpos:
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"% .6g\000"
	.space	2
.LC1:
	.ascii	"%d\000"
	.space	1
.LC2:
	.ascii	"? \000"
	.space	1
.LC3:
	.ascii	"%lf\000"
.LC4:
	.ascii	"OUT OF DATA\000"
.LC5:
	.ascii	"ALREADY IN GOSUB\000"
	.space	3
.LC6:
	.ascii	"NOT IN GOSUB\000"
	.space	3
.LC7:
	.ascii	"INDEX OUT OF BOUNDS\000"
.LC8:
	.ascii	"NESTED ARRAY EXPRESSION\000"
.LC9:
	.ascii	"RUNTIME ERROR\000"
	.space	2
.LC10:
	.ascii	" AT LINE \000"
	.ident	"GCC: (Debian 8.3.0-2) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
