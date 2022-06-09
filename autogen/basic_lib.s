	.cpu arm710t
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
	.arch armv4t
	.syntax unified
	.arm
	.fpu vfp
	.type	print_string, %function
print_string:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldrb	r0, [r0]	@ zero_extendqisi2
	ldr	r6, .L13
	cmp	r0, #0
.LPIC0:
	add	r6, pc, r6
	beq	.L1
	ldr	r3, .L13+4
	ldr	r5, .L13+8
.LPIC3:
	add	r3, pc, r3
	ldr	r3, [r3]
.LPIC1:
	add	r5, pc, r5
	b	.L4
.L6:
	ldr	r3, [r6, r2]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1
.L4:
	cmp	r3, #74
	ldr	r2, .L13+12
	bls	.L6
	ldrb	r3, [r4]	@ zero_extendqisi2
.L11:
	cmp	r3, #0
	bne	.L11
.L1:
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+8)
	.word	.LANCHOR0-(.LPIC3+8)
	.word	.LANCHOR0-(.LPIC1+8)
	.word	stdout(GOT)
	.size	print_string, .-print_string
	.section	.rodata.str1.4,"aMS",%progbits,1
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
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r2, .L26
	mov	r1, #16
	sub	sp, sp, #24
	add	r4, sp, #8
	mov	r0, r4
	vstr.64	d0, [sp]
.LPIC4:
	add	r2, pc, r2
	bl	snprintf(PLT)
	ldrb	r0, [sp, #8]	@ zero_extendqisi2
	ldr	r6, .L26+4
	cmp	r0, #0
.LPIC5:
	add	r6, pc, r6
	beq	.L15
	ldr	r3, .L26+8
	ldr	r5, .L26+12
.LPIC8:
	add	r3, pc, r3
	ldr	r3, [r3]
.LPIC6:
	add	r5, pc, r5
	b	.L18
.L20:
	ldr	r3, [r6, r2]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r5]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r5]
	beq	.L15
.L18:
	cmp	r3, #74
	ldr	r2, .L26+16
	bls	.L20
	ldrb	r3, [r4]	@ zero_extendqisi2
.L25:
	cmp	r3, #0
	bne	.L25
.L15:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LC0-(.LPIC4+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC5+8)
	.word	.LANCHOR0-(.LPIC8+8)
	.word	.LANCHOR0-(.LPIC6+8)
	.word	stdout(GOT)
	.size	print_number, .-print_number
	.section	.rodata.str1.4
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
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r2, .L39
	mov	r3, r0
	sub	sp, sp, #16
	mov	r4, sp
	mov	r1, #16
	mov	r0, r4
.LPIC9:
	add	r2, pc, r2
	bl	snprintf(PLT)
	ldrb	r0, [sp]	@ zero_extendqisi2
	ldr	r6, .L39+4
	cmp	r0, #0
.LPIC10:
	add	r6, pc, r6
	beq	.L28
	ldr	r3, .L39+8
	ldr	r5, .L39+12
.LPIC13:
	add	r3, pc, r3
	ldr	r3, [r3]
.LPIC11:
	add	r5, pc, r5
	b	.L31
.L33:
	ldr	r3, [r6, r2]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r5]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r5]
	beq	.L28
.L31:
	cmp	r3, #74
	ldr	r2, .L39+16
	bls	.L33
	ldrb	r3, [r4]	@ zero_extendqisi2
.L38:
	cmp	r3, #0
	bne	.L38
.L28:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LC1-(.LPIC9+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC10+8)
	.word	.LANCHOR0-(.LPIC13+8)
	.word	.LANCHOR0-(.LPIC11+8)
	.word	stdout(GOT)
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
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L43
	ldr	r2, .L43+4
.LPIC14:
	add	r3, pc, r3
	mov	r0, #10
	ldr	r2, [r3, r2]
	ldr	r1, [r2]
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L43+8
.LPIC15:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	pop	{r4, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC14+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC15+8)
	.size	print_newline, .-print_newline
	.align	2
	.global	print_comma
	.syntax unified
	.arm
	.fpu vfp
	.type	print_comma, %function
print_comma:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L52
	ldr	r2, .L52+4
.LPIC18:
	add	r3, pc, r3
	ldr	r6, .L52+8
.LPIC19:
	add	r6, pc, r6
	mov	r0, #32
	ldr	r4, [r3, r2]
	ldr	r1, [r4]
	bl	putc(PLT)
	ldr	r1, [r6]
	add	r2, r1, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	ldr	r5, .L52+12
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #0
	cmp	r3, r5
	str	r2, [r6]
	bls	.L46
.L47:
	ldr	r1, [r4]
	mov	r0, #32
	bl	putc(PLT)
	ldr	r1, [r6]
	add	r2, r1, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #0
	cmp	r3, r5
	str	r2, [r6]
	bhi	.L47
.L46:
	add	r1, r1, #16
	cmp	r1, #75
	bhi	.L51
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	ldr	r1, [r4]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L52+16
.LPIC23:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC18+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC19+8)
	.word	286331153
	.word	.LANCHOR0-(.LPIC23+8)
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
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L58
	ldr	r2, .L58+4
.LPIC26:
	add	r3, pc, r3
	ldr	r4, .L58+8
.LPIC27:
	add	r4, pc, r4
	mov	r0, #32
	ldr	r5, [r3, r2]
	ldr	r1, [r5]
	bl	putc(PLT)
	ldr	r3, [r4]
	add	r2, r3, #16
	cmp	r2, #75
	add	r3, r3, #1
	str	r3, [r4]
	bhi	.L57
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	ldr	r1, [r5]
	mov	r0, #10
	bl	putc(PLT)
	mov	r2, #0
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	stm	r4, {r2, r3}
	pop	{r4, r5, r6, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC26+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC27+8)
	.size	print_semicolon, .-print_semicolon
	.align	2
	.global	print_tab
	.syntax unified
	.arm
	.fpu vfp
	.type	print_tab, %function
print_tab:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L68
.LPIC32:
	add	r4, pc, r4
	ldr	r3, [r4]
	cmp	r3, #74
	movls	r1, #1
	movhi	r1, #0
	cmp	r0, r3
	movls	r1, #0
	ldr	r2, .L68+4
	cmp	r1, #0
.LPIC33:
	add	r2, pc, r2
	beq	.L60
	mov	r5, r0
	ldr	r3, .L68+8
	ldr	r6, [r2, r3]
.L62:
	mov	r0, #32
	ldr	r1, [r6]
	bl	putc(PLT)
	ldr	r3, [r4]
	add	r3, r3, #1
	cmp	r3, #74
	cmpls	r3, r5
	str	r3, [r4]
	bcc	.L62
.L60:
	pop	{r4, r5, r6, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	.LANCHOR0-(.LPIC32+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC33+8)
	.word	stdout(GOT)
	.size	print_tab, .-print_tab
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"OUT OF DATA\000"
	.align	2
.LC3:
	.ascii	"END WITHIN GOSUB/FN\000"
	.align	2
.LC4:
	.ascii	"NOT WITHIN GOSUB/FN\000"
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
	.ascii	"STRING TOO LONG\000"
	.align	2
.LC10:
	.ascii	"ON GOTO OUT OF RANGE\000"
	.align	2
.LC11:
	.ascii	"UNINITIALIZED STRING\000"
	.align	2
.LC12:
	.ascii	"RUNTIME ERROR\000"
	.align	2
.LC13:
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
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r6, .L89
	sub	r3, r0, #1
	push	{r4, lr}
.LPIC48:
	add	r6, pc, r6
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #11
	addls	pc, pc, r3, asl #2
	b	.L71
.L73:
	b	.L82
	b	.L81
	b	.L80
	b	.L79
	b	.L78
	b	.L77
	b	.L76
	b	.L71
	b	.L71
	b	.L75
	b	.L74
	b	.L72
	.p2align 1
.L72:
	ldr	r0, .L89+4
.LPIC45:
	add	r0, pc, r0
	bl	print_string(PLT)
.L83:
	cmn	r5, #1
	beq	.L84
	ldr	r0, .L89+8
.LPIC47:
	add	r0, pc, r0
	bl	print_string(PLT)
	mov	r0, r5
	bl	print_integer(PLT)
.L84:
	ldr	r3, .L89+12
	ldr	r3, [r6, r3]
	mov	r0, #10
	ldr	r1, [r3]
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L89+16
.LPIC49:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	mov	r0, r4
	add	r2, r2, #1
	stm	r3, {r1, r2}
	bl	exit(PLT)
.L71:
	ldr	r0, .L89+20
.LPIC46:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L83
.L82:
	ldr	r0, .L89+24
.LPIC36:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L83
.L81:
	ldr	r0, .L89+28
.LPIC37:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L83
.L80:
	ldr	r0, .L89+32
.LPIC38:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L83
.L79:
	ldr	r0, .L89+36
.LPIC39:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L83
.L78:
	ldr	r0, .L89+40
.LPIC40:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L83
.L77:
	ldr	r0, .L89+44
.LPIC41:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L83
.L76:
	ldr	r0, .L89+48
.LPIC42:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L83
.L75:
	ldr	r0, .L89+52
.LPIC43:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L83
.L74:
	ldr	r0, .L89+56
.LPIC44:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L83
.L90:
	.align	2
.L89:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC48+8)
	.word	.LC11-(.LPIC45+8)
	.word	.LC13-(.LPIC47+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC49+8)
	.word	.LC12-(.LPIC46+8)
	.word	.LC2-(.LPIC36+8)
	.word	.LC3-(.LPIC37+8)
	.word	.LC4-(.LPIC38+8)
	.word	.LC5-(.LPIC39+8)
	.word	.LC6-(.LPIC40+8)
	.word	.LC7-(.LPIC41+8)
	.word	.LC8-(.LPIC42+8)
	.word	.LC9-(.LPIC43+8)
	.word	.LC10-(.LPIC44+8)
	.size	runtime_error, .-runtime_error
	.align	2
	.global	mat_print
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_print, %function
mat_print:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, r0
	add	fp, sp, #32
	sub	sp, sp, #52
	mov	ip, r1
	ldr	r2, .L132
	ldr	r3, .L132+4
.LPIC52:
	add	r2, pc, r2
	ldr	r4, [r2, r3]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #8]
	add	r3, r3, #1
	add	r3, r2, r3, lsl #3
	ldr	r1, [r4]
	mov	r0, #10
	str	r3, [fp, #-68]
	str	ip, [fp, #-64]
	bl	putc(PLT)
	mov	r0, #0
	ldr	r3, .L132+8
.LPIC53:
	add	r3, pc, r3
	ldr	r1, [r3, #4]
	ldr	r2, [r7, #4]
	add	r1, r1, #1
	stm	r3, {r0, r1}
	ldr	r3, [r2]
	cmp	r3, r0
	beq	.L93
	ldr	r3, .L132+12
.LPIC79:
	add	r3, pc, r3
	str	r3, [fp, #-76]
	ldr	r3, .L132+16
.LPIC57:
	add	r3, pc, r3
	mov	r8, r3
	str	r0, [fp, #-72]
	ldr	r6, .L132+20
.L92:
	ldr	r2, [r2, #4]
	cmp	r2, #0
	ldreq	r1, [r4]
	beq	.L107
	mov	r5, #0
	ldr	r3, [fp, #-68]
	add	r3, r3, #8
	str	r3, [fp, #-60]
	sub	r10, fp, #52
	str	r8, [fp, #-56]
.L106:
	ldr	r3, [fp, #-60]
	ldr	r2, .L132+24
	ldmia	r3!, {r0-r1}
.LPIC56:
	add	r2, pc, r2
	str	r3, [fp, #-60]
	mov	r9, sp
	stm	sp, {r0-r1}
	mov	r1, #16
	mov	r0, r10
	bl	snprintf(PLT)
	ldrb	r0, [fp, #-52]	@ zero_extendqisi2
	cmp	r0, #0
	add	r5, r5, #1
	beq	.L95
	ldr	r2, .L132+28
	mov	r8, r10
.LPIC89:
	ldr	r1, [pc, r2]		@ tls_load_dot_plus_eight
	b	.L96
.L98:
	ldr	r1, [r4]
	bl	putc(PLT)
	ldr	r3, [fp, #-56]
	ldrb	r0, [r8, #1]!	@ zero_extendqisi2
	ldr	r1, [r3]
	cmp	r0, #0
	add	r1, r1, #1
	str	r1, [r3]
	beq	.L95
.L96:
	cmp	r1, #74
	bls	.L98
	ldrb	r2, [r8]	@ zero_extendqisi2
	cmp	r2, #0
	ldr	r3, [fp, #-56]
	beq	.L95
.L97:
	cmp	r2, #0
	bne	.L97
	str	r3, [fp, #-56]
.L95:
	ldr	r2, [r7, #4]
	ldr	r2, [r2, #4]
	cmp	r5, r2
	mov	sp, r9
	bcs	.L102
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	mov	r0, #32
	ldr	r1, [r4]
	beq	.L100
	ldr	r9, .L132+32
.LPIC59:
	add	r9, pc, r9
	bl	putc(PLT)
	ldr	r2, [r9]
	add	r1, r2, #16
	cmp	r1, #75
	add	r2, r2, #1
	str	r2, [r9]
	bhi	.L101
.L128:
	ldr	r2, [r7, #4]
	ldr	r2, [r2, #4]
.L102:
	cmp	r5, r2
	bne	.L106
	ldr	r3, [fp, #-56]
	cmp	r5, #1
	mov	r8, r3
	ldr	r1, [r4]
	bne	.L129
.L107:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	mov	r0, #32
	beq	.L109
	ldr	r5, .L132+36
.LPIC74:
	add	r5, pc, r5
	bl	putc(PLT)
	ldr	r2, [r5]
	add	r1, r2, #16
	cmp	r1, #75
	add	r2, r2, #1
	str	r2, [r5]
	bhi	.L130
.L108:
	ldm	r7, {r1, r2}
	ldr	r3, [fp, #-72]
	ldr	r0, [r2]
	add	r3, r3, #1
	ldr	r1, [r1, #4]
	str	r3, [fp, #-72]
	cmp	r0, r3
	ldr	r3, [fp, #-68]
	add	r1, r1, #1
	add	r3, r3, r1, lsl #3
	str	r3, [fp, #-68]
	bne	.L92
.L93:
	ldr	r3, [r2, #4]
	cmp	r3, #1
	beq	.L131
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L100:
	ldr	r9, .L132+40
.LPIC64:
	add	r9, pc, r9
	bl	putc(PLT)
	ldr	r1, [r9]
	add	r2, r1, #1
	str	r2, [r9]
	add	r2, r2, r2, lsl #4
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	rsb	r2, r2, #0
	cmp	r2, r6
	bls	.L103
	ldr	r3, [fp, #-56]
	mov	r8, r3
.L104:
	ldr	r1, [r4]
	mov	r0, #32
	bl	putc(PLT)
	ldr	r1, [r9]
	add	r3, r1, #1
	str	r3, [r9]
	add	r3, r3, r3, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #0
	cmp	r3, r6
	bhi	.L104
	str	r8, [fp, #-56]
.L103:
	add	r1, r1, #16
	cmp	r1, #75
	bls	.L128
	ldr	r1, [r4]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r2, .L132+44
.LPIC68:
	add	r2, pc, r2
	str	r1, [r2]
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	b	.L128
.L101:
	mov	r0, #10
	ldr	r1, [r4]
	bl	putc(PLT)
	mov	r2, #0
	str	r2, [r9]
	ldr	r2, [r9, #4]
	add	r2, r2, #1
	str	r2, [r9, #4]
	ldr	r2, [r7, #4]
	ldr	r2, [r2, #4]
	b	.L102
.L129:
	mov	r0, #10
	bl	putc(PLT)
	mov	r0, #0
	ldr	r2, .L132+48
.LPIC71:
	add	r2, pc, r2
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	stm	r2, {r0, r1}
	b	.L108
.L109:
	bl	putc(PLT)
	ldr	r3, [fp, #-76]
	ldr	r0, [r3]
	add	r2, r0, #1
	str	r2, [r3]
	add	r2, r2, r2, lsl #4
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	rsb	r2, r2, #0
	cmp	r2, r6
	bls	.L111
	ldr	r5, .L132+52
.LPIC81:
	add	r5, pc, r5
.L112:
	mov	r0, #32
	ldr	r1, [r4]
	bl	putc(PLT)
	ldr	r0, [r5]
	add	r2, r0, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #0
	cmp	r3, r6
	str	r2, [r5]
	bhi	.L112
.L111:
	add	r0, r0, #16
	cmp	r0, #75
	bls	.L108
	ldr	r1, [r4]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r2, .L132+56
.LPIC83:
	add	r2, pc, r2
	str	r1, [r2]
	ldr	r1, [r2, #4]
	add	r1, r1, #1
	str	r1, [r2, #4]
	b	.L108
.L130:
	mov	r0, #10
	ldr	r1, [r4]
	bl	putc(PLT)
	mov	r2, #0
	str	r2, [r5]
	ldr	r2, [r5, #4]
	add	r2, r2, #1
	str	r2, [r5, #4]
	b	.L108
.L131:
	ldr	r1, [r4]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L132+60
.LPIC86:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L133:
	.align	2
.L132:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC52+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC53+8)
	.word	.LANCHOR0-(.LPIC79+8)
	.word	.LANCHOR0-(.LPIC57+8)
	.word	286331153
	.word	.LC0-(.LPIC56+8)
	.word	.LANCHOR0-(.LPIC89+8)
	.word	.LANCHOR0-(.LPIC59+8)
	.word	.LANCHOR0-(.LPIC74+8)
	.word	.LANCHOR0-(.LPIC64+8)
	.word	.LANCHOR0-(.LPIC68+8)
	.word	.LANCHOR0-(.LPIC71+8)
	.word	.LANCHOR0-(.LPIC81+8)
	.word	.LANCHOR0-(.LPIC83+8)
	.word	.LANCHOR0-(.LPIC86+8)
	.size	mat_print, .-mat_print
	.align	2
	.global	mat_print_str
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_print_str, %function
mat_print_str:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, [r0, #4]
	ldr	r3, .L164
	cmp	r4, #0
.LPIC90:
	add	r3, pc, r3
	beq	.L134
	mov	r8, r1
	ldr	r2, .L164+4
	ldr	r9, .L164+8
	ldr	r5, [r3, r2]
	ldr	r6, .L164+12
	add	r7, r0, #4
.LPIC91:
	add	r9, pc, r9
.L135:
	ldrb	r0, [r4]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L138
	ldr	r3, .L164+16
.LPIC105:
	add	r3, pc, r3
	ldr	r3, [r3]
	b	.L137
.L140:
	ldr	r1, [r5]
	bl	putc(PLT)
	ldr	r3, [r9]
	add	r3, r3, #1
	str	r3, [r9]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L138
.L137:
	cmp	r3, #74
	bls	.L140
	ldrb	r3, [r4]	@ zero_extendqisi2
.L159:
	cmp	r3, #0
	bne	.L159
.L138:
	cmp	r8, #0
	ldr	r1, [r5]
	beq	.L161
	ldr	r4, .L164+20
	mov	r0, #32
.LPIC93:
	add	r4, pc, r4
	bl	putc(PLT)
	ldr	r3, [r4]
	add	r2, r3, #16
	cmp	r2, #75
	add	r3, r3, #1
	str	r3, [r4]
	bhi	.L162
.L143:
	ldr	r4, [r7, #4]!
	cmp	r4, #0
	bne	.L135
.L134:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L161:
	ldr	r4, .L164+24
	mov	r0, #32
.LPIC98:
	add	r4, pc, r4
	b	.L160
.L163:
	mov	r0, #32
	ldr	r1, [r5]
.L160:
	bl	putc(PLT)
	ldr	r1, [r4]
	add	r2, r1, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #0
	cmp	r3, r6
	str	r2, [r4]
	bhi	.L163
	add	r1, r1, #16
	cmp	r1, #75
	bls	.L143
	ldr	r1, [r5]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L164+28
.LPIC102:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	b	.L143
.L162:
	mov	r0, #10
	ldr	r1, [r5]
	bl	putc(PLT)
	mov	r2, #0
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	stm	r4, {r2, r3}
	b	.L143
.L165:
	.align	2
.L164:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC90+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC91+8)
	.word	286331153
	.word	.LANCHOR0-(.LPIC105+8)
	.word	.LANCHOR0-(.LPIC93+8)
	.word	.LANCHOR0-(.LPIC98+8)
	.word	.LANCHOR0-(.LPIC102+8)
	.size	mat_print_str, .-mat_print_str
	.align	2
	.global	mat_read
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_read, %function
mat_read:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	bxeq	lr
	add	ip, r0, #8
	ldr	r0, [r2]
	push	{r4, lr}
	add	lr, r0, #2
	ldr	r4, [r2, #4]
	add	r1, r0, r1
	add	lr, r2, lr, lsl #3
.L169:
	cmp	r4, r0
	beq	.L176
	vldmia.64	lr!, {d7}
	add	r0, r0, #1
	cmp	r0, r1
	str	r0, [r2]
	vstmia.64	ip!, {d7}
	bne	.L169
	pop	{r4, lr}
	bx	lr
.L176:
	mov	r1, r3
	mov	r0, #1
	bl	runtime_error(PLT)
	.size	mat_read, .-mat_read
	.align	2
	.global	mat_read2
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_read2, %function
mat_read2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, [r0]
	mov	r8, r2
	ldr	r2, [r0, #4]
	ldr	ip, [r3]
	ldr	r7, [r2]
	cmp	r7, ip
	bhi	.L178
	ldr	r5, [r2, #4]
	ldr	r6, [r3, #4]
	cmp	r5, r6
	bhi	.L178
	ldr	r2, [r0, #8]
	add	r6, r6, #1
	cmp	r7, #0
	add	r2, r2, r6, lsl #3
	movne	r4, #0
	lsl	r6, r6, #3
	beq	.L177
.L180:
	cmp	r5, #0
	beq	.L185
	ldm	r1, {r3, lr}
	add	r0, r3, #2
	add	r0, r1, r0, lsl #3
	add	ip, r2, #8
	add	r9, r5, r3
.L183:
	cmp	lr, r3
	beq	.L189
	vldmia.64	r0!, {d7}
	add	r3, r3, #1
	cmp	r3, r9
	str	r3, [r1]
	vstmia.64	ip!, {d7}
	bne	.L183
.L185:
	add	r4, r4, #1
	cmp	r7, r4
	add	r2, r2, r6
	bne	.L180
.L177:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L189:
	mov	r1, r8
	mov	r0, #1
	bl	runtime_error(PLT)
.L178:
	mov	r1, r8
	mov	r0, #6
	bl	runtime_error(PLT)
	.size	mat_read2, .-mat_read2
	.align	2
	.global	mat_read_str
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_read_str, %function
mat_read_str:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	subs	r8, r1, #0
	ldr	r9, [r2, #4]
	sub	sp, sp, #12
	str	r3, [sp, #4]
	beq	.L190
	mov	r7, r2
	mov	r5, r0
	mov	r6, #0
	ldr	r4, [r2, #8]
	add	r10, r2, #16
	lsl	r9, r9, #3
.L196:
	ldr	r3, [r7, #12]
	cmp	r3, r4
	beq	.L198
	ldr	r0, [r5, #4]
	cmp	r0, #0
	beq	.L193
	bl	free(PLT)
	ldr	r3, [r7, #8]
	add	r4, r3, #1
	add	r3, r10, r3, lsl #2
	str	r4, [r7, #8]
	ldr	r0, [r3, r9]
	bl	strdup(PLT)
	add	r6, r6, #1
	cmp	r8, r6
	str	r0, [r5, #4]!
	bne	.L196
.L190:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L193:
	add	fp, r4, #1
	add	r4, r10, r4, lsl #2
	str	fp, [r7, #8]
	ldr	r0, [r4, r9]
	bl	strdup(PLT)
	add	r6, r6, #1
	cmp	r8, r6
	str	r0, [r5, #4]!
	beq	.L190
	mov	r4, fp
	b	.L196
.L198:
	mov	r0, #1
	ldr	r1, [sp, #4]
	bl	runtime_error(PLT)
	.size	mat_read_str, .-mat_read_str
	.align	2
	.global	mat_add
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_add, %function
mat_add:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	ip, [r1, #4]
	ldr	lr, [r2, #4]
	ldr	r9, [ip]
	ldr	r4, [lr]
	cmp	r9, r4
	bne	.L200
	ldr	ip, [ip, #4]
	ldr	lr, [lr, #4]
	cmp	ip, lr
	bne	.L200
	ldr	lr, [r0]
	ldr	r4, [lr]
	cmp	r9, r4
	bhi	.L202
	ldr	r4, [lr, #4]
	cmp	ip, r4
	bhi	.L202
	ldmib	r0, {r3, r4}
	stm	r3, {r9, ip}
	ldr	r3, [r1]
	ldr	r5, [r2, #8]
	cmp	r9, #0
	ldr	r6, [r3, #4]
	ldr	r3, [r2]
	ldr	r7, [lr, #4]
	ldr	r8, [r3, #4]
	ldr	lr, [r1, #8]
	add	r7, r7, #1
	add	r6, r6, #1
	add	r8, r8, #1
	add	r4, r4, r7, lsl #3
	add	lr, lr, r6, lsl #3
	add	r5, r5, r8, lsl #3
	lsl	r7, r7, #3
	lsl	r6, r6, #3
	lsl	r8, r8, #3
	beq	.L199
	cmp	ip, #0
	beq	.L199
	add	r0, ip, #1
	mov	ip, #0
	add	r0, lr, r0, lsl #3
.L205:
	add	r3, lr, #8
	add	r1, r5, #8
	add	r2, r4, #8
.L206:
	vldmia.64	r3!, {d7}
	vldmia.64	r1!, {d6}
	vadd.f64	d7, d7, d6
	cmp	r3, r0
	vstmia.64	r2!, {d7}
	bne	.L206
	add	ip, ip, #1
	cmp	r9, ip
	add	r4, r4, r7
	add	lr, lr, r6
	add	r5, r5, r8
	add	r0, r0, r6
	bne	.L205
.L199:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L200:
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error(PLT)
.L202:
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error(PLT)
	.size	mat_add, .-mat_add
	.align	2
	.global	mat_sub
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_sub, %function
mat_sub:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	ip, [r1, #4]
	ldr	lr, [r2, #4]
	ldr	r9, [ip]
	ldr	r4, [lr]
	cmp	r9, r4
	bne	.L216
	ldr	ip, [ip, #4]
	ldr	lr, [lr, #4]
	cmp	ip, lr
	bne	.L216
	ldr	lr, [r0]
	ldr	r4, [lr]
	cmp	r9, r4
	bhi	.L218
	ldr	r4, [lr, #4]
	cmp	ip, r4
	bhi	.L218
	ldmib	r0, {r3, r4}
	stm	r3, {r9, ip}
	ldr	r3, [r1]
	ldr	r5, [r2, #8]
	cmp	r9, #0
	ldr	r6, [r3, #4]
	ldr	r3, [r2]
	ldr	r7, [lr, #4]
	ldr	r8, [r3, #4]
	ldr	lr, [r1, #8]
	add	r7, r7, #1
	add	r6, r6, #1
	add	r8, r8, #1
	add	r4, r4, r7, lsl #3
	add	lr, lr, r6, lsl #3
	add	r5, r5, r8, lsl #3
	lsl	r7, r7, #3
	lsl	r6, r6, #3
	lsl	r8, r8, #3
	beq	.L215
	cmp	ip, #0
	beq	.L215
	add	r0, ip, #1
	mov	ip, #0
	add	r0, lr, r0, lsl #3
.L221:
	add	r3, lr, #8
	add	r1, r5, #8
	add	r2, r4, #8
.L222:
	vldmia.64	r3!, {d7}
	vldmia.64	r1!, {d6}
	vsub.f64	d7, d7, d6
	cmp	r3, r0
	vstmia.64	r2!, {d7}
	bne	.L222
	add	ip, ip, #1
	cmp	r9, ip
	add	r4, r4, r7
	add	lr, lr, r6
	add	r5, r5, r8
	add	r0, r0, r6
	bne	.L221
.L215:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L216:
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error(PLT)
.L218:
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error(PLT)
	.size	mat_sub, .-mat_sub
	.align	2
	.global	mat_mul
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_mul, %function
mat_mul:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r1
	mov	r7, r2
	ldr	ip, [r6, #4]
	ldr	r2, [r2, #4]
	mov	r1, r3
	ldr	lr, [ip, #4]
	ldr	r3, [r2]
	cmp	lr, r3
	sub	sp, sp, #12
	bne	.L254
	ldr	lr, [ip]
	mov	r4, lr
	ldr	r3, [r0]
	str	lr, [sp]
	ldr	lr, [r3]
	cmp	r4, lr
	bhi	.L233
	ldr	r2, [r2, #4]
	ldr	lr, [r3, #4]
	cmp	r2, lr
	bhi	.L233
	ldmib	r0, {r1, fp}
	str	r2, [r1, #4]
	cmp	r4, #0
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	add	fp, fp, r3, lsl #3
	lsl	r3, r3, #3
	str	r4, [r1]
	str	r3, [sp, #4]
	beq	.L231
	cmp	r2, #0
	beq	.L231
	mov	r10, #0
	vldr.64	d4, .L255
	add	r2, r2, #1
	ldr	r5, [ip, #4]
	add	r9, fp, r2, lsl #3
.L237:
	mov	r4, #0
	add	r10, r10, #1
	add	r0, fp, #8
.L239:
	cmp	r5, #0
	mov	r2, r4
	vstmia.64	r0!, {d4}
	add	r4, r4, #1
	beq	.L242
	vldr.64	d7, .L255
	ldr	r3, [r6]
	ldr	lr, [r3, #4]
	add	lr, lr, #1
	mul	lr, r10, lr
	ldr	r3, [r7]
	ldr	r1, [r3, #4]
	ldr	ip, [r7, #8]
	ldr	r3, [r6, #8]
	add	r1, r1, #1
	add	r2, r1, r2
	add	r8, lr, #1
	add	r2, ip, r2, lsl #3
	add	lr, lr, r5
	add	ip, r3, #8
	lsl	r1, r1, #3
	add	r3, r3, r8, lsl #3
	add	ip, ip, lr, lsl #3
.L241:
	vldmia.64	r3!, {d5}
	vldr.64	d6, [r2, #8]
	vmla.f64	d7, d5, d6
	cmp	ip, r3
	vstr.64	d7, [r0, #-8]
	add	r2, r2, r1
	bne	.L241
.L242:
	cmp	r0, r9
	bne	.L239
	ldr	r3, [sp]
	cmp	r3, r10
	ldr	r3, [sp, #4]
	add	fp, fp, r3
	add	r9, r9, r3
	bne	.L237
.L231:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L254:
	mov	r0, #7
	bl	runtime_error(PLT)
.L233:
	mov	r0, #6
	bl	runtime_error(PLT)
.L256:
	.align	3
.L255:
	.word	0
	.word	0
	.size	mat_mul, .-mat_mul
	.align	2
	.global	mat_zer_con
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_zer_con, %function
mat_zer_con:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	ldr	ip, [r0]
	push	{r4, lr}
	ldr	lr, [r3]
	ldr	r4, [ip]
	cmp	lr, r4
	bhi	.L258
	ldr	r3, [r3, #4]
	ldr	ip, [ip, #4]
	cmp	r3, ip
	bhi	.L258
	ldr	r0, [r0, #8]
	add	ip, ip, #1
	cmp	lr, #0
	add	r0, r0, ip, lsl #3
	lsl	ip, ip, #3
	beq	.L257
	vldr.64	d7, .L271
	vldr.64	d6, .L271+8
	cmp	r1, #0
	vmoveq.f64	d7, d6
	cmp	r3, #0
	beq	.L257
	mov	r1, #0
	add	r3, r3, #1
	add	r2, r0, r3, lsl #3
.L261:
	add	r3, r0, #8
.L262:
	vstmia.64	r3!, {d7}
	cmp	r2, r3
	bne	.L262
	add	r1, r1, #1
	cmp	lr, r1
	add	r0, r0, ip
	add	r2, r2, ip
	bne	.L261
.L257:
	pop	{r4, lr}
	bx	lr
.L258:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error(PLT)
.L272:
	.align	3
.L271:
	.word	0
	.word	1072693248
	.word	0
	.word	0
	.size	mat_zer_con, .-mat_zer_con
	.align	2
	.global	mat_idn
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_idn, %function
mat_idn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	push	{r4, r5, r6, lr}
	ldm	r3, {r4, ip}
	cmp	r4, ip
	bne	.L288
	ldr	r3, [r0]
	mov	r2, r1
	ldr	r1, [r3]
	cmp	r4, r1
	bhi	.L275
	ldr	r3, [r3, #4]
	cmp	r4, r3
	bhi	.L275
	ldr	lr, [r0, #8]
	add	r3, r3, #1
	cmp	r4, #0
	lsl	r5, r3, #3
	add	lr, lr, r3, lsl #3
	beq	.L273
	mov	r1, #0
	vldr.64	d6, .L289
	vldr.64	d7, .L289+8
.L282:
	mov	r3, #0
	add	r2, lr, #8
	add	r0, r1, #1
.L281:
	cmp	r1, r3
	beq	.L278
	add	r3, r3, #1
	cmp	ip, r3
	vstmia.64	r2!, {d7}
	bne	.L281
	cmp	r4, r0
	mov	r1, r0
	add	lr, lr, r5
	bne	.L282
.L273:
	pop	{r4, r5, r6, lr}
	bx	lr
.L278:
	cmp	ip, r0
	mov	r3, r0
	vstmia.64	r2!, {d6}
	bne	.L281
	cmp	r4, r0
	mov	r1, r0
	add	lr, lr, r5
	bne	.L282
	b	.L273
.L288:
	mov	r0, #7
	bl	runtime_error(PLT)
.L275:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error(PLT)
.L290:
	.align	3
.L289:
	.word	0
	.word	1072693248
	.word	0
	.word	0
	.size	mat_idn, .-mat_idn
	.align	2
	.global	mat_trn
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_trn, %function
mat_trn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, [r0]
	ldr	r3, [r1, #4]
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	lr, [ip, #4]
	ldr	r4, [r3]
	cmp	r4, lr
	bhi	.L292
	ldr	r7, [r3, #4]
	ldr	lr, [ip]
	cmp	r7, lr
	bhi	.L292
	ldmib	r0, {r2, r5}
	str	r7, [r2]
	cmp	r7, #0
	ldr	r3, [r3]
	str	r3, [r2, #4]
	ldr	r6, [ip, #4]
	add	r6, r6, #1
	add	r5, r5, r6, lsl #3
	lsl	r6, r6, #3
	beq	.L291
	cmp	r3, #0
	beq	.L291
	mov	r4, #0
	add	r3, r3, #1
	add	ip, r5, r3, lsl #3
	ldr	r3, [r1]
	ldr	r8, [r3, #4]
	ldr	r9, [r1, #8]
	add	r8, r8, #1
	lsl	lr, r8, #3
.L295:
	add	r3, r8, r4
	add	r3, r9, r3, lsl #3
	add	r2, r5, #8
.L296:
	add	r1, r3, #8
	ldmia	r1, {r0-r1}
	stm	r2!, {r0-r1}
	add	r3, r3, lr
	cmp	ip, r2
	bne	.L296
	add	r4, r4, #1
	cmp	r7, r4
	add	r5, r5, r6
	add	ip, ip, r6
	bne	.L295
.L291:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L292:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error(PLT)
	.size	mat_trn, .-mat_trn
	.align	2
	.global	mat_minor
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_minor, %function
mat_minor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, r0
	sub	r0, r1, #1
	mov	r8, r3
	mov	r3, r0
	mov	r7, r1
	mul	r3, r0, r3
	lsl	r0, r3, #3
	mov	r10, r2
	bl	malloc(PLT)
	cmp	r7, #0
	movne	r2, #0
	movne	lr, r0
	movne	r3, r2
	beq	.L305
.L306:
	subs	r1, r10, r3
	movne	r1, #1
	mov	ip, #0
	add	r5, r9, r2, lsl #3
	b	.L309
.L311:
	mov	ip, r4
.L309:
	cmp	r8, ip
	moveq	r6, #0
	andne	r6, r1, #1
	cmp	r6, #0
	vldrne.64	d7, [r5]
	add	r4, ip, #1
	vstmiane.64	lr!, {d7}
	cmp	r7, r4
	add	r5, r5, #8
	bne	.L311
	cmp	r3, ip
	add	r2, r2, r7
	add	r3, r3, #1
	bne	.L306
.L305:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r1, #1
	mov	r9, r0
	vpush.64	{d8, d9, d10, d11, d12}
	beq	.L317
	cmp	r1, #2
	mov	r5, r1
	beq	.L318
	cmp	r1, #0
	beq	.L327
	vldr.64	d7, .L334
	sub	r6, r1, #1
	mul	r3, r6, r6
	lsl	r3, r3, #3
	mov	r7, r0
	vldr.64	d8, .L334+8
	vldr.64	d10, .L334+16
	vmov	s24, r3	@ int
	vmov.f64	d9, d7
	mov	r8, #0
.L320:
	vldmia.64	r7!, {d11}
	vmov	r0, s24	@ int
	vmul.f64	d11, d11, d7
	mov	fp, #0
	bl	malloc(PLT)
	mov	r10, fp
	mov	r2, r0
.L322:
	subs	lr, r10, #0
	movne	lr, #1
	mov	r3, #0
	add	ip, r9, fp, lsl #3
	b	.L324
.L329:
	mov	r3, r1
.L324:
	cmp	r8, r3
	moveq	r4, #0
	andne	r4, lr, #1
	cmp	r4, #0
	vldrne.64	d7, [ip]
	add	r1, r3, #1
	vstmiane.64	r2!, {d7}
	cmp	r5, r1
	add	ip, ip, #8
	bne	.L329
	cmp	r10, r3
	add	fp, fp, r5
	add	r10, r10, #1
	bne	.L322
	mov	r1, r6
	bl	mat_det(PLT)
	cmp	r6, r8
	vmla.f64	d8, d11, d0
	beq	.L319
	add	r8, r8, #1
	tst	r8, #1
	vmoveq.f64	d7, d9
	vmovne.f64	d7, d10
	b	.L320
.L327:
	vldr.64	d8, .L334
.L319:
	mov	r0, r9
	bl	free(PLT)
	vmov.f64	d0, d8
	vldm	sp!, {d8-d12}
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L318:
	vldr.64	d7, [r0, #8]
	vldr.64	d8, [r0, #16]
	vldr.64	d5, [r0]
	vldr.64	d6, [r0, #24]
	vmul.f64	d8, d7, d8
	vnmls.f64	d8, d5, d6
	b	.L319
.L317:
	vldr.64	d8, [r0]
	b	.L319
.L335:
	.align	3
.L334:
	.word	0
	.word	1072693248
	.word	0
	.word	0
	.word	0
	.word	-1074790400
	.size	mat_det, .-mat_det
	.align	2
	.global	mat_inv
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_inv, %function
mat_inv:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r1
	vpush.64	{d8, d9, d10, d11, d12, d13}
	mov	r1, r3
	ldr	r3, [r5, #4]
	sub	sp, sp, #20
	str	r2, [sp, #12]
	ldm	r3, {r2, r4}
	cmp	r2, r4
	str	r0, [sp, #8]
	bne	.L380
	ldr	r3, [r0]
	ldr	r2, [r3]
	cmp	r4, r2
	bhi	.L338
	ldr	r3, [r3, #4]
	cmp	r4, r3
	bhi	.L338
	mul	r0, r4, r4
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #4]
	lsl	r0, r0, #3
	str	r4, [r3, #4]
	str	r4, [r3]
	bl	malloc(PLT)
	ldr	r3, [r5]
	ldr	r7, [r3, #4]
	cmp	r4, #0
	add	r7, r7, #1
	mov	r8, r0
	ldr	r5, [r5, #8]
	lsl	r7, r7, #3
	beq	.L358
	mov	r3, r0
	mov	r6, #0
	add	r2, r7, #8
	add	r5, r5, r2
	lsl	r9, r4, #3
.L341:
	mov	r1, r5
	mov	r0, r3
	mov	r2, r9
	bl	memcpy(PLT)
	add	r6, r6, #1
	cmp	r4, r6
	add	r3, r0, r9
	add	r5, r5, r7
	bne	.L341
	sub	r7, r4, #1
	mul	r3, r7, r7
	lsl	r6, r3, #3
	vldr.64	d8, .L381
	vldr.64	d11, .L381+8
	vldr.64	d10, .L381+16
	mov	r10, r8
	mov	r5, #0
	vmov	s26, r6	@ int
.L347:
	tst	r5, #1
	vmoveq.f64	d7, d10
	vmovne.f64	d7, d11
	vldmia.64	r10!, {d9}
	mov	r0, r6
	vmul.f64	d9, d9, d7
	mov	r9, #0
	bl	malloc(PLT)
	mov	lr, r9
	mov	r2, r0
.L343:
	subs	fp, lr, #0
	movne	fp, #1
	mov	r3, #0
	add	r1, r8, r9, lsl #3
.L345:
	cmp	r5, r3
	moveq	ip, #0
	andne	ip, fp, #1
	cmp	ip, #0
	vldrne.64	d7, [r1]
	add	r3, r3, #1
	vstmiane.64	r2!, {d7}
	cmp	r4, r3
	add	r1, r1, #8
	bne	.L345
	add	lr, lr, #1
	cmp	r4, lr
	add	r9, r9, r4
	bne	.L343
	mov	r1, r7
	bl	mat_det(PLT)
	add	r5, r5, #1
	cmp	r4, r5
	vmla.f64	d8, d9, d0
	bne	.L347
	vldr.64	d12, .L381
	vldr.64	d11, .L381+8
	vldr.64	d10, .L381+16
	mov	r5, #0
	ldr	r2, [sp, #8]
	ldr	r3, [r2]
	ldr	r3, [r3, #4]
	ldr	r2, [r2, #8]
	add	r3, r3, #1
	add	r3, r2, r3, lsl #3
	str	r3, [sp, #4]
.L357:
	mov	r6, #0
	ldr	r3, [sp, #4]
	add	r9, r3, #8
.L355:
	vcmp.f64	d8, #0
	vmrs	APSR_nzcv, FPSCR
	vmoveq.f64	d7, d12
	beq	.L349
	add	r3, r5, r6
	tst	r3, #1
	vmov	r0, s26	@ int
	vmoveq.f64	d9, d10
	vmovne.f64	d9, d11
	mov	fp, #0
	bl	malloc(PLT)
	mov	r10, fp
	mov	r2, r0
.L351:
	subs	lr, r6, r10
	movne	lr, #1
	mov	r3, #0
	add	r1, r8, fp, lsl #3
.L353:
	cmp	r5, r3
	moveq	ip, #0
	andne	ip, lr, #1
	cmp	ip, #0
	vldrne.64	d7, [r1]
	add	r3, r3, #1
	vstmiane.64	r2!, {d7}
	cmp	r4, r3
	add	r1, r1, #8
	bne	.L353
	add	r10, r10, #1
	cmp	r4, r10
	add	fp, fp, r4
	bne	.L351
	mov	r1, r7
	bl	mat_det(PLT)
	vmul.f64	d0, d0, d9
	vdiv.f64	d7, d0, d8
.L349:
	add	r6, r6, #1
	cmp	r4, r6
	vstmia.64	r9!, {d7}
	bne	.L355
	ldr	r3, [sp, #8]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	ldr	r2, [sp, #4]
	add	r5, r5, #1
	add	r3, r3, #1
	add	r3, r2, r3, lsl #3
	cmp	r4, r5
	str	r3, [sp, #4]
	bne	.L357
.L340:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	vstrne.64	d8, [r3]
	mov	r0, r8
	bl	free(PLT)
	add	sp, sp, #20
	@ sp needed
	vldm	sp!, {d8-d13}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L358:
	vldr.64	d8, .L381
	b	.L340
.L380:
	mov	r0, #7
	bl	runtime_error(PLT)
.L338:
	mov	r0, #6
	bl	runtime_error(PLT)
.L382:
	.align	3
.L381:
	.word	0
	.word	0
	.word	0
	.word	-1074790400
	.word	0
	.word	1072693248
	.size	mat_inv, .-mat_inv
	.align	2
	.global	mat_scalar
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_scalar, %function
mat_scalar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, [r1, #4]
	ldr	lr, [r0]
	ldr	r4, [r3]
	ldr	ip, [lr]
	cmp	r4, ip
	bhi	.L384
	ldr	r3, [r3, #4]
	ldr	ip, [lr, #4]
	cmp	r3, ip
	bhi	.L384
	ldmib	r0, {r2, ip}
	str	r3, [r2, #4]
	cmp	r4, #0
	ldr	lr, [lr, #4]
	add	lr, lr, #1
	add	ip, ip, lr, lsl #3
	str	r4, [r2]
	lsl	lr, lr, #3
	beq	.L383
	cmp	r3, #0
	beq	.L383
	add	r3, r3, #1
	ldr	r6, [r1, #8]
	add	r0, ip, r3, lsl #3
	ldr	r3, [r1]
	mov	r1, #0
	ldr	r5, [r3, #4]
	add	r5, r5, #1
.L388:
	add	r1, r1, #1
	mul	r2, r1, r5
	add	r2, r2, #1
	add	r3, ip, #8
	add	r2, r6, r2, lsl #3
.L389:
	vldmia.64	r2!, {d7}
	vmul.f64	d7, d7, d0
	vstmia.64	r3!, {d7}
	cmp	r0, r3
	bne	.L389
	cmp	r4, r1
	add	ip, ip, lr
	add	r0, r0, lr
	bne	.L388
.L383:
	pop	{r4, r5, r6, lr}
	bx	lr
.L384:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error(PLT)
	.size	mat_scalar, .-mat_scalar
	.align	2
	.global	mat_zer_con_idn_dim
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_zer_con_idn_dim, %function
mat_zer_con_idn_dim:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, [r0]
	ldr	r4, [r0, #4]
	ldr	r5, [lr]
	ldr	r3, [lr, #4]
	cmp	r1, #1
	mov	ip, r0
	str	r5, [r4]
	str	r3, [r4, #4]
	beq	.L400
	cmp	r1, #2
	beq	.L401
	cmp	r1, #0
	beq	.L428
.L399:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L400:
	ldr	r1, [lr, #4]
	cmp	r3, r1
	bhi	.L407
	ldr	ip, [r0, #8]
	add	r1, r1, #1
	cmp	r5, #0
	lsl	r4, r1, #3
	add	ip, ip, r1, lsl #3
	beq	.L399
	cmp	r3, #0
	beq	.L399
	mov	lr, #0
	mov	r0, #0
	add	r3, r3, #1
	ldr	r1, .L429
	add	r2, ip, r3, lsl #3
.L409:
	add	r3, ip, #8
.L410:
	stm	r3!, {r0-r1}
	cmp	r2, r3
	bne	.L410
	add	lr, lr, #1
	cmp	r5, lr
	add	ip, ip, r4
	add	r2, r2, r4
	bne	.L409
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L428:
	ldr	r0, [lr, #4]
	cmp	r3, r0
	bhi	.L407
	add	r6, r0, #1
	cmp	r5, #0
	ldr	r0, [ip, #8]
	lsl	r6, r6, #3
	beq	.L399
	cmp	r3, #0
	beq	.L399
	mov	r4, r1
	lsl	r7, r3, #3
	add	r3, r6, #8
	add	r3, r0, r3
.L406:
	mov	r0, r3
	mov	r2, r7
	mov	r1, #0
	bl	memset(PLT)
	add	r4, r4, #1
	cmp	r5, r4
	add	r3, r0, r6
	bne	.L406
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L401:
	mov	r1, r2
	pop	{r4, r5, r6, r7, r8, lr}
	b	mat_idn(PLT)
.L407:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error(PLT)
.L430:
	.align	2
.L429:
	.word	1072693248
	.size	mat_zer_con_idn_dim, .-mat_zer_con_idn_dim
	.section	.rodata.str1.4
	.align	2
.LC14:
	.ascii	"? \000"
	.align	2
.LC15:
	.ascii	"%lf\000"
	.text
	.align	2
	.global	mat_input
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_input, %function
mat_input:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L470+8
	ldr	r5, .L470+12
	ldr	r4, .L470+16
	ldr	r7, .L470+20
.LPIC108:
	add	r3, pc, r3
	mov	r6, r0
	sub	sp, sp, #36
.LPIC109:
	add	r5, pc, r5
	mov	r0, #63
	mov	r8, r1
	str	r2, [sp, #12]
	ldr	r3, [r3]
.LPIC106:
	add	r4, pc, r4
.LPIC110:
	add	r7, pc, r7
	b	.L432
.L435:
	ldr	r3, [r5, r2]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r7]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r7]
	beq	.L433
.L432:
	cmp	r3, #74
	ldr	r2, .L470+24
	bls	.L435
	ldrb	r3, [r4]	@ zero_extendqisi2
.L466:
	cmp	r3, #0
	bne	.L466
.L433:
	ldr	r3, .L470+28
	ldr	r3, [r5, r3]
	add	r0, sp, #16
	ldr	r2, [r3]
	mov	r1, #16
	str	r3, [sp, #8]
	str	r0, [sp, #4]
	bl	fgets(PLT)
	ldrb	r3, [sp, #16]	@ zero_extendqisi2
	cmp	r3, #31
	vldrls.64	d7, .L470
	bls	.L446
	ldr	r10, .L470+32
	ldr	r4, .L470+36
	mov	r9, #0
	ldr	fp, [sp, #4]
.LPIC113:
	add	r10, pc, r10
.LPIC114:
	add	r4, pc, r4
	b	.L450
.L468:
	ldr	r2, [r8]
	cmp	r2, r9
	bls	.L437
	mov	r3, #0
	ldr	r1, .L470+40
	mov	r0, fp
	mov	r2, r6
	strb	r3, [ip]
.LPIC112:
	add	r1, pc, r1
	add	fp, ip, #1
	bl	__isoc99_sscanf(PLT)
.L447:
	mov	r9, r7
.L450:
	mov	r1, #44
	mov	r0, fp
	bl	strchr(PLT)
	subs	ip, r0, #0
	add	r6, r6, #8
	add	r7, r9, #1
	bne	.L468
.L437:
	mov	r2, r6
	mov	r1, r10
	mov	r0, fp
	bl	__isoc99_sscanf(PLT)
	ldr	r3, [r8]
	cmp	r3, r7
	bcs	.L469
.L451:
	vmov	s15, r7	@ int
	vcvt.f64.u32	d7, s15
.L446:
	ldr	r3, [sp, #12]
	vstr.64	d7, [r3]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L469:
	ldr	r3, .L470+44
	ldr	fp, .L470+48
.LPIC116:
	add	r3, pc, r3
	mov	r0, #63
	ldr	r3, [r3]
.LPIC107:
	add	fp, pc, fp
	b	.L441
.L444:
	ldr	r3, [r5, r2]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r4]
	ldrb	r0, [fp, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r4]
	beq	.L442
.L441:
	cmp	r3, #74
	ldr	r2, .L470+24
	bls	.L444
	ldrb	r3, [fp]	@ zero_extendqisi2
.L467:
	cmp	r3, #0
	bne	.L467
.L442:
	ldmib	sp, {r0, r3}
	mov	r1, #16
	ldr	r2, [r3]
	bl	fgets(PLT)
	ldrb	r3, [sp, #16]	@ zero_extendqisi2
	cmp	r3, #31
	bls	.L451
	ldr	r3, [r8]
	cmp	r3, r7
	bcc	.L451
	ldr	fp, [sp, #4]
	b	.L447
.L471:
	.align	3
.L470:
	.word	0
	.word	0
	.word	.LANCHOR0-(.LPIC108+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC109+8)
	.word	.LC14-(.LPIC106+8)
	.word	.LANCHOR0-(.LPIC110+8)
	.word	stdout(GOT)
	.word	stdin(GOT)
	.word	.LC15-(.LPIC113+8)
	.word	.LANCHOR0-(.LPIC114+8)
	.word	.LC15-(.LPIC112+8)
	.word	.LANCHOR0-(.LPIC116+8)
	.word	.LC14-(.LPIC107+8)
	.size	mat_input, .-mat_input
	.align	2
	.global	change_from_string
	.syntax unified
	.arm
	.fpu vfp
	.type	change_from_string, %function
change_from_string:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, [r0]
	mov	r0, r4
	mov	r6, r2
	mov	r5, r1
	mov	r7, r3
	bl	strlen(PLT)
	cmp	r0, r6
	bhi	.L473
	cmp	r0, #0
	subne	r3, r4, #1
	addne	r2, r5, #8
	addne	ip, r3, r0
	beq	.L475
.L476:
	ldrb	r1, [r3, #1]!	@ zero_extendqisi2
	vmov	s14, r1	@ int
	vcvt.f64.u32	d7, s14
	cmp	r3, ip
	vstmia.64	r2!, {d7}
	bne	.L476
.L475:
	vmov	s15, r0	@ int
	vcvt.f64.s32	d7, s15
	vstr.64	d7, [r5]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L473:
	mov	r1, r7
	mov	r0, #6
	bl	runtime_error(PLT)
	.size	change_from_string, .-change_from_string
	.align	2
	.global	change_to_string
	.syntax unified
	.arm
	.fpu vfp
	.type	change_to_string, %function
change_to_string:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	vldr.64	d7, [r1]
	vcvt.u32.f64	s15, d7
	push	{r4, r5, r6, lr}
	vmov	r5, s15	@ int
	cmp	r5, #255
	bhi	.L494
	mov	r6, r0
	ldr	r0, [r0]
	cmp	r0, #0
	mov	r4, r1
	blne	free(PLT)
.L481:
	add	r0, r5, #1
	bl	malloc(PLT)
	cmp	r5, #0
	mov	r3, r0
	str	r0, [r6]
	beq	.L482
	vldr.64	d7, [r4, #8]
	vcvt.u32.f64	s15, d7
	vmov	r3, s15	@ int
	cmp	r5, #1
	strb	r3, [r0]
	addne	r1, r4, #16
	movne	r3, #1
	beq	.L485
.L484:
	vldmia.64	r1!, {d7}
	vcvt.u32.f64	s15, d7
	vmov	r2, s15	@ int
	ldr	ip, [r6]
	strb	r2, [ip, r3]
	add	r3, r3, #1
	cmp	r5, r3
	bne	.L484
.L485:
	ldr	r3, [r6]
.L482:
	mov	r2, #0
	strb	r2, [r3, r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L494:
	mov	r1, r3
	mov	r0, #10
	bl	runtime_error(PLT)
	.size	change_to_string, .-change_to_string
	.align	2
	.global	input_number
	.syntax unified
	.arm
	.fpu vfp
	.type	input_number, %function
input_number:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L515
.LPIC118:
	add	r3, pc, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r7, .L515+4
	cmp	r3, #0
.LPIC119:
	add	r7, pc, r7
	mov	r4, r0
	sub	sp, sp, #20
	bne	.L514
.L497:
	ldr	r3, .L515+8
	ldr	r5, [r7, r3]
	ldr	r0, [r5]
	bl	fgetc(PLT)
	and	r0, r0, #255
	mov	r7, sp
	cmp	r0, #10
	cmpne	r0, #44
	mov	r6, r7
	strb	r0, [sp]
	bne	.L504
	b	.L502
.L503:
	ldr	r0, [r5]
	bl	fgetc(PLT)
	and	r0, r0, #255
	cmp	r0, #10
	cmpne	r0, #44
	strb	r0, [r6, #1]!
	beq	.L502
.L504:
	ldr	r0, [r5]
	bl	feof(PLT)
	cmp	r0, #0
	beq	.L503
	ldrb	r0, [r6]	@ zero_extendqisi2
.L502:
	sub	r2, r0, #10
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	mov	r2, r4
	mov	r4, #0
	ldr	r1, .L515+12
.LPIC122:
	add	r1, pc, r1
	strb	r3, [r1]
	ldr	r1, .L515+16
	mov	r0, r7
	strb	r4, [r6, #1]
.LPIC123:
	add	r1, pc, r1
	bl	__isoc99_sscanf(PLT)
	ldr	r3, .L515+20
.LPIC124:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r4, [r3]
	str	r2, [r3, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L514:
	ldr	r3, .L515+24
	ldr	r5, .L515+28
	ldr	r6, .L515+32
.LPIC127:
	add	r3, pc, r3
	mov	r0, #63
	ldr	r3, [r3]
.LPIC117:
	add	r5, pc, r5
.LPIC120:
	add	r6, pc, r6
	b	.L498
.L500:
	ldr	r3, [r7, r2]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r6]
	ldrb	r0, [r5, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r6]
	beq	.L497
.L498:
	cmp	r3, #74
	ldr	r2, .L515+36
	bls	.L500
	ldrb	r3, [r5]	@ zero_extendqisi2
.L513:
	cmp	r3, #0
	bne	.L513
	b	.L497
.L516:
	.align	2
.L515:
	.word	.LANCHOR1-(.LPIC118+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC119+8)
	.word	stdin(GOT)
	.word	.LANCHOR1-(.LPIC122+8)
	.word	.LC15-(.LPIC123+8)
	.word	.LANCHOR0-(.LPIC124+8)
	.word	.LANCHOR0-(.LPIC127+8)
	.word	.LC14-(.LPIC117+8)
	.word	.LANCHOR0-(.LPIC120+8)
	.word	stdout(GOT)
	.size	input_number, .-input_number
	.align	2
	.global	input_string
	.syntax unified
	.arm
	.fpu vfp
	.type	input_string, %function
input_string:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 256
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L523
	ldr	r2, .L523+4
.LPIC128:
	add	r3, pc, r3
	mov	r1, #255
	sub	sp, sp, #256
	mov	r4, sp
	ldr	r2, [r3, r2]
	mov	r0, r4
	ldr	r2, [r2]
	bl	fgets(PLT)
	mov	r1, #10
	mov	r0, r4
	bl	strchr(PLT)
	cmp	r0, #0
	movne	r3, #0
	mov	r1, #0
	strbne	r3, [r0]
	ldr	r3, .L523+8
.LPIC129:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	mov	r0, r4
	add	r2, r2, #1
	stm	r3, {r1, r2}
	bl	strdup(PLT)
	add	sp, sp, #256
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L524:
	.align	2
.L523:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC128+8)
	.word	stdin(GOT)
	.word	.LANCHOR0-(.LPIC129+8)
	.size	input_string, .-input_string
	.align	2
	.global	random_lcg
	.syntax unified
	.arm
	.fpu vfp
	.type	random_lcg, %function
random_lcg:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	bne	.L527
	ldr	r3, .L528+16
.LPIC132:
	add	r3, pc, r3
	ldr	r2, .L528+20
	ldr	r0, [r3, #4]
	mul	r0, r2, r0
	add	r0, r0, #12288
	add	r0, r0, #57
	bic	r0, r0, #-2147483648
	vmov	s13, r0	@ int
	vldr.64	d7, .L528
	vcvt.f64.s32	d0, s13
	vmul.f64	d0, d0, d7
.L526:
	ldr	r3, .L528+24
.LPIC133:
	add	r3, pc, r3
	str	r0, [r3, #4]
	bx	lr
.L527:
	vldr.64	d0, .L528+8
	b	.L526
.L529:
	.align	3
.L528:
	.word	0
	.word	1040187392
	.word	0
	.word	0
	.word	.LANCHOR1-(.LPIC132+8)
	.word	1103515245
	.word	.LANCHOR1-(.LPIC133+8)
	.size	random_lcg, .-random_lcg
	.align	2
	.global	cot
	.syntax unified
	.arm
	.fpu vfp
	.type	cot, %function
cot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	mov	r1, sp
	add	r0, sp, #8
	bl	sincos(PLT)
	vldr.64	d0, [sp]
	vldr.64	d7, [sp, #8]
	vmov.f64	d6, d0
	vdiv.f64	d0, d6, d7
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vcmpe.f64	d0, #0
	vmrs	APSR_nzcv, FPSCR
	ble	.L536
	vldr.64	d0, .L537
	bx	lr
.L536:
	bmi	.L535
	vldr.64	d0, .L537+8
	bx	lr
.L535:
	vldr.64	d0, .L537+16
	bx	lr
.L538:
	.align	3
.L537:
	.word	0
	.word	1072693248
	.word	0
	.word	0
	.word	0
	.word	-1074790400
	.size	sgn, .-sgn
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	basic_run(PLT)
	pop	{r4, lr}
	bx	lr
	.size	main, .-main
	.global	MaxString
	.global	SemiColon
	.global	Comma
	.global	PrintWidth
	.global	TmpBufSz
	.global	vpos
	.global	pos
	.section	.rodata
	.align	2
	.type	MaxString, %object
	.size	MaxString, 4
MaxString:
	.word	255
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
	.type	prompt.1, %object
	.size	prompt.1, 1
prompt.1:
	.byte	1
	.space	3
	.type	x.0, %object
	.size	x.0, 4
x.0:
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
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",%progbits
