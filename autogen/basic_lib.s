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
	@ args = 0, pretend = 0, frame = 256
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r2, .L26
	mov	r1, #256
	sub	sp, sp, #264
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
	add	sp, sp, #264
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
	@ args = 0, pretend = 0, frame = 256
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r2, .L39
	mov	r3, r0
	sub	sp, sp, #256
	mov	r4, sp
	mov	r1, #256
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
	add	sp, sp, #256
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	ip, .L125
.LPIC53:
	add	ip, pc, ip
	add	fp, sp, #32
	sub	sp, sp, #28
	vldr.64	d7, [r0]
	vcvt.u32.f64	s15, d7
	str	r2, [fp, #-44]
	vmov	r2, s15	@ int
	cmp	r2, r1
	vstr.32	s15, [fp, #-40]	@ int
	str	ip, [fp, #-48]
	bhi	.L92
	cmp	r2, #0
	beq	.L121
	mov	r7, #0
	ldr	r3, .L125+4
	ldr	r10, .L125+8
	ldr	r5, [ip, r3]
	ldr	r6, .L125+12
	add	r8, r0, #8
.LPIC54:
	add	r10, pc, r10
.L104:
	mov	r9, sp
	sub	sp, sp, #256
	vldmia.64	r8!, {d7}
	mov	r4, sp
	vstmia.64	r4!, {d7}
	ldr	r2, .L125+16
	mov	r1, #256
	mov	r0, r4
.LPIC52:
	add	r2, pc, r2
	bl	snprintf(PLT)
	ldrb	r0, [sp, #8]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L96
	ldr	r2, .L125+20
.LPIC72:
	add	r2, pc, r2
	ldr	r2, [r2]
	b	.L97
.L99:
	ldr	r1, [r5]
	bl	putc(PLT)
	ldr	r2, [r10]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r0, #0
	str	r2, [r10]
	beq	.L96
.L97:
	cmp	r2, #74
	bls	.L99
	ldrb	r2, [r4]	@ zero_extendqisi2
.L120:
	cmp	r2, #0
	bne	.L120
.L96:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	mov	sp, r9
	beq	.L122
	ldr	r4, .L125+24
	ldr	r1, [r5]
.LPIC56:
	add	r4, pc, r4
	mov	r0, #32
	bl	putc(PLT)
	ldr	r1, [r4]
	add	r2, r1, #16
	cmp	r2, #75
	add	r1, r1, #1
	str	r1, [r4]
	bhi	.L123
.L101:
	ldr	r3, [fp, #-40]
	add	r7, r7, #1
	cmp	r3, r7
	bne	.L104
.L105:
	cmp	r1, #0
	bne	.L124
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L122:
	ldr	r4, .L125+28
	ldr	r1, [r5]
.LPIC61:
	add	r4, pc, r4
	mov	r0, #32
	bl	putc(PLT)
	ldr	r0, [r4]
	add	r1, r0, #1
	add	r2, r1, r1, lsl #4
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	rsb	r2, r2, #0
	cmp	r2, r6
	str	r1, [r4]
	bls	.L102
.L103:
	ldr	r1, [r5]
	mov	r0, #32
	bl	putc(PLT)
	ldr	r0, [r4]
	add	r1, r0, #1
	add	r3, r1, r1, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #0
	cmp	r3, r6
	str	r1, [r4]
	bhi	.L103
.L102:
	add	r0, r0, #16
	cmp	r0, #75
	bls	.L101
	ldr	r1, [r5]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r2, .L125+32
.LPIC65:
	add	r2, pc, r2
	ldr	r0, [r2, #4]
	add	r0, r0, #1
	str	r0, [r2, #4]
	str	r1, [r2]
	b	.L101
.L123:
	ldr	r1, [r5]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r2, [r4, #4]
	add	r2, r2, #1
	stm	r4, {r1, r2}
	b	.L101
.L124:
	ldr	r2, [fp, #-48]
	ldr	r3, .L125+4
	ldr	r3, [r2, r3]
	mov	r0, #10
	ldr	r1, [r3]
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L125+36
.LPIC69:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L121:
	ldr	r3, .L125+40
.LPIC68:
	ldr	r1, [pc, r3]		@ tls_load_dot_plus_eight
	b	.L105
.L92:
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error(PLT)
.L126:
	.align	2
.L125:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC53+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC54+8)
	.word	286331153
	.word	.LC0-(.LPIC52+8)
	.word	.LANCHOR0-(.LPIC72+8)
	.word	.LANCHOR0-(.LPIC56+8)
	.word	.LANCHOR0-(.LPIC61+8)
	.word	.LANCHOR0-(.LPIC65+8)
	.word	.LANCHOR0-(.LPIC69+8)
	.word	.LANCHOR0-(.LPIC68+8)
	.size	mat_print, .-mat_print
	.align	2
	.global	mat_print2
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_print2, %function
mat_print2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	add	fp, sp, #32
	sub	sp, sp, #36
	mov	ip, r1
	ldr	r3, .L171
	ldr	r2, .L171+4
.LPIC73:
	add	r3, pc, r3
	ldr	r5, [r3, r2]
	ldr	r3, [r8]
	ldr	r3, [r3, #4]
	ldr	r2, [r8, #8]
	add	r3, r3, #1
	add	r3, r2, r3, lsl #3
	ldr	r1, [r5]
	mov	r0, #10
	str	r3, [fp, #-48]
	str	ip, [fp, #-44]
	bl	putc(PLT)
	mov	r0, #0
	ldr	r3, .L171+8
.LPIC74:
	add	r3, pc, r3
	ldr	r1, [r3, #4]
	ldr	r2, [r8, #4]
	add	r1, r1, #1
	str	r1, [r3, #4]
	ldr	r1, [r2]
	cmp	r1, r0
	str	r0, [r3]
	beq	.L127
	ldr	r9, .L171+12
.LPIC78:
	add	r9, pc, r9
	mov	r10, r9
	mov	r9, r8
	ldr	r3, .L171+16
.LPIC101:
	add	r3, pc, r3
	str	r0, [fp, #-52]
	ldr	r7, .L171+20
	str	r3, [fp, #-56]
.L128:
	ldr	r2, [r2, #4]
	cmp	r2, #0
	ldreq	r1, [r5]
	beq	.L143
	mov	r8, r10
	mov	r6, #0
	mov	r10, r9
	ldr	r3, [fp, #-48]
	add	r3, r3, #8
	str	r3, [fp, #-40]
.L142:
	ldr	r3, [fp, #-40]
	mov	r9, sp
	sub	sp, sp, #256
	vldmia.64	r3!, {d7}
	mov	r4, sp
	str	r3, [fp, #-40]
	vstmia.64	r4!, {d7}
	ldr	r2, .L171+24
	mov	r1, #256
	mov	r0, r4
.LPIC77:
	add	r2, pc, r2
	bl	snprintf(PLT)
	ldrb	r0, [sp, #8]	@ zero_extendqisi2
	cmp	r0, #0
	add	r6, r6, #1
	beq	.L131
	ldr	r2, .L171+28
.LPIC111:
	add	r2, pc, r2
	ldr	r2, [r2]
	b	.L132
.L134:
	ldr	r1, [r5]
	bl	putc(PLT)
	ldr	r2, [r8]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r0, #0
	str	r2, [r8]
	beq	.L131
.L132:
	cmp	r2, #74
	bls	.L134
	ldrb	r2, [r4]	@ zero_extendqisi2
.L166:
	cmp	r2, #0
	bne	.L166
.L131:
	ldr	r2, [r10, #4]
	ldr	r2, [r2, #4]
	cmp	r6, r2
	mov	sp, r9
	bcs	.L138
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	ldr	r1, [r5]
	beq	.L136
	ldr	r4, .L171+32
	mov	r0, #32
.LPIC80:
	add	r4, pc, r4
	bl	putc(PLT)
	ldr	r2, [r4]
	add	r1, r2, #16
	cmp	r1, #75
	add	r2, r2, #1
	str	r2, [r4]
	bhi	.L137
.L167:
	ldr	r2, [r10, #4]
	ldr	r2, [r2, #4]
.L138:
	cmp	r6, r2
	bne	.L142
	ldr	r4, .L171+36
.LPIC92:
	add	r4, pc, r4
	ldr	r2, [r4]
	cmp	r2, #0
	cmpne	r6, #1
	mov	r9, r10
	movhi	r0, #10
	mov	r10, r8
	ldr	r1, [r5]
	bhi	.L168
.L143:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L145
	ldr	r4, .L171+40
	mov	r0, #32
.LPIC96:
	add	r4, pc, r4
	bl	putc(PLT)
	ldr	r1, [r4]
	add	r2, r1, #16
	cmp	r2, #75
	add	r1, r1, #1
	str	r1, [r4]
	bhi	.L169
.L144:
	ldm	r9, {r0, r2}
	ldr	r3, [fp, #-52]
	ldr	ip, [r2]
	add	r3, r3, #1
	ldr	r0, [r0, #4]
	str	r3, [fp, #-52]
	cmp	ip, r3
	ldr	r3, [fp, #-48]
	add	r0, r0, #1
	add	r3, r3, r0, lsl #3
	str	r3, [fp, #-48]
	bne	.L128
	cmp	r1, #0
	beq	.L127
	ldr	r3, [r2, #4]
	cmp	r3, #1
	beq	.L170
.L127:
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L136:
	ldr	r4, .L171+44
	mov	r0, #32
.LPIC85:
	add	r4, pc, r4
	bl	putc(PLT)
	ldr	r0, [r4]
	add	r1, r0, #1
	add	r2, r1, r1, lsl #4
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	rsb	r2, r2, #0
	cmp	r2, r7
	str	r1, [r4]
	bls	.L139
.L140:
	mov	r0, #32
	ldr	r1, [r5]
	bl	putc(PLT)
	ldr	r0, [r4]
	add	r2, r0, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #0
	cmp	r3, r7
	str	r2, [r4]
	bhi	.L140
.L139:
	add	r0, r0, #16
	cmp	r0, #75
	bls	.L167
	ldr	r1, [r5]
	mov	r0, #10
	bl	putc(PLT)
	mov	ip, #0
	ldr	r1, .L171+48
.LPIC89:
	add	r1, pc, r1
	ldr	r0, [r1, #4]
	ldr	r2, [r10, #4]
	add	r0, r0, #1
	str	r0, [r1, #4]
	ldr	r2, [r2, #4]
	str	ip, [r1]
	b	.L138
.L137:
	ldr	r1, [r5]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r2, [r4, #4]
	add	r2, r2, #1
	str	r2, [r4, #4]
	ldr	r2, [r10, #4]
	ldr	r2, [r2, #4]
	str	r1, [r4]
	b	.L138
.L169:
	mov	r0, #10
	ldr	r1, [r5]
.L168:
	bl	putc(PLT)
	mov	r1, #0
	ldr	r2, [r4, #4]
	add	r2, r2, #1
	stm	r4, {r1, r2}
	b	.L144
.L145:
	mov	r0, #32
	bl	putc(PLT)
	ldr	r3, [fp, #-56]
	ldr	r0, [r3]
	add	r1, r0, #1
	add	r2, r1, r1, lsl #4
	add	r2, r2, r2, lsl #8
	add	r2, r2, r2, lsl #16
	rsb	r2, r2, #0
	cmp	r2, r7
	str	r1, [r3]
	bls	.L146
	ldr	r4, .L171+52
.LPIC103:
	add	r4, pc, r4
.L147:
	ldr	r1, [r5]
	mov	r0, #32
	bl	putc(PLT)
	ldr	r0, [r4]
	add	r1, r0, #1
	add	r3, r1, r1, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #0
	cmp	r3, r7
	str	r1, [r4]
	bhi	.L147
.L146:
	add	r0, r0, #16
	cmp	r0, #75
	bls	.L144
	ldr	r1, [r5]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r2, .L171+56
.LPIC105:
	add	r2, pc, r2
	ldr	r0, [r2, #4]
	add	r0, r0, #1
	str	r0, [r2, #4]
	str	r1, [r2]
	b	.L144
.L170:
	ldr	r1, [r5]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L171+60
.LPIC108:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L172:
	.align	2
.L171:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC73+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC74+8)
	.word	.LANCHOR0-(.LPIC78+8)
	.word	.LANCHOR0-(.LPIC101+8)
	.word	286331153
	.word	.LC0-(.LPIC77+8)
	.word	.LANCHOR0-(.LPIC111+8)
	.word	.LANCHOR0-(.LPIC80+8)
	.word	.LANCHOR0-(.LPIC92+8)
	.word	.LANCHOR0-(.LPIC96+8)
	.word	.LANCHOR0-(.LPIC85+8)
	.word	.LANCHOR0-(.LPIC89+8)
	.word	.LANCHOR0-(.LPIC103+8)
	.word	.LANCHOR0-(.LPIC105+8)
	.word	.LANCHOR0-(.LPIC108+8)
	.size	mat_print2, .-mat_print2
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
	ldr	r9, [r0, #4]
	ldr	r8, .L208
	cmp	r9, #0
.LPIC112:
	add	r8, pc, r8
	beq	.L199
	mov	r7, r1
	ldr	r3, .L208+4
	ldr	r10, .L208+8
	ldr	r4, [r8, r3]
	ldr	r5, .L208+12
	add	r6, r0, #4
.LPIC113:
	add	r10, pc, r10
.L174:
	ldrb	r0, [r9]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L177
	ldr	r3, .L208+16
.LPIC131:
	add	r3, pc, r3
	ldr	r3, [r3]
	b	.L176
.L179:
	ldr	r1, [r4]
	bl	putc(PLT)
	ldr	r3, [r10]
	add	r3, r3, #1
	str	r3, [r10]
	ldrb	r0, [r9, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L177
.L176:
	cmp	r3, #74
	bls	.L179
	ldrb	r3, [r9]	@ zero_extendqisi2
.L202:
	cmp	r3, #0
	bne	.L202
.L177:
	cmp	r7, #0
	ldr	r1, [r4]
	beq	.L204
	ldr	r9, .L208+20
	mov	r0, #32
.LPIC115:
	add	r9, pc, r9
	bl	putc(PLT)
	ldr	r2, [r9]
	add	r3, r2, #16
	cmp	r3, #75
	add	r2, r2, #1
	str	r2, [r9]
	bhi	.L205
.L181:
	ldr	r9, [r6, #4]!
	cmp	r9, #0
	bne	.L174
.L184:
	cmp	r2, #0
	bne	.L206
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L204:
	ldr	r9, .L208+24
	mov	r0, #32
.LPIC120:
	add	r9, pc, r9
	b	.L203
.L207:
	mov	r0, #32
	ldr	r1, [r4]
.L203:
	bl	putc(PLT)
	ldr	r1, [r9]
	add	r2, r1, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #0
	cmp	r3, r5
	str	r2, [r9]
	bhi	.L207
	add	r1, r1, #16
	cmp	r1, #75
	bls	.L181
	ldr	r1, [r4]
	mov	r0, #10
	bl	putc(PLT)
	mov	r2, #0
	ldr	r3, .L208+28
.LPIC124:
	add	r3, pc, r3
	ldr	r1, [r3, #4]
	add	r1, r1, #1
	str	r1, [r3, #4]
	str	r2, [r3]
	b	.L181
.L205:
	mov	r0, #10
	ldr	r1, [r4]
	bl	putc(PLT)
	mov	r2, #0
	ldr	r3, [r9, #4]
	add	r3, r3, #1
	stm	r9, {r2, r3}
	b	.L181
.L206:
	ldr	r3, .L208+4
	ldr	r3, [r8, r3]
	mov	r0, #10
	ldr	r1, [r3]
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L208+32
.LPIC128:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L199:
	ldr	r3, .L208+36
.LPIC127:
	ldr	r2, [pc, r3]		@ tls_load_dot_plus_eight
	b	.L184
.L209:
	.align	2
.L208:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC112+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC113+8)
	.word	286331153
	.word	.LANCHOR0-(.LPIC131+8)
	.word	.LANCHOR0-(.LPIC115+8)
	.word	.LANCHOR0-(.LPIC120+8)
	.word	.LANCHOR0-(.LPIC124+8)
	.word	.LANCHOR0-(.LPIC128+8)
	.word	.LANCHOR0-(.LPIC127+8)
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
	vmov	s15, r1	@ int
	vcvt.f64.u32	d7, s15
	cmp	r1, #0
	vstr.64	d7, [r0]
	bxeq	lr
	add	ip, r0, #8
	ldr	r0, [r2]
	push	{r4, lr}
	add	lr, r0, #2
	ldr	r4, [r2, #4]
	add	r1, r0, r1
	add	lr, r2, lr, lsl #3
.L213:
	cmp	r4, r0
	beq	.L220
	vldmia.64	lr!, {d7}
	add	r0, r0, #1
	cmp	r0, r1
	str	r0, [r2]
	vstmia.64	ip!, {d7}
	bne	.L213
	pop	{r4, lr}
	bx	lr
.L220:
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
	bhi	.L222
	ldr	r5, [r2, #4]
	ldr	r6, [r3, #4]
	cmp	r5, r6
	bhi	.L222
	ldr	r2, [r0, #8]
	add	r6, r6, #1
	cmp	r7, #0
	add	r2, r2, r6, lsl #3
	movne	r4, #0
	lsl	r6, r6, #3
	beq	.L221
.L224:
	cmp	r5, #0
	beq	.L229
	ldm	r1, {r3, lr}
	add	r0, r3, #2
	add	r0, r1, r0, lsl #3
	add	ip, r2, #8
	add	r9, r5, r3
.L227:
	cmp	lr, r3
	beq	.L233
	vldmia.64	r0!, {d7}
	add	r3, r3, #1
	cmp	r3, r9
	str	r3, [r1]
	vstmia.64	ip!, {d7}
	bne	.L227
.L229:
	add	r4, r4, #1
	cmp	r7, r4
	add	r2, r2, r6
	bne	.L224
.L221:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L233:
	mov	r1, r8
	mov	r0, #1
	bl	runtime_error(PLT)
.L222:
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
	beq	.L234
	mov	r7, r2
	mov	r5, r0
	mov	r6, #0
	ldr	r4, [r2, #8]
	add	r10, r2, #16
	lsl	r9, r9, #3
.L240:
	ldr	r3, [r7, #12]
	cmp	r3, r4
	beq	.L242
	ldr	r0, [r5, #4]
	cmp	r0, #0
	beq	.L237
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
	bne	.L240
.L234:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L237:
	add	fp, r4, #1
	add	r4, r10, r4, lsl #2
	str	fp, [r7, #8]
	ldr	r0, [r4, r9]
	bl	strdup(PLT)
	add	r6, r6, #1
	cmp	r8, r6
	str	r0, [r5, #4]!
	beq	.L234
	mov	r4, fp
	b	.L240
.L242:
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
	bne	.L244
	ldr	ip, [ip, #4]
	ldr	lr, [lr, #4]
	cmp	ip, lr
	bne	.L244
	ldr	lr, [r0]
	ldr	r4, [lr]
	cmp	r9, r4
	bhi	.L246
	ldr	r4, [lr, #4]
	cmp	ip, r4
	bhi	.L246
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
	beq	.L243
	cmp	ip, #0
	beq	.L243
	add	r0, ip, #1
	mov	ip, #0
	add	r0, lr, r0, lsl #3
.L249:
	add	r3, lr, #8
	add	r1, r5, #8
	add	r2, r4, #8
.L250:
	vldmia.64	r3!, {d7}
	vldmia.64	r1!, {d6}
	vadd.f64	d7, d7, d6
	cmp	r3, r0
	vstmia.64	r2!, {d7}
	bne	.L250
	add	ip, ip, #1
	cmp	r9, ip
	add	r4, r4, r7
	add	lr, lr, r6
	add	r5, r5, r8
	add	r0, r0, r6
	bne	.L249
.L243:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L244:
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error(PLT)
.L246:
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
	bne	.L260
	ldr	ip, [ip, #4]
	ldr	lr, [lr, #4]
	cmp	ip, lr
	bne	.L260
	ldr	lr, [r0]
	ldr	r4, [lr]
	cmp	r9, r4
	bhi	.L262
	ldr	r4, [lr, #4]
	cmp	ip, r4
	bhi	.L262
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
	beq	.L259
	cmp	ip, #0
	beq	.L259
	add	r0, ip, #1
	mov	ip, #0
	add	r0, lr, r0, lsl #3
.L265:
	add	r3, lr, #8
	add	r1, r5, #8
	add	r2, r4, #8
.L266:
	vldmia.64	r3!, {d7}
	vldmia.64	r1!, {d6}
	vsub.f64	d7, d7, d6
	cmp	r3, r0
	vstmia.64	r2!, {d7}
	bne	.L266
	add	ip, ip, #1
	cmp	r9, ip
	add	r4, r4, r7
	add	lr, lr, r6
	add	r5, r5, r8
	add	r0, r0, r6
	bne	.L265
.L259:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L260:
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error(PLT)
.L262:
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
	bne	.L298
	ldr	lr, [ip]
	mov	r4, lr
	ldr	r3, [r0]
	str	lr, [sp]
	ldr	lr, [r3]
	cmp	r4, lr
	bhi	.L277
	ldr	r2, [r2, #4]
	ldr	lr, [r3, #4]
	cmp	r2, lr
	bhi	.L277
	ldmib	r0, {r1, fp}
	str	r2, [r1, #4]
	cmp	r4, #0
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	add	fp, fp, r3, lsl #3
	lsl	r3, r3, #3
	str	r4, [r1]
	str	r3, [sp, #4]
	beq	.L275
	cmp	r2, #0
	beq	.L275
	mov	r10, #0
	vldr.64	d4, .L299
	add	r2, r2, #1
	ldr	r5, [ip, #4]
	add	r9, fp, r2, lsl #3
.L281:
	mov	r4, #0
	add	r10, r10, #1
	add	r0, fp, #8
.L283:
	cmp	r5, #0
	mov	r2, r4
	vstmia.64	r0!, {d4}
	add	r4, r4, #1
	beq	.L286
	vldr.64	d7, .L299
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
.L285:
	vldmia.64	r3!, {d5}
	vldr.64	d6, [r2, #8]
	vmla.f64	d7, d5, d6
	cmp	ip, r3
	vstr.64	d7, [r0, #-8]
	add	r2, r2, r1
	bne	.L285
.L286:
	cmp	r0, r9
	bne	.L283
	ldr	r3, [sp]
	cmp	r3, r10
	ldr	r3, [sp, #4]
	add	fp, fp, r3
	add	r9, r9, r3
	bne	.L281
.L275:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L298:
	mov	r0, #7
	bl	runtime_error(PLT)
.L277:
	mov	r0, #6
	bl	runtime_error(PLT)
.L300:
	.align	3
.L299:
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
	bhi	.L302
	ldr	r3, [r3, #4]
	ldr	ip, [ip, #4]
	cmp	r3, ip
	bhi	.L302
	ldr	r0, [r0, #8]
	add	ip, ip, #1
	cmp	lr, #0
	add	r0, r0, ip, lsl #3
	lsl	ip, ip, #3
	beq	.L301
	vldr.64	d7, .L315
	vldr.64	d6, .L315+8
	cmp	r1, #0
	vmoveq.f64	d7, d6
	cmp	r3, #0
	beq	.L301
	mov	r1, #0
	add	r3, r3, #1
	add	r2, r0, r3, lsl #3
.L305:
	add	r3, r0, #8
.L306:
	vstmia.64	r3!, {d7}
	cmp	r2, r3
	bne	.L306
	add	r1, r1, #1
	cmp	lr, r1
	add	r0, r0, ip
	add	r2, r2, ip
	bne	.L305
.L301:
	pop	{r4, lr}
	bx	lr
.L302:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error(PLT)
.L316:
	.align	3
.L315:
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
	bne	.L332
	ldr	r3, [r0]
	mov	r2, r1
	ldr	r1, [r3]
	cmp	r4, r1
	bhi	.L319
	ldr	r3, [r3, #4]
	cmp	r4, r3
	bhi	.L319
	ldr	lr, [r0, #8]
	add	r3, r3, #1
	cmp	r4, #0
	lsl	r5, r3, #3
	add	lr, lr, r3, lsl #3
	beq	.L317
	mov	r1, #0
	vldr.64	d6, .L333
	vldr.64	d7, .L333+8
.L326:
	mov	r3, #0
	add	r2, lr, #8
	add	r0, r1, #1
.L325:
	cmp	r1, r3
	beq	.L322
	add	r3, r3, #1
	cmp	ip, r3
	vstmia.64	r2!, {d7}
	bne	.L325
	cmp	r4, r0
	mov	r1, r0
	add	lr, lr, r5
	bne	.L326
.L317:
	pop	{r4, r5, r6, lr}
	bx	lr
.L322:
	cmp	ip, r0
	mov	r3, r0
	vstmia.64	r2!, {d6}
	bne	.L325
	cmp	r4, r0
	mov	r1, r0
	add	lr, lr, r5
	bne	.L326
	b	.L317
.L332:
	mov	r0, #7
	bl	runtime_error(PLT)
.L319:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error(PLT)
.L334:
	.align	3
.L333:
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
	bhi	.L336
	ldr	r7, [r3, #4]
	ldr	lr, [ip]
	cmp	r7, lr
	bhi	.L336
	ldmib	r0, {r2, r5}
	str	r7, [r2]
	cmp	r7, #0
	ldr	r3, [r3]
	str	r3, [r2, #4]
	ldr	r6, [ip, #4]
	add	r6, r6, #1
	add	r5, r5, r6, lsl #3
	lsl	r6, r6, #3
	beq	.L335
	cmp	r3, #0
	beq	.L335
	mov	r4, #0
	add	r3, r3, #1
	add	ip, r5, r3, lsl #3
	ldr	r3, [r1]
	ldr	r8, [r3, #4]
	ldr	r9, [r1, #8]
	add	r8, r8, #1
	lsl	lr, r8, #3
.L339:
	add	r3, r8, r4
	add	r3, r9, r3, lsl #3
	add	r2, r5, #8
.L340:
	add	r1, r3, #8
	ldmia	r1, {r0-r1}
	stm	r2!, {r0-r1}
	add	r3, r3, lr
	cmp	ip, r2
	bne	.L340
	add	r4, r4, #1
	cmp	r7, r4
	add	r5, r5, r6
	add	ip, ip, r6
	bne	.L339
.L335:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L336:
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
	beq	.L349
.L350:
	subs	r1, r10, r3
	movne	r1, #1
	mov	ip, #0
	add	r5, r9, r2, lsl #3
	b	.L353
.L355:
	mov	ip, r4
.L353:
	cmp	r8, ip
	moveq	r6, #0
	andne	r6, r1, #1
	cmp	r6, #0
	vldrne.64	d7, [r5]
	add	r4, ip, #1
	vstmiane.64	lr!, {d7}
	cmp	r7, r4
	add	r5, r5, #8
	bne	.L355
	cmp	r3, ip
	add	r2, r2, r7
	add	r3, r3, #1
	bne	.L350
.L349:
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
	beq	.L361
	cmp	r1, #2
	mov	r5, r1
	beq	.L362
	cmp	r1, #0
	beq	.L371
	vldr.64	d7, .L378
	sub	r6, r1, #1
	mul	r3, r6, r6
	lsl	r3, r3, #3
	mov	r7, r0
	vldr.64	d8, .L378+8
	vldr.64	d10, .L378+16
	vmov	s24, r3	@ int
	vmov.f64	d9, d7
	mov	r8, #0
.L364:
	vldmia.64	r7!, {d11}
	vmov	r0, s24	@ int
	vmul.f64	d11, d11, d7
	mov	fp, #0
	bl	malloc(PLT)
	mov	r10, fp
	mov	r2, r0
.L366:
	subs	lr, r10, #0
	movne	lr, #1
	mov	r3, #0
	add	ip, r9, fp, lsl #3
	b	.L368
.L373:
	mov	r3, r1
.L368:
	cmp	r8, r3
	moveq	r4, #0
	andne	r4, lr, #1
	cmp	r4, #0
	vldrne.64	d7, [ip]
	add	r1, r3, #1
	vstmiane.64	r2!, {d7}
	cmp	r5, r1
	add	ip, ip, #8
	bne	.L373
	cmp	r10, r3
	add	fp, fp, r5
	add	r10, r10, #1
	bne	.L366
	mov	r1, r6
	bl	mat_det(PLT)
	cmp	r6, r8
	vmla.f64	d8, d11, d0
	beq	.L363
	add	r8, r8, #1
	tst	r8, #1
	vmoveq.f64	d7, d9
	vmovne.f64	d7, d10
	b	.L364
.L371:
	vldr.64	d8, .L378
.L363:
	mov	r0, r9
	bl	free(PLT)
	vmov.f64	d0, d8
	vldm	sp!, {d8-d12}
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L362:
	vldr.64	d7, [r0, #8]
	vldr.64	d8, [r0, #16]
	vldr.64	d5, [r0]
	vldr.64	d6, [r0, #24]
	vmul.f64	d8, d7, d8
	vnmls.f64	d8, d5, d6
	b	.L363
.L361:
	vldr.64	d8, [r0]
	b	.L363
.L379:
	.align	3
.L378:
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
	bne	.L424
	ldr	r3, [r0]
	ldr	r2, [r3]
	cmp	r4, r2
	bhi	.L382
	ldr	r3, [r3, #4]
	cmp	r4, r3
	bhi	.L382
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
	beq	.L402
	mov	r3, r0
	mov	r6, #0
	add	r2, r7, #8
	add	r5, r5, r2
	lsl	r9, r4, #3
.L385:
	mov	r1, r5
	mov	r0, r3
	mov	r2, r9
	bl	memcpy(PLT)
	add	r6, r6, #1
	cmp	r4, r6
	add	r3, r0, r9
	add	r5, r5, r7
	bne	.L385
	sub	r7, r4, #1
	mul	r3, r7, r7
	lsl	r6, r3, #3
	vldr.64	d8, .L425
	vldr.64	d11, .L425+8
	vldr.64	d10, .L425+16
	mov	r10, r8
	mov	r5, #0
	vmov	s26, r6	@ int
.L391:
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
.L387:
	subs	fp, lr, #0
	movne	fp, #1
	mov	r3, #0
	add	r1, r8, r9, lsl #3
.L389:
	cmp	r5, r3
	moveq	ip, #0
	andne	ip, fp, #1
	cmp	ip, #0
	vldrne.64	d7, [r1]
	add	r3, r3, #1
	vstmiane.64	r2!, {d7}
	cmp	r4, r3
	add	r1, r1, #8
	bne	.L389
	add	lr, lr, #1
	cmp	r4, lr
	add	r9, r9, r4
	bne	.L387
	mov	r1, r7
	bl	mat_det(PLT)
	add	r5, r5, #1
	cmp	r4, r5
	vmla.f64	d8, d9, d0
	bne	.L391
	vldr.64	d12, .L425
	vldr.64	d11, .L425+8
	vldr.64	d10, .L425+16
	mov	r5, #0
	ldr	r2, [sp, #8]
	ldr	r3, [r2]
	ldr	r3, [r3, #4]
	ldr	r2, [r2, #8]
	add	r3, r3, #1
	add	r3, r2, r3, lsl #3
	str	r3, [sp, #4]
.L401:
	mov	r6, #0
	ldr	r3, [sp, #4]
	add	r9, r3, #8
.L399:
	vcmp.f64	d8, #0
	vmrs	APSR_nzcv, FPSCR
	vmoveq.f64	d7, d12
	beq	.L393
	add	r3, r5, r6
	tst	r3, #1
	vmov	r0, s26	@ int
	vmoveq.f64	d9, d10
	vmovne.f64	d9, d11
	mov	fp, #0
	bl	malloc(PLT)
	mov	r10, fp
	mov	r2, r0
.L395:
	subs	lr, r6, r10
	movne	lr, #1
	mov	r3, #0
	add	r1, r8, fp, lsl #3
.L397:
	cmp	r5, r3
	moveq	ip, #0
	andne	ip, lr, #1
	cmp	ip, #0
	vldrne.64	d7, [r1]
	add	r3, r3, #1
	vstmiane.64	r2!, {d7}
	cmp	r4, r3
	add	r1, r1, #8
	bne	.L397
	add	r10, r10, #1
	cmp	r4, r10
	add	fp, fp, r4
	bne	.L395
	mov	r1, r7
	bl	mat_det(PLT)
	vmul.f64	d0, d0, d9
	vdiv.f64	d7, d0, d8
.L393:
	add	r6, r6, #1
	cmp	r4, r6
	vstmia.64	r9!, {d7}
	bne	.L399
	ldr	r3, [sp, #8]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	ldr	r2, [sp, #4]
	add	r5, r5, #1
	add	r3, r3, #1
	add	r3, r2, r3, lsl #3
	cmp	r4, r5
	str	r3, [sp, #4]
	bne	.L401
.L384:
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
.L402:
	vldr.64	d8, .L425
	b	.L384
.L424:
	mov	r0, #7
	bl	runtime_error(PLT)
.L382:
	mov	r0, #6
	bl	runtime_error(PLT)
.L426:
	.align	3
.L425:
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
	bhi	.L428
	ldr	r3, [r3, #4]
	ldr	ip, [lr, #4]
	cmp	r3, ip
	bhi	.L428
	ldmib	r0, {r2, ip}
	str	r3, [r2, #4]
	cmp	r4, #0
	ldr	lr, [lr, #4]
	add	lr, lr, #1
	add	ip, ip, lr, lsl #3
	str	r4, [r2]
	lsl	lr, lr, #3
	beq	.L427
	cmp	r3, #0
	beq	.L427
	add	r3, r3, #1
	ldr	r6, [r1, #8]
	add	r0, ip, r3, lsl #3
	ldr	r3, [r1]
	mov	r1, #0
	ldr	r5, [r3, #4]
	add	r5, r5, #1
.L432:
	add	r1, r1, #1
	mul	r2, r1, r5
	add	r2, r2, #1
	add	r3, ip, #8
	add	r2, r6, r2, lsl #3
.L433:
	vldmia.64	r2!, {d7}
	vmul.f64	d7, d7, d0
	vstmia.64	r3!, {d7}
	cmp	r0, r3
	bne	.L433
	cmp	r4, r1
	add	ip, ip, lr
	add	r0, r0, lr
	bne	.L432
.L427:
	pop	{r4, r5, r6, lr}
	bx	lr
.L428:
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
	beq	.L444
	cmp	r1, #2
	beq	.L445
	cmp	r1, #0
	beq	.L472
.L443:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L444:
	ldr	r1, [lr, #4]
	cmp	r3, r1
	bhi	.L451
	ldr	ip, [r0, #8]
	add	r1, r1, #1
	cmp	r5, #0
	lsl	r4, r1, #3
	add	ip, ip, r1, lsl #3
	beq	.L443
	cmp	r3, #0
	beq	.L443
	mov	lr, #0
	mov	r0, #0
	add	r3, r3, #1
	ldr	r1, .L473
	add	r2, ip, r3, lsl #3
.L453:
	add	r3, ip, #8
.L454:
	stm	r3!, {r0-r1}
	cmp	r2, r3
	bne	.L454
	add	lr, lr, #1
	cmp	r5, lr
	add	ip, ip, r4
	add	r2, r2, r4
	bne	.L453
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L472:
	ldr	r0, [lr, #4]
	cmp	r3, r0
	bhi	.L451
	add	r6, r0, #1
	cmp	r5, #0
	ldr	r0, [ip, #8]
	lsl	r6, r6, #3
	beq	.L443
	cmp	r3, #0
	beq	.L443
	mov	r4, r1
	lsl	r7, r3, #3
	add	r3, r6, #8
	add	r3, r0, r3
.L450:
	mov	r0, r3
	mov	r2, r7
	mov	r1, #0
	bl	memset(PLT)
	add	r4, r4, #1
	cmp	r5, r4
	add	r3, r0, r6
	bne	.L450
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L445:
	mov	r1, r2
	pop	{r4, r5, r6, r7, r8, lr}
	b	mat_idn(PLT)
.L451:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error(PLT)
.L474:
	.align	2
.L473:
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
	@ args = 0, pretend = 0, frame = 272
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L512+8
	ldr	r6, .L512+12
	ldr	r5, .L512+16
	ldr	r7, .L512+20
.LPIC134:
	add	r3, pc, r3
	mov	r4, r0
	sub	sp, sp, #276
.LPIC135:
	add	r6, pc, r6
	mov	r0, #63
	mov	r8, r1
	str	r2, [sp, #8]
	ldr	r3, [r3]
.LPIC132:
	add	r5, pc, r5
.LPIC136:
	add	r7, pc, r7
	b	.L476
.L479:
	ldr	r3, [r6, r2]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r7]
	ldrb	r0, [r5, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r7]
	beq	.L477
.L476:
	cmp	r3, #74
	ldr	r2, .L512+24
	bls	.L479
	ldrb	r3, [r5]	@ zero_extendqisi2
.L507:
	cmp	r3, #0
	bne	.L507
.L477:
	ldr	r3, .L512+28
	ldr	r3, [r6, r3]
	add	r0, sp, #16
	ldr	r2, [r3]
	mov	r1, #256
	str	r3, [sp, #12]
	str	r0, [sp, #4]
	bl	fgets(PLT)
	ldrb	r3, [sp, #16]	@ zero_extendqisi2
	cmp	r3, #31
	vldrls.64	d7, .L512
	bls	.L492
	ldr	r9, .L512+32
	ldr	r7, .L512+36
	mov	fp, #0
	ldr	r10, [sp, #4]
.LPIC139:
	add	r9, pc, r9
.LPIC140:
	add	r7, pc, r7
	b	.L494
.L509:
	ldr	r2, [r8]
	cmp	r2, fp
	bls	.L481
	mov	r3, #0
	ldr	r1, .L512+40
	mov	r0, r10
	mov	r2, r4
	strb	r3, [ip]
.LPIC138:
	add	r1, pc, r1
	add	r10, ip, #1
	bl	__isoc99_sscanf(PLT)
.L493:
	mov	fp, r5
.L494:
	mov	r1, #44
	mov	r0, r10
	bl	strchr(PLT)
	subs	ip, r0, #0
	add	r4, r4, #8
	add	r5, fp, #1
	bne	.L509
.L481:
	mov	r0, r10
	mov	r2, r4
	mov	r1, r9
	bl	__isoc99_sscanf(PLT)
	ldrb	r3, [r10, r0]!	@ zero_extendqisi2
	cmp	r3, #38
	beq	.L510
.L483:
	cmp	r3, #31
	bls	.L485
	ldr	r3, [r8]
	cmp	r3, r5
	bcs	.L493
	b	.L485
.L510:
	ldr	r3, [r8]
	cmp	r3, r5
	bcs	.L511
.L485:
	vmov	s15, r5	@ int
	vcvt.f64.u32	d7, s15
.L492:
	ldr	r3, [sp, #8]
	vstr.64	d7, [r3]
	add	sp, sp, #276
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L511:
	ldr	r3, .L512+44
	ldr	r10, .L512+48
.LPIC142:
	add	r3, pc, r3
	mov	r0, #63
	ldr	r3, [r3]
.LPIC133:
	add	r10, pc, r10
	b	.L486
.L489:
	ldr	r3, [r6, r2]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r7]
	ldrb	r0, [r10, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r7]
	beq	.L487
.L486:
	cmp	r3, #74
	ldr	r2, .L512+24
	bls	.L489
	ldrb	r3, [r10]	@ zero_extendqisi2
.L508:
	cmp	r3, #0
	bne	.L508
.L487:
	ldr	r3, [sp, #12]
	ldr	r10, [sp, #4]
	ldr	r2, [r3]
	mov	r1, #256
	mov	r0, r10
	bl	fgets(PLT)
	ldrb	r3, [sp, #16]	@ zero_extendqisi2
	b	.L483
.L513:
	.align	3
.L512:
	.word	0
	.word	0
	.word	.LANCHOR0-(.LPIC134+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC135+8)
	.word	.LC14-(.LPIC132+8)
	.word	.LANCHOR0-(.LPIC136+8)
	.word	stdout(GOT)
	.word	stdin(GOT)
	.word	.LC15-(.LPIC139+8)
	.word	.LANCHOR0-(.LPIC140+8)
	.word	.LC15-(.LPIC138+8)
	.word	.LANCHOR0-(.LPIC142+8)
	.word	.LC14-(.LPIC133+8)
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
	bhi	.L515
	cmp	r0, #0
	subne	r3, r4, #1
	addne	r2, r5, #8
	addne	ip, r3, r0
	beq	.L517
.L518:
	ldrb	r1, [r3, #1]!	@ zero_extendqisi2
	vmov	s14, r1	@ int
	vcvt.f64.u32	d7, s14
	cmp	r3, ip
	vstmia.64	r2!, {d7}
	bne	.L518
.L517:
	vmov	s15, r0	@ int
	vcvt.f64.s32	d7, s15
	vstr.64	d7, [r5]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L515:
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
	bhi	.L536
	mov	r6, r0
	ldr	r0, [r0]
	cmp	r0, #0
	mov	r4, r1
	blne	free(PLT)
.L523:
	add	r0, r5, #1
	bl	malloc(PLT)
	cmp	r5, #0
	mov	r3, r0
	str	r0, [r6]
	beq	.L524
	vldr.64	d7, [r4, #8]
	vcvt.u32.f64	s15, d7
	vmov	r3, s15	@ int
	cmp	r5, #1
	strb	r3, [r0]
	addne	r1, r4, #16
	movne	r3, #1
	beq	.L527
.L526:
	vldmia.64	r1!, {d7}
	vcvt.u32.f64	s15, d7
	vmov	r2, s15	@ int
	ldr	ip, [r6]
	strb	r2, [ip, r3]
	add	r3, r3, #1
	cmp	r5, r3
	bne	.L526
.L527:
	ldr	r3, [r6]
.L524:
	mov	r2, #0
	strb	r2, [r3, r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L536:
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
	@ args = 0, pretend = 0, frame = 256
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L557
.LPIC144:
	add	r3, pc, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldr	r7, .L557+4
	cmp	r3, #0
.LPIC145:
	add	r7, pc, r7
	mov	r4, r0
	sub	sp, sp, #260
	bne	.L556
.L539:
	ldr	r3, .L557+8
	ldr	r5, [r7, r3]
	ldr	r0, [r5]
	bl	fgetc(PLT)
	and	r0, r0, #255
	mov	r7, sp
	cmp	r0, #10
	cmpne	r0, #44
	mov	r6, r7
	strb	r0, [sp]
	bne	.L546
	b	.L544
.L545:
	ldr	r0, [r5]
	bl	fgetc(PLT)
	and	r0, r0, #255
	cmp	r0, #10
	cmpne	r0, #44
	strb	r0, [r6, #1]!
	beq	.L544
.L546:
	ldr	r0, [r5]
	bl	feof(PLT)
	cmp	r0, #0
	beq	.L545
	ldrb	r0, [r6]	@ zero_extendqisi2
.L544:
	sub	r2, r0, #10
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	mov	r2, r4
	mov	r4, #0
	ldr	r1, .L557+12
.LPIC148:
	add	r1, pc, r1
	strb	r3, [r1]
	ldr	r1, .L557+16
	mov	r0, r7
	strb	r4, [r6, #1]
.LPIC149:
	add	r1, pc, r1
	bl	__isoc99_sscanf(PLT)
	ldr	r3, .L557+20
.LPIC150:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r4, [r3]
	str	r2, [r3, #4]
	add	sp, sp, #260
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L556:
	ldr	r3, .L557+24
	ldr	r5, .L557+28
	ldr	r6, .L557+32
.LPIC153:
	add	r3, pc, r3
	mov	r0, #63
	ldr	r3, [r3]
.LPIC143:
	add	r5, pc, r5
.LPIC146:
	add	r6, pc, r6
	b	.L540
.L542:
	ldr	r3, [r7, r2]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r6]
	ldrb	r0, [r5, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r6]
	beq	.L539
.L540:
	cmp	r3, #74
	ldr	r2, .L557+36
	bls	.L542
	ldrb	r3, [r5]	@ zero_extendqisi2
.L555:
	cmp	r3, #0
	bne	.L555
	b	.L539
.L558:
	.align	2
.L557:
	.word	.LANCHOR1-(.LPIC144+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC145+8)
	.word	stdin(GOT)
	.word	.LANCHOR1-(.LPIC148+8)
	.word	.LC15-(.LPIC149+8)
	.word	.LANCHOR0-(.LPIC150+8)
	.word	.LANCHOR0-(.LPIC153+8)
	.word	.LC14-(.LPIC143+8)
	.word	.LANCHOR0-(.LPIC146+8)
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
	ldr	r3, .L570
	ldr	r2, .L570+4
.LPIC154:
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
	strbne	r3, [r0]
	mov	r0, r4
	ldrb	r3, [sp]	@ zero_extendqisi2
	cmp	r3, #32
	bne	.L561
.L562:
	ldrb	r3, [r0, #1]!	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L562
.L561:
	mov	r1, #0
	ldr	r3, .L570+8
.LPIC155:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	bl	strdup(PLT)
	add	sp, sp, #256
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L571:
	.align	2
.L570:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC154+8)
	.word	stdin(GOT)
	.word	.LANCHOR0-(.LPIC155+8)
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
	bne	.L574
	ldr	r3, .L575+16
.LPIC158:
	add	r3, pc, r3
	ldr	r2, .L575+20
	ldr	r0, [r3, #4]
	mul	r0, r2, r0
	add	r0, r0, #12288
	add	r0, r0, #57
	bic	r0, r0, #-2147483648
	vmov	s13, r0	@ int
	vldr.64	d7, .L575
	vcvt.f64.s32	d0, s13
	vmul.f64	d0, d0, d7
.L573:
	ldr	r3, .L575+24
.LPIC159:
	add	r3, pc, r3
	str	r0, [r3, #4]
	bx	lr
.L574:
	vldr.64	d0, .L575+8
	b	.L573
.L576:
	.align	3
.L575:
	.word	0
	.word	1040187392
	.word	0
	.word	0
	.word	.LANCHOR1-(.LPIC158+8)
	.word	1103515245
	.word	.LANCHOR1-(.LPIC159+8)
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
	ble	.L583
	vldr.64	d0, .L584
	bx	lr
.L583:
	bmi	.L582
	vldr.64	d0, .L584+8
	bx	lr
.L582:
	vldr.64	d0, .L584+16
	bx	lr
.L585:
	.align	3
.L584:
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
	.word	256
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
