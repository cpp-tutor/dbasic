	.cpu arm710t
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
	.arch armv4t
	.syntax unified
	.arm
	.fpu vfp
	.type	print_string, %function
print_string:
	@ Function supports interworking.
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
	bl	putchar
	ldr	r3, .L6
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L6
	str	r3, [r2]
.L3:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2
	ldr	r3, .L6
	ldr	r3, [r3]
	cmp	r3, #74
	ble	.L4
.L2:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	pos
	.size	print_string, .-print_string
	.section	.rodata
	.align	2
.LC0:
	.ascii	"% .6g\000"
	.text
	.align	2
	.global	print_number
	.syntax unified
	.arm
	.fpu vfp
	.type	print_number, %function
print_number:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #28
	vstr.64	d0, [fp, #-36]
	mov	r3, sp
	mov	r6, r3
	mov	r3, #16
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	mov	r3, #16
	mov	r2, r3
	mov	r3, #0
	mov	r4, r2
	mov	r5, r3
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r5, #3
	orr	r3, r3, r4, lsr #29
	lsl	r2, r4, #3
	mov	r3, #16
	mov	r2, r3
	mov	r3, #0
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r1, #3
	orr	r3, r3, r0, lsr #29
	lsl	r2, r0, #3
	mov	r3, #16
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	add	r3, sp, #8
	add	r3, r3, #0
	str	r3, [fp, #-28]
	mov	r3, #16
	mov	r1, r3
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	ldr	r2, .L9
	ldr	r0, [fp, #-28]
	bl	snprintf
	ldr	r0, [fp, #-28]
	bl	print_string
	mov	sp, r6
	nop
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LC0
	.size	print_number, .-print_number
	.section	.rodata
	.align	2
.LC1:
	.ascii	"%d\000"
	.text
	.align	2
	.global	print_integer
	.syntax unified
	.arm
	.fpu vfp
	.type	print_integer, %function
print_integer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #20
	str	r0, [fp, #-40]
	mov	r3, sp
	mov	r8, r3
	mov	r3, #16
	sub	r3, r3, #1
	str	r3, [fp, #-32]
	mov	r3, #16
	mov	r2, r3
	mov	r3, #0
	mov	r6, r2
	mov	r7, r3
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r7, #3
	orr	r3, r3, r6, lsr #29
	lsl	r2, r6, #3
	mov	r3, #16
	mov	r2, r3
	mov	r3, #0
	mov	r4, r2
	mov	r5, r3
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r5, #3
	orr	r3, r3, r4, lsr #29
	lsl	r2, r4, #3
	mov	r3, #16
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	mov	r3, sp
	add	r3, r3, #0
	str	r3, [fp, #-36]
	mov	r3, #16
	mov	r1, r3
	ldr	r3, [fp, #-40]
	ldr	r2, .L12
	ldr	r0, [fp, #-36]
	bl	snprintf
	ldr	r0, [fp, #-36]
	bl	print_string
	mov	sp, r8
	nop
	sub	sp, fp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LC1
	.size	print_integer, .-print_integer
	.align	2
	.global	print_newline
	.syntax unified
	.arm
	.fpu vfp
	.type	print_newline, %function
print_newline:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #10
	bl	putchar
	ldr	r3, .L15
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L15+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L15+4
	str	r3, [r2]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	pos
	.word	vpos
	.size	print_newline, .-print_newline
	.global	__aeabi_idivmod
	.align	2
	.global	print_comma
	.syntax unified
	.arm
	.fpu vfp
	.type	print_comma, %function
print_comma:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #32
	bl	putchar
	b	.L18
.L19:
	mov	r0, #32
	bl	putchar
.L18:
	ldr	r3, .L22
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L22
	str	r3, [r2]
	ldr	r3, .L22
	ldr	r3, [r3]
	mov	r2, #15
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	cmp	r3, #0
	bne	.L19
	ldr	r3, .L22
	ldr	r3, [r3]
	mov	r2, #15
	add	r3, r3, r2
	mov	r2, #75
	cmp	r3, r2
	ble	.L21
	mov	r0, #10
	bl	putchar
	ldr	r3, .L22
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L22+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L22+4
	str	r3, [r2]
.L21:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	pos
	.word	vpos
	.size	print_comma, .-print_comma
	.align	2
	.global	print_semicolon
	.syntax unified
	.arm
	.fpu vfp
	.type	print_semicolon, %function
print_semicolon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #32
	bl	putchar
	ldr	r3, .L27
	ldr	r3, [r3]
	mov	r2, #15
	add	r3, r3, r2
	mov	r2, #75
	cmp	r3, r2
	ble	.L26
	mov	r0, #10
	bl	putchar
	ldr	r3, .L27
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L27+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L27+4
	str	r3, [r2]
.L26:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	pos
	.word	vpos
	.size	print_semicolon, .-print_semicolon
	.section	.rodata
	.align	2
.LC2:
	.ascii	"OUT OF DATA\000"
	.align	2
.LC3:
	.ascii	"ALREADY IN GOSUB\000"
	.align	2
.LC4:
	.ascii	"NOT IN GOSUB\000"
	.align	2
.LC5:
	.ascii	"INDEX OUT OF BOUNDS\000"
	.align	2
.LC6:
	.ascii	"NESTED ARRAY EXPRESSION\000"
	.align	2
.LC7:
	.ascii	"DIM TOO SMALL\000"
	.align	2
.LC8:
	.ascii	"BAD MATRIX SIZE\000"
	.align	2
.LC9:
	.ascii	"RUNTIME ERROR\000"
	.align	2
.LC10:
	.ascii	" IN \000"
	.text
	.align	2
	.global	runtime_error
	.syntax unified
	.arm
	.fpu vfp
	.type	runtime_error, %function
runtime_error:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	mov	r3, r1
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L30
.L32:
	.word	.L38
	.word	.L37
	.word	.L36
	.word	.L35
	.word	.L34
	.word	.L33
	.word	.L31
.L38:
	ldr	r0, .L41
	bl	print_string
	b	.L39
.L37:
	ldr	r0, .L41+4
	bl	print_string
	b	.L39
.L36:
	ldr	r0, .L41+8
	bl	print_string
	b	.L39
.L35:
	ldr	r0, .L41+12
	bl	print_string
	b	.L39
.L34:
	ldr	r0, .L41+16
	bl	print_string
	b	.L39
.L33:
	ldr	r0, .L41+20
	bl	print_string
	b	.L39
.L31:
	ldr	r0, .L41+24
	bl	print_string
	b	.L39
.L30:
	ldr	r0, .L41+28
	bl	print_string
	nop
.L39:
	ldrsh	r3, [fp, #-10]
	cmn	r3, #1
	beq	.L40
	ldr	r0, .L41+32
	bl	print_string
	ldrsh	r3, [fp, #-10]
	mov	r0, r3
	bl	print_integer
.L40:
	bl	print_newline
	ldr	r0, [fp, #-8]
	bl	exit
.L42:
	.align	2
.L41:
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.size	runtime_error, .-runtime_error
	.align	2
	.global	mat_print
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_print, %function
mat_print:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	mov	r3, r1
	strb	r3, [fp, #-25]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-8]
	bl	print_newline
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L44
.L52:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L45
.L48:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	vldr.64	d7, [r3]
	vmov.f64	d0, d7
	bl	print_number
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bcs	.L46
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L47
	bl	print_semicolon
	b	.L46
.L47:
	bl	print_comma
.L46:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L45:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bne	.L48
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #1
	bls	.L49
	bl	print_newline
	b	.L50
.L49:
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L51
	bl	print_semicolon
	b	.L50
.L51:
	bl	print_comma
.L50:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L44:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bne	.L52
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #1
	bne	.L54
	bl	print_newline
.L54:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_print, .-mat_print
	.align	2
	.global	mat_read
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_read, %function
mat_read:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, r2
	strh	r3, [fp, #-30]	@ movhi
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L56
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bls	.L57
.L56:
	ldrsh	r3, [fp, #-30]
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error
.L57:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L58
.L62:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L59
.L61:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L60
	ldrsh	r3, [fp, #-30]
	mov	r1, r3
	mov	r0, #1
	bl	runtime_error
.L60:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-28]
	str	r1, [r2]
	ldr	r2, [fp, #-16]
	add	r2, r2, #1
	lsl	r2, r2, #3
	ldr	r1, [fp, #-8]
	add	r1, r1, r2
	ldr	r2, [fp, #-28]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L59:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bne	.L61
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L58:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bne	.L62
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_read, .-mat_read
	.align	2
	.global	mat_add
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_add, %function
mat_add:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	strh	r3, [fp, #-42]	@ movhi
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L64
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	beq	.L65
.L64:
	ldrsh	r3, [fp, #-42]
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error
.L65:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L66
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bls	.L67
.L66:
	ldrsh	r3, [fp, #-42]
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error
.L67:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L68
.L71:
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L69
.L70:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	vldr.64	d6, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	vldr.64	d7, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	vadd.f64	d7, d6, d7
	vstr.64	d7, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L69:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	bne	.L70
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L68:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	bne	.L71
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_add, .-mat_add
	.align	2
	.global	mat_sub
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_sub, %function
mat_sub:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	strh	r3, [fp, #-42]	@ movhi
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L73
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	beq	.L74
.L73:
	ldrsh	r3, [fp, #-42]
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error
.L74:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L75
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bls	.L76
.L75:
	ldrsh	r3, [fp, #-42]
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error
.L76:
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L77
.L80:
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L78
.L79:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	vldr.64	d6, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	vldr.64	d7, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	vsub.f64	d7, d6, d7
	vstr.64	d7, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L78:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	bne	.L79
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L77:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	bne	.L80
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_sub, .-mat_sub
	.align	2
	.global	mat_mul
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_mul, %function
mat_mul:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	strh	r3, [fp, #-34]	@ movhi
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L82
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error
.L82:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L83
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bls	.L84
.L83:
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error
.L84:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L85
.L90:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L86
.L89:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r1, r2, r3
	mov	r2, #0
	mov	r3, #0
	stm	r1, {r2-r3}
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L87
.L88:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	vldr.64	d6, [r3]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	ldr	r1, [fp, #-12]
	add	r1, r1, #1
	mul	r1, r3, r1
	ldr	r3, [fp, #-20]
	add	r3, r1, r3
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	vldr.64	d5, [r3]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	ldr	r1, [fp, #-20]
	add	r1, r1, #1
	mul	r1, r3, r1
	ldr	r3, [fp, #-16]
	add	r3, r1, r3
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	vldr.64	d7, [r3]
	vmul.f64	d7, d5, d7
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	vadd.f64	d7, d6, d7
	vstr.64	d7, [r3]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L87:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	bne	.L88
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L86:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bne	.L89
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L85:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bne	.L90
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_mul, .-mat_mul
	.align	2
	.global	mat_zer_con
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_zer_con, %function
mat_zer_con:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	mov	r3, r1
	strh	r3, [fp, #-26]	@ movhi
	mov	r3, r2
	strb	r3, [fp, #-27]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L92
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bls	.L93
.L92:
	ldrsh	r3, [fp, #-26]
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error
.L93:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L94
.L99:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L95
.L98:
	ldrb	r3, [fp, #-27]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L96
	mov	r2, #0
	ldr	r3, .L100
	b	.L97
.L96:
	mov	r2, #0
	mov	r3, #0
.L97:
	ldr	r1, [fp, #-16]
	add	r1, r1, #1
	lsl	r1, r1, #3
	ldr	r0, [fp, #-8]
	add	r1, r0, r1
	stm	r1, {r2-r3}
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L95:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bne	.L98
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L94:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bne	.L99
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	1072693248
	.size	mat_zer_con, .-mat_zer_con
	.align	2
	.global	mat_idn
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_idn, %function
mat_idn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	mov	r3, r1
	strh	r3, [fp, #-26]	@ movhi
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L103
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bls	.L104
.L103:
	ldrsh	r3, [fp, #-26]
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error
.L104:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L105
.L110:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L106
.L109:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L107
	mov	r2, #0
	ldr	r3, .L111
	b	.L108
.L107:
	mov	r2, #0
	mov	r3, #0
.L108:
	ldr	r1, [fp, #-16]
	add	r1, r1, #1
	lsl	r1, r1, #3
	ldr	r0, [fp, #-8]
	add	r1, r0, r1
	stm	r1, {r2-r3}
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L106:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bne	.L109
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L105:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bne	.L110
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	1072693248
	.size	mat_idn, .-mat_idn
	.align	2
	.global	mat_trn
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_trn, %function
mat_trn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, r2
	strh	r3, [fp, #-30]	@ movhi
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bhi	.L114
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3]
	cmp	r2, r3
	bls	.L115
.L114:
	ldrsh	r3, [fp, #-30]
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error
.L115:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r2, #4]
	str	r2, [r3]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r2]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L116
.L119:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L117
.L118:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	ldr	r1, [fp, #-16]
	add	r1, r1, #1
	mul	r1, r3, r1
	ldr	r3, [fp, #-12]
	add	r3, r1, r3
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r2, r2, #1
	lsl	r2, r2, #3
	ldr	r1, [fp, #-8]
	add	r1, r1, r2
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L117:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bne	.L118
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L116:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bne	.L119
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_trn, .-mat_trn
	.align	2
	.global	mat_minor
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_minor, %function
mat_minor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	ldr	r2, [fp, #-28]
	sub	r2, r2, #1
	mul	r3, r2, r3
	lsl	r3, r3, #3
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L121
.L125:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L122
.L124:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	beq	.L123
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	beq	.L123
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	mul	r2, r3, r2
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r1, [fp, #-8]
	add	r2, r1, #8
	str	r2, [fp, #-8]
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
.L123:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L122:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L124
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L121:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L125
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_minor, .-mat_minor
	.align	2
	.global	mat_det
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_det, %function
mat_det:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	vpush.64	{d8}
	add	fp, sp, #12
	sub	sp, sp, #24
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r3, #2
	beq	.L128
	ldr	r3, [fp, #-36]
	cmp	r3, #2
	bhi	.L129
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L130
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	beq	.L131
	b	.L129
.L130:
	mov	r2, #0
	ldr	r3, .L138+16
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	b	.L132
.L131:
	ldr	r3, [fp, #-32]
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	b	.L132
.L128:
	ldr	r3, [fp, #-32]
	vldr.64	d6, [r3]
	ldr	r3, [fp, #-32]
	add	r3, r3, #24
	vldr.64	d7, [r3]
	vmul.f64	d6, d6, d7
	ldr	r3, [fp, #-32]
	add	r3, r3, #8
	vldr.64	d5, [r3]
	ldr	r3, [fp, #-32]
	add	r3, r3, #16
	vldr.64	d7, [r3]
	vmul.f64	d7, d5, d7
	vsub.f64	d7, d6, d7
	vstr.64	d7, [fp, #-20]
	b	.L132
.L129:
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L133
.L136:
	ldr	r3, [fp, #-24]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L134
	vldr.64	d6, .L138
	b	.L135
.L134:
	vldr.64	d6, .L138+8
.L135:
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	vldr.64	d7, [r3]
	vmul.f64	d8, d6, d7
	ldr	r3, [fp, #-24]
	mov	r2, #0
	ldr	r1, [fp, #-36]
	ldr	r0, [fp, #-32]
	bl	mat_minor
	mov	r2, r0
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	mat_det
	vmov.f64	d7, d0
	vmul.f64	d7, d8, d7
	vldr.64	d6, [fp, #-20]
	vadd.f64	d7, d6, d7
	vstr.64	d7, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L133:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bne	.L136
	nop
.L132:
	ldr	r0, [fp, #-32]
	bl	free
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	vmov	d7, r2, r3
	vmov.f64	d0, d7
	sub	sp, fp, #12
	@ sp needed
	vldm	sp!, {d8}
	pop	{fp, lr}
	bx	lr
.L139:
	.align	3
.L138:
	.word	0
	.word	-1074790400
	.word	0
	.word	1072693248
	.word	1072693248
	.size	mat_det, .-mat_det
	.align	2
	.global	mat_inv
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_inv, %function
mat_inv:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	vpush.64	{d8}
	add	fp, sp, #12
	sub	sp, sp, #64
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]
	str	r2, [fp, #-72]
	strh	r3, [fp, #-74]	@ movhi
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	beq	.L141
	ldrsh	r3, [fp, #-74]
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error
.L141:
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-64]
	ldr	r3, [r3]
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L142
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-64]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bls	.L143
.L142:
	ldrsh	r3, [fp, #-74]
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error
.L143:
	ldr	r3, [fp, #-68]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-52]
	str	r2, [r3, #4]
	ldr	r2, [fp, #-64]
	ldr	r2, [r2, #4]
	ldr	r3, [r3, #4]
	str	r3, [r2]
	ldr	r3, [fp, #-52]
	mov	r2, r3
	mul	r2, r3, r2
	mov	r3, r2
	lsl	r3, r3, #3
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-68]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-68]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L144
.L147:
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L145
.L146:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	ldr	r1, [fp, #-52]
	mul	r1, r2, r1
	ldr	r2, [fp, #-24]
	add	r2, r1, r2
	lsl	r2, r2, #3
	ldr	r1, [fp, #-56]
	add	r1, r1, r2
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L145:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	bne	.L146
	ldr	r3, [fp, #-68]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L144:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	bne	.L147
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L148
.L151:
	ldr	r3, [fp, #-40]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L149
	vldr.64	d6, .L161
	b	.L150
.L149:
	vldr.64	d6, .L161+8
.L150:
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	vldr.64	d7, [r3]
	vmul.f64	d8, d6, d7
	ldr	r3, [fp, #-40]
	mov	r2, #0
	ldr	r1, [fp, #-52]
	ldr	r0, [fp, #-56]
	bl	mat_minor
	mov	r2, r0
	ldr	r3, [fp, #-52]
	sub	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	mat_det
	vmov.f64	d7, d0
	vmul.f64	d7, d8, d7
	vldr.64	d6, [fp, #-36]
	vadd.f64	d7, d6, d7
	vstr.64	d7, [fp, #-36]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L148:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	bne	.L151
	ldr	r3, [fp, #-64]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-64]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L152
.L159:
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L153
.L158:
	vldr.64	d7, [fp, #-36]
	vcmp.f64	d7, #0
	vmrs	APSR_nzcv, FPSCR
	beq	.L154
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L155
	vldr.64	d8, .L161
	b	.L156
.L155:
	vldr.64	d8, .L161+8
.L156:
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-48]
	ldr	r1, [fp, #-52]
	ldr	r0, [fp, #-56]
	bl	mat_minor
	mov	r2, r0
	ldr	r3, [fp, #-52]
	sub	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	mat_det
	vmov.f64	d7, d0
	vmul.f64	d5, d8, d7
	vldr.64	d6, [fp, #-36]
	vdiv.f64	d7, d5, d6
	b	.L157
.L154:
	vldr.64	d7, .L161+16
.L157:
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	vstr.64	d7, [r3]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L153:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	bne	.L158
	ldr	r3, [fp, #-64]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L152:
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	bne	.L159
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	beq	.L160
	ldr	r1, [fp, #-72]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
.L160:
	ldr	r0, [fp, #-56]
	bl	free
	nop
	sub	sp, fp, #12
	@ sp needed
	vldm	sp!, {d8}
	pop	{fp, lr}
	bx	lr
.L162:
	.align	3
.L161:
	.word	0
	.word	-1074790400
	.word	0
	.word	1072693248
	.word	0
	.word	0
	.size	mat_inv, .-mat_inv
	.align	2
	.global	mat_scalar
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_scalar, %function
mat_scalar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	vstr.64	d0, [fp, #-36]
	mov	r3, r2
	strh	r3, [fp, #-38]	@ movhi
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L164
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bls	.L165
.L164:
	ldrsh	r3, [fp, #-38]
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error
.L165:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L166
.L169:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L167
.L168:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	ldr	r1, [fp, #-12]
	add	r1, r1, #1
	mul	r1, r3, r1
	ldr	r3, [fp, #-16]
	add	r3, r1, r3
	add	r3, r3, #1
	lsl	r3, r3, #3
	add	r3, r2, r3
	vldr.64	d6, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	vldr.64	d7, [fp, #-36]
	vmul.f64	d7, d6, d7
	vstr.64	d7, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L167:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bne	.L168
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L166:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bne	.L169
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mat_scalar, .-mat_scalar
	.section	.rodata
	.align	2
.LC11:
	.ascii	"? \000"
	.align	2
.LC12:
	.ascii	"%lf\000"
	.text
	.align	2
	.global	read_number
	.syntax unified
	.arm
	.fpu vfp
	.type	read_number, %function
read_number:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #28
	str	r0, [fp, #-48]
	mov	r3, sp
	mov	r8, r3
	mov	r3, #16
	sub	r3, r3, #1
	str	r3, [fp, #-32]
	mov	r3, #16
	mov	r2, r3
	mov	r3, #0
	mov	r6, r2
	mov	r7, r3
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r7, #3
	orr	r3, r3, r6, lsr #29
	lsl	r2, r6, #3
	mov	r3, #16
	mov	r2, r3
	mov	r3, #0
	mov	r4, r2
	mov	r5, r3
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r5, #3
	orr	r3, r3, r4, lsr #29
	lsl	r2, r4, #3
	mov	r3, #16
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	mov	r3, sp
	add	r3, r3, #0
	str	r3, [fp, #-36]
	ldr	r0, .L171
	bl	print_string
	mov	r1, #16
	ldr	r3, .L171+4
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r0, [fp, #-36]
	bl	fgets
	str	r0, [fp, #-40]
	ldr	r2, [fp, #-48]
	ldr	r1, .L171+8
	ldr	r0, [fp, #-36]
	bl	__isoc99_sscanf
	ldr	r3, .L171+12
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L171+16
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L171+16
	str	r3, [r2]
	mov	sp, r8
	nop
	sub	sp, fp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, fp, lr}
	bx	lr
.L172:
	.align	2
.L171:
	.word	.LC11
	.word	stdin
	.word	.LC12
	.word	pos
	.word	vpos
	.size	read_number, .-read_number
	.align	2
	.global	read_string
	.syntax unified
	.arm
	.fpu vfp
	.type	read_string, %function
read_string:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r2, .L174
	ldr	r2, [r2]
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	fgets
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L174+4
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L174+8
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L174+8
	str	r3, [r2]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L175:
	.align	2
.L174:
	.word	stdin
	.word	pos
	.word	vpos
	.size	read_string, .-read_string
	.align	2
	.global	random_lcg
	.syntax unified
	.arm
	.fpu vfp
	.type	random_lcg, %function
random_lcg:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L178+8
	ldr	r3, [r3]
	ldr	r2, .L178+12
	mul	r3, r2, r3
	add	r3, r3, #12288
	add	r3, r3, #57
	bic	r3, r3, #-2147483648
	ldr	r2, .L178+8
	str	r3, [r2]
	ldr	r3, .L178+8
	ldr	r3, [r3]
	vmov	s15, r3	@ int
	vcvt.f64.u32	d7, s15
	vldr.64	d6, .L178
	vdiv.f64	d5, d7, d6
	vmov.f64	d7, d5
	vmov.f64	d0, d7
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L179:
	.align	3
.L178:
	.word	0
	.word	1105199104
	.word	x.0
	.word	1103515245
	.size	random_lcg, .-random_lcg
	.align	2
	.global	cot
	.syntax unified
	.arm
	.fpu vfp
	.type	cot, %function
cot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	vpush.64	{d8}
	add	fp, sp, #12
	sub	sp, sp, #8
	vstr.64	d0, [fp, #-20]
	vldr.64	d0, [fp, #-20]
	bl	cos
	vmov.f64	d8, d0
	vldr.64	d0, [fp, #-20]
	bl	sin
	vmov.f64	d7, d0
	vdiv.f64	d6, d8, d7
	vmov.f64	d7, d6
	vmov.f64	d0, d7
	sub	sp, fp, #12
	@ sp needed
	vldm	sp!, {d8}
	pop	{fp, lr}
	bx	lr
	.size	cot, .-cot
	.align	2
	.global	sgn
	.syntax unified
	.arm
	.fpu vfp
	.type	sgn, %function
sgn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	vstr.64	d0, [fp, #-12]
	vldr.64	d7, [fp, #-12]
	vcmpe.f64	d7, #0
	vmrs	APSR_nzcv, FPSCR
	ble	.L192
	mov	r2, #0
	ldr	r3, .L194
	b	.L189
.L192:
	vldr.64	d7, [fp, #-12]
	vcmpe.f64	d7, #0
	vmrs	APSR_nzcv, FPSCR
	bpl	.L193
	mov	r2, #0
	ldr	r3, .L194+4
	b	.L189
.L193:
	mov	r2, #0
	mov	r3, #0
.L189:
	vmov	d7, r2, r3
	vmov.f64	d0, d7
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L195:
	.align	2
.L194:
	.word	1072693248
	.word	-1074790400
	.size	sgn, .-sgn
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	bl	basic_run
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	main, .-main
	.data
	.align	2
	.type	x.0, %object
	.size	x.0, 4
x.0:
	.word	524288
	.ident	"GCC: (GNU Toolchain for the A-profile Architecture 10.3-2021.07 (arm-10.29)) 10.3.1 20210621"
	.section	.note.GNU-stack,"",%progbits
