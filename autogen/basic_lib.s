	.cpu arm3
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"basic_lib.c"
	.text
	.global	pos
	.bss
	.align	2
	.type	pos, %object
	.size	pos, 4
pos:
	.space	4
	.global	vpos
	.align	2
	.type	vpos, %object
	.size	vpos, 4
vpos:
	.space	4
	.global	TmpBufSz
	.section	.rodata
	.align	2
	.type	TmpBufSz, %object
	.size	TmpBufSz, 4
TmpBufSz:
	.word	16
	.global	PrintWidth
	.align	2
	.type	PrintWidth, %object
	.size	PrintWidth, 4
PrintWidth:
	.word	75
	.global	Comma
	.align	2
	.type	Comma, %object
	.size	Comma, 4
Comma:
	.word	15
	.global	SemiColon
	.align	2
	.type	SemiColon, %object
	.size	SemiColon, 4
SemiColon:
	.word	3
	.text
	.align	2
	.global	print_string
	.arch armv2
	.syntax unified
	.arm
	.fpu vfp
	.type	print_string, %function
print_string:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	b	.L2
.L4:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	str	r2, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	putchar(PLT)
	ldr	r3, .L6
.LPIC0:
	add	r3, pc, r3
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r3, .L6+4
.LPIC1:
	add	r3, pc, r3
	str	r2, [r3]
.L3:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2
	ldr	r3, .L6+8
.LPIC2:
	add	r3, pc, r3
	ldr	r3, [r3]
	cmp	r3, #74
	ble	.L4
.L2:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L7:
	.align	2
.L6:
	.word	pos-(.LPIC0+8)
	.word	pos-(.LPIC1+8)
	.word	pos-(.LPIC2+8)
	.size	print_string, .-print_string
	.section	.rodata
	.align	2
.LC0:
	.ascii	" %.6g\000"
	.text
	.align	2
	.global	print_number
	.syntax unified
	.arm
	.fpu vfp
	.type	print_number, %function
print_number:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #24
	vstr.64	d0, [fp, #-28]
	mov	r3, sp
	mov	r5, r3
	mov	r3, #16
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	mov	r3, #16
	mov	r1, r3
	mov	r2, #0
	mov	r3, #0
	mov	r4, #0
	lsl	r4, r2, #3
	orr	r4, r4, r1, lsr #29
	lsl	r3, r1, #3
	mov	r3, #16
	mov	r1, r3
	mov	r2, #0
	mov	r3, #0
	mov	r4, #0
	lsl	r4, r2, #3
	orr	r4, r4, r1, lsr #29
	lsl	r3, r1, #3
	mov	r3, #16
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	add	r3, sp, #8
	add	r3, r3, #0
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	mov	r3, #16
	mov	r1, r3
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	stm	sp, {r3-r4}
	ldr	r3, .L9
.LPIC3:
	add	r3, pc, r3
	mov	r2, r3
	bl	snprintf(PLT)
	ldr	r3, [fp, #-20]
	mov	r0, r3
	bl	print_string(PLT)
	mov	sp, r5
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
.L10:
	.align	2
.L9:
	.word	.LC0-(.LPIC3+8)
	.size	print_number, .-print_number
	.align	2
	.global	print_newline
	.syntax unified
	.arm
	.fpu vfp
	.type	print_newline, %function
print_newline:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #10
	bl	putchar(PLT)
	ldr	r3, .L12
.LPIC4:
	add	r3, pc, r3
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L12+4
.LPIC5:
	add	r3, pc, r3
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r3, .L12+8
.LPIC6:
	add	r3, pc, r3
	str	r2, [r3]
	nop
	pop	{fp, pc}
.L13:
	.align	2
.L12:
	.word	pos-(.LPIC4+8)
	.word	vpos-(.LPIC5+8)
	.word	vpos-(.LPIC6+8)
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
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #32
	bl	putchar(PLT)
	b	.L15
.L16:
	mov	r0, #32
	bl	putchar(PLT)
.L15:
	ldr	r3, .L19
.LPIC7:
	add	r3, pc, r3
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r3, .L19+4
.LPIC8:
	add	r3, pc, r3
	str	r2, [r3]
	ldr	r3, .L19+8
.LPIC9:
	add	r3, pc, r3
	ldr	r3, [r3]
	mov	r2, #15
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idivmod(PLT)
	mov	r3, r1
	cmp	r3, #0
	bne	.L16
	ldr	r3, .L19+12
.LPIC10:
	add	r3, pc, r3
	ldr	r3, [r3]
	mov	r2, #15
	add	r3, r3, r2
	mov	r2, #75
	cmp	r3, r2
	ble	.L18
	mov	r0, #10
	bl	putchar(PLT)
	ldr	r3, .L19+16
.LPIC11:
	add	r3, pc, r3
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L19+20
.LPIC12:
	add	r3, pc, r3
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r3, .L19+24
.LPIC13:
	add	r3, pc, r3
	str	r2, [r3]
.L18:
	nop
	pop	{fp, pc}
.L20:
	.align	2
.L19:
	.word	pos-(.LPIC7+8)
	.word	pos-(.LPIC8+8)
	.word	pos-(.LPIC9+8)
	.word	pos-(.LPIC10+8)
	.word	pos-(.LPIC11+8)
	.word	vpos-(.LPIC12+8)
	.word	vpos-(.LPIC13+8)
	.size	print_comma, .-print_comma
	.align	2
	.global	print_semicolon
	.syntax unified
	.arm
	.fpu vfp
	.type	print_semicolon, %function
print_semicolon:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #32
	bl	putchar(PLT)
	b	.L22
.L23:
	mov	r0, #32
	bl	putchar(PLT)
.L22:
	ldr	r3, .L26
.LPIC14:
	add	r3, pc, r3
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r3, .L26+4
.LPIC15:
	add	r3, pc, r3
	str	r2, [r3]
	ldr	r3, .L26+8
.LPIC16:
	add	r3, pc, r3
	ldr	r3, [r3]
	mov	r2, #3
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idivmod(PLT)
	mov	r3, r1
	cmp	r3, #0
	bne	.L23
	ldr	r3, .L26+12
.LPIC17:
	add	r3, pc, r3
	ldr	r3, [r3]
	mov	r2, #15
	add	r3, r3, r2
	mov	r2, #75
	cmp	r3, r2
	ble	.L25
	mov	r0, #10
	bl	putchar(PLT)
	ldr	r3, .L26+16
.LPIC18:
	add	r3, pc, r3
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L26+20
.LPIC19:
	add	r3, pc, r3
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r3, .L26+24
.LPIC20:
	add	r3, pc, r3
	str	r2, [r3]
.L25:
	nop
	pop	{fp, pc}
.L27:
	.align	2
.L26:
	.word	pos-(.LPIC14+8)
	.word	pos-(.LPIC15+8)
	.word	pos-(.LPIC16+8)
	.word	pos-(.LPIC17+8)
	.word	pos-(.LPIC18+8)
	.word	vpos-(.LPIC19+8)
	.word	vpos-(.LPIC20+8)
	.size	print_semicolon, .-print_semicolon
	.section	.rodata
	.align	2
.LC1:
	.ascii	"? \000"
	.align	2
.LC2:
	.ascii	"%lf\000"
	.text
	.align	2
	.global	read_number
	.syntax unified
	.arm
	.fpu vfp
	.type	read_number, %function
read_number:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #20
	str	r0, [fp, #-32]
	ldr	r5, .L29
.LPIC22:
	add	r5, pc, r5
	mov	r3, sp
	mov	r6, r3
	mov	r3, #16
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	mov	r3, #16
	mov	r1, r3
	mov	r2, #0
	mov	r3, #0
	mov	r4, #0
	lsl	r4, r2, #3
	orr	r4, r4, r1, lsr #29
	lsl	r3, r1, #3
	mov	r3, #16
	mov	r1, r3
	mov	r2, #0
	mov	r3, #0
	mov	r4, #0
	lsl	r4, r2, #3
	orr	r4, r4, r1, lsr #29
	lsl	r3, r1, #3
	mov	r3, #16
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	mov	r3, sp
	add	r3, r3, #0
	str	r3, [fp, #-28]
	bl	print_newline(PLT)
	ldr	r3, .L29+4
.LPIC21:
	add	r3, pc, r3
	mov	r0, r3
	bl	print_string(PLT)
	ldr	r0, [fp, #-28]
	mov	r1, #16
	ldr	r3, .L29+8
	ldr	r3, [r5, r3]
	ldr	r3, [r3]
	mov	r2, r3
	bl	fgets(PLT)
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	ldr	r1, .L29+12
.LPIC23:
	add	r1, pc, r1
	mov	r0, r3
	bl	__isoc99_sscanf(PLT)
	mov	sp, r6
	nop
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, fp, pc}
.L30:
	.align	2
.L29:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC22+8)
	.word	.LC1-(.LPIC21+8)
	.word	stdin(GOT)
	.word	.LC2-(.LPIC23+8)
	.size	read_number, .-read_number
	.align	2
	.global	read_string
	.syntax unified
	.arm
	.fpu vfp
	.type	read_string, %function
read_string:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r2, .L34
.LPIC24:
	add	r2, pc, r2
	ldr	r1, [fp, #-20]
	ldr	r3, .L34+4
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r0, [fp, #-16]
	bl	fgets(PLT)
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	b	.L32
.L33:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L32:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #31
	bhi	.L33
	ldr	r3, [fp, #-8]
	mov	r2, #0
	strb	r2, [r3]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC24+8)
	.word	stdin(GOT)
	.size	read_string, .-read_string
	.align	2
	.global	random_lcg
	.syntax unified
	.arm
	.fpu vfp
	.type	random_lcg, %function
random_lcg:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L38+8
.LPIC25:
	add	r3, pc, r3
	ldr	r1, [r3]
	ldr	r2, .L38+12
	mul	r3, r2, r1
	add	r3, r3, #12288
	add	r3, r3, #57
	bic	r2, r3, #-2147483648
	ldr	r3, .L38+16
.LPIC26:
	add	r3, pc, r3
	str	r2, [r3]
	ldr	r3, .L38+20
.LPIC27:
	add	r3, pc, r3
	ldr	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f64.u32	d7, s15
	vldr.64	d6, .L38
	vdiv.f64	d5, d7, d6
	vmov.f64	d7, d5
	vmov.f64	d0, d7
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	mov	pc, lr
.L39:
	.align	3
.L38:
	.word	0
	.word	1105199104
	.word	x.6509-(.LPIC25+8)
	.word	1103515245
	.word	x.6509-(.LPIC26+8)
	.word	x.6509-(.LPIC27+8)
	.size	random_lcg, .-random_lcg
	.section	.rodata
	.align	2
.LC3:
	.ascii	"OUT OF DATA\000"
	.align	2
.LC4:
	.ascii	"ALREADY IN GOSUB\000"
	.align	2
.LC5:
	.ascii	"NOT IN GOSUB\000"
	.align	2
.LC6:
	.ascii	"INDEX OUT OF BOUNDS\000"
	.align	2
.LC7:
	.ascii	"NESTED ARRAY EXPRESSION\000"
	.align	2
.LC8:
	.ascii	"RUNTIME ERROR\000"
	.align	2
.LC9:
	.ascii	" AT LINE\000"
	.text
	.align	2
	.global	runtime_error
	.syntax unified
	.arm
	.fpu vfp
	.type	runtime_error, %function
runtime_error:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L41
.L43:
	b	.L47
	b	.L46
	b	.L45
	b	.L44
	b	.L42
	.p2align 1
.L47:
	ldr	r3, .L50
.LPIC28:
	add	r3, pc, r3
	mov	r0, r3
	bl	print_string(PLT)
	b	.L48
.L46:
	ldr	r3, .L50+4
.LPIC29:
	add	r3, pc, r3
	mov	r0, r3
	bl	print_string(PLT)
	b	.L48
.L45:
	ldr	r3, .L50+8
.LPIC30:
	add	r3, pc, r3
	mov	r0, r3
	bl	print_string(PLT)
	b	.L48
.L44:
	ldr	r3, .L50+12
.LPIC31:
	add	r3, pc, r3
	mov	r0, r3
	bl	print_string(PLT)
	b	.L48
.L42:
	ldr	r3, .L50+16
.LPIC32:
	add	r3, pc, r3
	mov	r0, r3
	bl	print_string(PLT)
	b	.L48
.L41:
	ldr	r3, .L50+20
.LPIC33:
	add	r3, pc, r3
	mov	r0, r3
	bl	print_string(PLT)
	nop
.L48:
	ldr	r3, [fp, #-12]
	cmn	r3, #1
	beq	.L49
	ldr	r3, .L50+24
.LPIC34:
	add	r3, pc, r3
	mov	r0, r3
	bl	print_string(PLT)
	ldr	r3, [fp, #-12]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vmov.f64	d0, d7
	bl	print_number(PLT)
.L49:
	bl	print_newline(PLT)
	ldr	r0, [fp, #-8]
	bl	exit(PLT)
.L51:
	.align	2
.L50:
	.word	.LC3-(.LPIC28+8)
	.word	.LC4-(.LPIC29+8)
	.word	.LC5-(.LPIC30+8)
	.word	.LC6-(.LPIC31+8)
	.word	.LC7-(.LPIC32+8)
	.word	.LC8-(.LPIC33+8)
	.word	.LC9-(.LPIC34+8)
	.size	runtime_error, .-runtime_error
	.section	.rodata
	.align	2
.LC10:
	.ascii	"%g%g%g\012\000"
	.align	2
.LC11:
	.ascii	"%g%g%g%g\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #60
	mov	r3, #0
	mov	r4, #1069547520
	add	r4, r4, #3670016
	str	r3, [fp, #-20]
	str	r4, [fp, #-16]
	adr	r4, .L54
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	stm	sp, {r3-r4}
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	ldr	r1, .L54+24
.LPIC35:
	add	r1, pc, r1
	mov	r0, r1
	bl	printf(PLT)
	vldr.64	d1, [fp, #-28]
	vldr.64	d0, [fp, #-20]
	bl	pow(PLT)
	vstr.64	d0, [fp, #-36]
	vldr.64	d7, [fp, #-36]
	vldr.64	d6, .L54+8
	vmul.f64	d6, d7, d6
	vldr.64	d4, .L54+16
	vldr.64	d7, [fp, #-36]
	vdiv.f64	d5, d4, d7
	vldr.64	d7, [fp, #-20]
	vadd.f64	d4, d5, d7
	vldr.64	d5, [fp, #-28]
	vdiv.f64	d7, d4, d5
	vadd.f64	d7, d6, d7
	vstr.64	d7, [fp, #-44]
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	str	r3, [sp, #16]
	str	r4, [sp, #20]
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	str	r3, [sp, #8]
	str	r4, [sp, #12]
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	stm	sp, {r3-r4}
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	ldr	r1, .L54+28
.LPIC36:
	add	r1, pc, r1
	mov	r0, r1
	bl	printf(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
.L55:
	.align	3
.L54:
	.word	858993459
	.word	1074213683
	.word	0
	.word	1074266112
	.word	0
	.word	1075576832
	.word	.LC10-(.LPIC35+8)
	.word	.LC11-(.LPIC36+8)
	.size	main, .-main
	.data
	.align	2
	.type	x.6509, %object
	.size	x.6509, 4
x.6509:
	.word	524288
	.ident	"GCC: (Debian 8.3.0-2) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
