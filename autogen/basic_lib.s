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
	cmp	r0, #0
	beq	.L1
	ldr	r5, .L13
	ldr	r6, .L13+4
	ldr	r3, [r5]
	b	.L4
.L6:
	ldr	r1, [r6]
	bl	putc
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1
.L4:
	cmp	r3, #74
	ble	.L6
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
	.word	.LANCHOR0
	.word	stdout
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
	mov	r1, #16
	sub	sp, sp, #24
	vstr.64	d0, [sp]
	ldr	r2, .L26
	add	r0, sp, #8
	bl	snprintf
	ldrb	r0, [sp, #8]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L15
	ldr	r5, .L26+4
	ldr	r6, .L26+8
	ldr	r3, [r5]
	add	r4, sp, #8
	b	.L18
.L20:
	ldr	r1, [r6]
	bl	putc
	ldr	r3, [r5]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r5]
	beq	.L15
.L18:
	cmp	r3, #74
	ble	.L20
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
	.word	.LC0
	.word	.LANCHOR0
	.word	stdout
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
	mov	r3, r0
	sub	sp, sp, #16
	mov	r1, #16
	mov	r0, sp
	ldr	r2, .L39
	bl	snprintf
	ldrb	r0, [sp]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L28
	ldr	r5, .L39+4
	mov	r4, sp
	ldr	r3, [r5]
	ldr	r6, .L39+8
	b	.L31
.L33:
	ldr	r1, [r6]
	bl	putc
	ldr	r3, [r5]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r5]
	beq	.L28
.L31:
	cmp	r3, #74
	ble	.L33
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
	.word	.LC1
	.word	.LANCHOR0
	.word	stdout
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
	ldr	r3, .L43
	push	{r4, lr}
	ldr	r1, [r3]
	mov	r0, #10
	bl	putc
	mov	r1, #0
	ldr	r3, .L43+4
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	pop	{r4, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	stdout
	.word	.LANCHOR0
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L52
	ldr	r7, .L52+4
	mov	r0, #32
	ldr	r1, [r4]
	bl	putc
	ldr	r2, [r7]
	add	r2, r2, #1
	add	r3, r2, r2, lsl #4
	ldr	r6, .L52+8
	add	r3, r3, r3, lsl #8
	ldr	r5, .L52+12
	add	r3, r3, r3, lsl #16
	sub	r3, r6, r3
	cmp	r3, r5
	str	r2, [r7]
	bcc	.L46
.L47:
	mov	r0, #32
	ldr	r1, [r4]
	bl	putc
	ldr	r2, [r7]
	add	r2, r2, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r6, r3
	cmp	r3, r5
	str	r2, [r7]
	bcs	.L47
.L46:
	cmp	r2, #60
	bgt	.L51
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L51:
	ldr	r1, [r4]
	mov	r0, #10
	bl	putc
	mov	r2, #0
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	stm	r7, {r2, r3}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	stdout
	.word	.LANCHOR0
	.word	143165576
	.word	286331153
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
	ldr	r5, .L58
	ldr	r4, .L58+4
	mov	r0, #32
	ldr	r1, [r5]
	bl	putc
	ldr	r3, [r4]
	add	r3, r3, #1
	cmp	r3, #60
	str	r3, [r4]
	bgt	.L57
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	ldr	r1, [r5]
	mov	r0, #10
	bl	putc
	mov	r2, #0
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	stm	r4, {r2, r3}
	pop	{r4, r5, r6, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	stdout
	.word	.LANCHOR0
	.size	print_semicolon, .-print_semicolon
	.section	.rodata.str1.4
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
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r3, r0, #1
	push	{r4, lr}
	mov	r5, r1
	mov	r4, r0
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L61
.L63:
	.word	.L69
	.word	.L68
	.word	.L67
	.word	.L66
	.word	.L65
	.word	.L64
	.word	.L62
.L62:
	ldr	r0, .L76
	bl	print_string
.L70:
	cmn	r5, #1
	beq	.L71
	ldr	r0, .L76+4
	bl	print_string
	mov	r0, r5
	bl	print_integer
.L71:
	ldr	r3, .L76+8
	mov	r0, #10
	ldr	r1, [r3]
	bl	putc
	mov	r1, #0
	ldr	r3, .L76+12
	ldr	r2, [r3, #4]
	mov	r0, r4
	add	r2, r2, #1
	stm	r3, {r1, r2}
	bl	exit
.L69:
	ldr	r0, .L76+16
	bl	print_string
	b	.L70
.L68:
	ldr	r0, .L76+20
	bl	print_string
	b	.L70
.L67:
	ldr	r0, .L76+24
	bl	print_string
	b	.L70
.L66:
	ldr	r0, .L76+28
	bl	print_string
	b	.L70
.L65:
	ldr	r0, .L76+32
	bl	print_string
	b	.L70
.L64:
	ldr	r0, .L76+36
	bl	print_string
	b	.L70
.L61:
	ldr	r0, .L76+40
	bl	print_string
	b	.L70
.L77:
	.align	2
.L76:
	.word	.LC8
	.word	.LC10
	.word	stdout
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC9
	.size	runtime_error, .-runtime_error
	.align	2
	.global	mat_print
	.syntax unified
	.arm
	.fpu vfp
	.type	mat_print, %function
mat_print:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, r1
	add	fp, sp, #32
	sub	sp, sp, #44
	mov	r8, r0
	str	r2, [fp, #-60]
	ldr	r2, [r8]
	ldr	r2, [r2, #4]
	ldr	ip, [r8, #8]
	ldr	r4, .L121
	add	r2, r2, #1
	add	r3, ip, r2, lsl #3
	ldr	r1, [r4]
	mov	r0, #10
	str	r3, [fp, #-64]
	bl	putc
	mov	r0, #0
	ldr	r3, .L121+4
	ldr	r1, [r3, #4]
	ldr	r2, [r8, #4]
	add	r1, r1, #1
	str	r1, [r3, #4]
	ldr	r1, [r2]
	cmp	r1, r0
	str	r0, [r3]
	beq	.L80
	str	r0, [fp, #-68]
	ldr	r7, .L121+8
	ldr	r6, .L121+12
.L79:
	ldr	r3, [r2, #4]
	cmp	r3, #0
	beq	.L94
	mov	r5, #0
	ldr	r3, [fp, #-64]
	add	r3, r3, #8
	str	r3, [fp, #-56]
.L93:
	ldr	r1, [fp, #-56]
	ldmia	r1!, {r2-r3}
	sub	r0, fp, #52
	str	r1, [fp, #-56]
	mov	r1, #16
	stm	sp, {r2-r3}
	ldr	r2, .L121+16
	bl	snprintf
	ldrb	r0, [fp, #-52]	@ zero_extendqisi2
	cmp	r0, #0
	mov	r10, sp
	add	r5, r5, #1
	beq	.L82
	ldr	r3, .L121+4
	sub	r9, fp, #52
	ldr	r3, [r3]
	b	.L83
.L85:
	ldr	r1, [r4]
	bl	putc
	ldr	r2, .L121+4
	ldrb	r0, [r9, #1]!	@ zero_extendqisi2
	ldr	r3, [r2]
	cmp	r0, #0
	add	r3, r3, #1
	str	r3, [r2]
	beq	.L82
.L83:
	cmp	r3, #74
	ble	.L85
	ldrb	r3, [r9]	@ zero_extendqisi2
.L115:
	cmp	r3, #0
	bne	.L115
.L82:
	ldr	r3, [r8, #4]
	ldr	r3, [r3, #4]
	cmp	r5, r3
	mov	sp, r10
	bcs	.L89
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	mov	r0, #32
	ldr	r1, [r4]
	beq	.L87
	bl	putc
	ldr	r2, .L121+4
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #60
	str	r3, [r2]
	bgt	.L92
.L116:
	ldr	r3, [r8, #4]
	ldr	r3, [r3, #4]
.L89:
	cmp	r5, r3
	bne	.L93
	cmp	r5, #1
	bne	.L118
.L94:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	mov	r0, #32
	ldr	r1, [r4]
	beq	.L96
	bl	putc
	ldr	r2, .L121+4
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #60
	str	r3, [r2]
	bgt	.L117
.L95:
	ldr	r2, [r8, #4]
	ldr	r0, [fp, #-68]
	ldr	r3, [r8]
	ldr	r1, [r2]
	add	r0, r0, #1
	ldr	r3, [r3, #4]
	cmp	r1, r0
	ldr	r1, [fp, #-64]
	add	r3, r3, #1
	add	r3, r1, r3, lsl #3
	str	r0, [fp, #-68]
	str	r3, [fp, #-64]
	bne	.L79
.L80:
	ldr	r2, [r2, #4]
	cmp	r2, #1
	beq	.L119
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L120:
	mov	r0, #32
	ldr	r1, [r4]
.L87:
	bl	putc
	ldr	r3, .L121+4
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r7, r3
	cmp	r3, r6
	bcs	.L120
	cmp	r2, #60
	ble	.L116
.L92:
	mov	r0, #10
	ldr	r1, [r4]
	bl	putc
	mov	r3, #0
	ldr	r2, .L121+4
	str	r3, [r2]
	ldr	r3, [r2, #4]
	add	r3, r3, #1
	str	r3, [r2, #4]
	b	.L116
.L118:
	ldr	r1, [r4]
	mov	r0, #10
	bl	putc
	mov	r2, #0
	ldr	r1, .L121+4
	ldr	r3, [r1, #4]
	add	r3, r3, #1
	stm	r1, {r2, r3}
	b	.L95
.L96:
	bl	putc
	ldr	r3, .L121+4
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r7, r3
	cmp	r3, r6
	bcc	.L98
.L99:
	ldr	r1, [r4]
	mov	r0, #32
	bl	putc
	ldr	r1, .L121+4
	ldr	r2, [r1]
	add	r2, r2, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r7, r3
	cmp	r3, r6
	str	r2, [r1]
	bcs	.L99
.L98:
	cmp	r2, #60
	ble	.L95
.L117:
	mov	r0, #10
	ldr	r1, [r4]
	bl	putc
	mov	r3, #0
	ldr	r2, .L121+4
	str	r3, [r2]
	ldr	r3, [r2, #4]
	add	r3, r3, #1
	str	r3, [r2, #4]
	b	.L95
.L119:
	ldr	r1, [r4]
	mov	r0, #10
	bl	putc
	mov	r1, #0
	ldr	r3, .L121+4
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L122:
	.align	2
.L121:
	.word	stdout
	.word	.LANCHOR0
	.word	143165576
	.word	286331153
	.word	.LC0
	.size	mat_print, .-mat_print
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, [r0]
	mov	r8, r2
	ldr	r2, [r0, #4]
	ldr	ip, [r3]
	ldr	r7, [r2]
	cmp	r7, ip
	bhi	.L124
	ldr	r5, [r2, #4]
	ldr	r6, [r3, #4]
	cmp	r5, r6
	bhi	.L124
	ldr	r2, [r0, #8]
	add	r6, r6, #1
	cmp	r7, #0
	add	r2, r2, r6, lsl #3
	movne	r4, #0
	lsl	r6, r6, #3
	beq	.L123
.L126:
	cmp	r5, #0
	beq	.L131
	ldm	r1, {r3, lr}
	add	r0, r3, #1
	add	r0, r1, r0, lsl #3
	add	ip, r2, #8
	add	r9, r5, r3
.L129:
	cmp	lr, r3
	beq	.L135
	vldmia.64	r0!, {d7}
	add	r3, r3, #1
	cmp	r3, r9
	str	r3, [r1]
	vstmia.64	ip!, {d7}
	bne	.L129
.L131:
	add	r4, r4, #1
	cmp	r7, r4
	add	r2, r2, r6
	bne	.L126
.L123:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L135:
	mov	r1, r8
	mov	r0, #1
	bl	runtime_error
.L124:
	mov	r1, r8
	mov	r0, #6
	bl	runtime_error
	.size	mat_read, .-mat_read
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
	bne	.L137
	ldr	ip, [ip, #4]
	ldr	lr, [lr, #4]
	cmp	ip, lr
	bne	.L137
	ldr	lr, [r0]
	ldr	r4, [lr]
	cmp	r9, r4
	bhi	.L139
	ldr	r4, [lr, #4]
	cmp	ip, r4
	bhi	.L139
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
	beq	.L136
	cmp	ip, #0
	beq	.L136
	add	r0, ip, #1
	mov	ip, #0
	add	r0, lr, r0, lsl #3
.L142:
	add	r3, lr, #8
	add	r1, r5, #8
	add	r2, r4, #8
.L143:
	vldmia.64	r3!, {d7}
	vldmia.64	r1!, {d6}
	vadd.f64	d7, d7, d6
	cmp	r3, r0
	vstmia.64	r2!, {d7}
	bne	.L143
	add	ip, ip, #1
	cmp	r9, ip
	add	r4, r4, r7
	add	lr, lr, r6
	add	r5, r5, r8
	add	r0, r0, r6
	bne	.L142
.L136:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L137:
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error
.L139:
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error
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
	bne	.L153
	ldr	ip, [ip, #4]
	ldr	lr, [lr, #4]
	cmp	ip, lr
	bne	.L153
	ldr	lr, [r0]
	ldr	r4, [lr]
	cmp	r9, r4
	bhi	.L155
	ldr	r4, [lr, #4]
	cmp	ip, r4
	bhi	.L155
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
	beq	.L152
	cmp	ip, #0
	beq	.L152
	add	r0, ip, #1
	mov	ip, #0
	add	r0, lr, r0, lsl #3
.L158:
	add	r3, lr, #8
	add	r1, r5, #8
	add	r2, r4, #8
.L159:
	vldmia.64	r3!, {d7}
	vldmia.64	r1!, {d6}
	vsub.f64	d7, d7, d6
	cmp	r3, r0
	vstmia.64	r2!, {d7}
	bne	.L159
	add	ip, ip, #1
	cmp	r9, ip
	add	r4, r4, r7
	add	lr, lr, r6
	add	r5, r5, r8
	add	r0, r0, r6
	bne	.L158
.L152:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L153:
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error
.L155:
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error
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
	bne	.L191
	ldr	lr, [ip]
	mov	r4, lr
	ldr	r3, [r0]
	str	lr, [sp]
	ldr	lr, [r3]
	cmp	r4, lr
	bhi	.L170
	ldr	r2, [r2, #4]
	ldr	lr, [r3, #4]
	cmp	r2, lr
	bhi	.L170
	ldmib	r0, {r1, fp}
	str	r2, [r1, #4]
	cmp	r4, #0
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	add	fp, fp, r3, lsl #3
	lsl	r3, r3, #3
	str	r4, [r1]
	str	r3, [sp, #4]
	beq	.L168
	cmp	r2, #0
	beq	.L168
	mov	r10, #0
	vldr.64	d4, .L192
	add	r2, r2, #1
	ldr	r5, [ip, #4]
	add	r9, fp, r2, lsl #3
.L174:
	mov	r4, #0
	add	r10, r10, #1
	add	r0, fp, #8
.L176:
	cmp	r5, #0
	mov	r2, r4
	vstmia.64	r0!, {d4}
	add	r4, r4, #1
	beq	.L179
	vldr.64	d7, .L192
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
.L178:
	vldmia.64	r3!, {d5}
	vldr.64	d6, [r2, #8]
	vmla.f64	d7, d5, d6
	cmp	ip, r3
	vstr.64	d7, [r0, #-8]
	add	r2, r2, r1
	bne	.L178
.L179:
	cmp	r0, r9
	bne	.L176
	ldr	r3, [sp]
	cmp	r3, r10
	ldr	r3, [sp, #4]
	add	fp, fp, r3
	add	r9, r9, r3
	bne	.L174
.L168:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L191:
	mov	r0, #7
	bl	runtime_error
.L170:
	mov	r0, #6
	bl	runtime_error
.L193:
	.align	3
.L192:
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
	bhi	.L195
	ldr	r3, [r3, #4]
	ldr	ip, [ip, #4]
	cmp	r3, ip
	bhi	.L195
	ldr	r0, [r0, #8]
	add	ip, ip, #1
	cmp	lr, #0
	add	r0, r0, ip, lsl #3
	lsl	ip, ip, #3
	beq	.L194
	vldr.64	d7, .L208
	vldr.64	d6, .L208+8
	cmp	r1, #0
	vmoveq.f64	d7, d6
	cmp	r3, #0
	beq	.L194
	mov	r1, #0
	add	r3, r3, #1
	add	r2, r0, r3, lsl #3
.L198:
	add	r3, r0, #8
.L199:
	vstmia.64	r3!, {d7}
	cmp	r2, r3
	bne	.L199
	add	r1, r1, #1
	cmp	lr, r1
	add	r0, r0, ip
	add	r2, r2, ip
	bne	.L198
.L194:
	pop	{r4, lr}
	bx	lr
.L195:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error
.L209:
	.align	3
.L208:
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
	bne	.L225
	ldr	r3, [r0]
	mov	r2, r1
	ldr	r1, [r3]
	cmp	r4, r1
	bhi	.L212
	ldr	r3, [r3, #4]
	cmp	r4, r3
	bhi	.L212
	ldr	lr, [r0, #8]
	add	r3, r3, #1
	cmp	r4, #0
	lsl	r5, r3, #3
	add	lr, lr, r3, lsl #3
	beq	.L210
	mov	r1, #0
	vldr.64	d6, .L226
	vldr.64	d7, .L226+8
.L219:
	mov	r3, #0
	add	r2, lr, #8
	add	r0, r1, #1
.L218:
	cmp	r1, r3
	beq	.L215
	add	r3, r3, #1
	cmp	ip, r3
	vstmia.64	r2!, {d7}
	bne	.L218
	cmp	r4, r0
	mov	r1, r0
	add	lr, lr, r5
	bne	.L219
.L210:
	pop	{r4, r5, r6, lr}
	bx	lr
.L215:
	cmp	ip, r0
	mov	r3, r0
	vstmia.64	r2!, {d6}
	bne	.L218
	cmp	r4, r0
	mov	r1, r0
	add	lr, lr, r5
	bne	.L219
	b	.L210
.L225:
	mov	r0, #7
	bl	runtime_error
.L212:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error
.L227:
	.align	3
.L226:
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
	bhi	.L229
	ldr	r7, [r3, #4]
	ldr	lr, [ip]
	cmp	r7, lr
	bhi	.L229
	ldmib	r0, {r2, r5}
	str	r7, [r2]
	cmp	r7, #0
	ldr	r3, [r3]
	str	r3, [r2, #4]
	ldr	r6, [ip, #4]
	add	r6, r6, #1
	add	r5, r5, r6, lsl #3
	lsl	r6, r6, #3
	beq	.L228
	cmp	r3, #0
	beq	.L228
	mov	r4, #0
	add	r3, r3, #1
	add	ip, r5, r3, lsl #3
	ldr	r3, [r1]
	ldr	r8, [r3, #4]
	ldr	r9, [r1, #8]
	add	r8, r8, #1
	lsl	lr, r8, #3
.L232:
	add	r3, r8, r4
	add	r3, r9, r3, lsl #3
	add	r2, r5, #8
.L233:
	add	r1, r3, #8
	ldmia	r1, {r0-r1}
	stm	r2!, {r0-r1}
	add	r3, r3, lr
	cmp	ip, r2
	bne	.L233
	add	r4, r4, #1
	cmp	r7, r4
	add	r5, r5, r6
	add	ip, ip, r6
	bne	.L232
.L228:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L229:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error
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
	bl	malloc
	cmp	r7, #0
	movne	r2, #0
	movne	lr, r0
	movne	r3, r2
	beq	.L242
.L243:
	subs	r1, r10, r3
	movne	r1, #1
	mov	ip, #0
	add	r5, r9, r2, lsl #3
	b	.L246
.L248:
	mov	ip, r4
.L246:
	cmp	r8, ip
	moveq	r6, #0
	andne	r6, r1, #1
	cmp	r6, #0
	vldrne.64	d7, [r5]
	add	r4, ip, #1
	vstmiane.64	lr!, {d7}
	cmp	r7, r4
	add	r5, r5, #8
	bne	.L248
	cmp	r3, ip
	add	r2, r2, r7
	add	r3, r3, #1
	bne	.L243
.L242:
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
	beq	.L254
	cmp	r1, #2
	mov	r5, r1
	beq	.L255
	cmp	r1, #0
	beq	.L264
	vldr.64	d7, .L271
	sub	r6, r1, #1
	mul	r3, r6, r6
	lsl	r3, r3, #3
	mov	r7, r0
	vldr.64	d8, .L271+8
	vldr.64	d10, .L271+16
	vmov	s24, r3	@ int
	vmov.f64	d9, d7
	mov	r8, #0
.L257:
	vldmia.64	r7!, {d11}
	vmov	r0, s24	@ int
	vmul.f64	d11, d11, d7
	mov	fp, #0
	bl	malloc
	mov	r10, fp
	mov	r2, r0
.L259:
	subs	lr, r10, #0
	movne	lr, #1
	mov	r3, #0
	add	ip, r9, fp, lsl #3
	b	.L261
.L266:
	mov	r3, r1
.L261:
	cmp	r8, r3
	moveq	r4, #0
	andne	r4, lr, #1
	cmp	r4, #0
	vldrne.64	d7, [ip]
	add	r1, r3, #1
	vstmiane.64	r2!, {d7}
	cmp	r5, r1
	add	ip, ip, #8
	bne	.L266
	cmp	r10, r3
	add	fp, fp, r5
	add	r10, r10, #1
	bne	.L259
	mov	r1, r6
	bl	mat_det
	cmp	r6, r8
	vmla.f64	d8, d11, d0
	beq	.L256
	add	r8, r8, #1
	tst	r8, #1
	vmoveq.f64	d7, d9
	vmovne.f64	d7, d10
	b	.L257
.L264:
	vldr.64	d8, .L271
.L256:
	mov	r0, r9
	bl	free
	vmov.f64	d0, d8
	vldm	sp!, {d8-d12}
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L255:
	vldr.64	d7, [r0, #8]
	vldr.64	d8, [r0, #16]
	vldr.64	d5, [r0]
	vldr.64	d6, [r0, #24]
	vmul.f64	d8, d7, d8
	vnmls.f64	d8, d5, d6
	b	.L256
.L254:
	vldr.64	d8, [r0]
	b	.L256
.L272:
	.align	3
.L271:
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
	bne	.L317
	ldr	r3, [r0]
	ldr	r2, [r3]
	cmp	r4, r2
	bhi	.L275
	ldr	r3, [r3, #4]
	cmp	r4, r3
	bhi	.L275
	mul	r0, r4, r4
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #4]
	lsl	r0, r0, #3
	str	r4, [r3, #4]
	str	r4, [r3]
	bl	malloc
	ldr	r3, [r5]
	ldr	r7, [r3, #4]
	cmp	r4, #0
	add	r7, r7, #1
	mov	r8, r0
	ldr	r5, [r5, #8]
	lsl	r7, r7, #3
	beq	.L295
	mov	r3, r0
	mov	r6, #0
	add	r2, r7, #8
	add	r5, r5, r2
	lsl	r9, r4, #3
.L278:
	mov	r1, r5
	mov	r0, r3
	mov	r2, r9
	bl	memcpy
	add	r6, r6, #1
	cmp	r4, r6
	add	r3, r0, r9
	add	r5, r5, r7
	bne	.L278
	sub	r7, r4, #1
	mul	r3, r7, r7
	lsl	r6, r3, #3
	vldr.64	d8, .L318
	vldr.64	d11, .L318+8
	vldr.64	d10, .L318+16
	mov	r10, r8
	mov	r5, #0
	vmov	s26, r6	@ int
.L284:
	tst	r5, #1
	vmoveq.f64	d7, d10
	vmovne.f64	d7, d11
	vldmia.64	r10!, {d9}
	mov	r0, r6
	vmul.f64	d9, d9, d7
	mov	r9, #0
	bl	malloc
	mov	lr, r9
	mov	r2, r0
.L280:
	subs	fp, lr, #0
	movne	fp, #1
	mov	r3, #0
	add	r1, r8, r9, lsl #3
.L282:
	cmp	r5, r3
	moveq	ip, #0
	andne	ip, fp, #1
	cmp	ip, #0
	vldrne.64	d7, [r1]
	add	r3, r3, #1
	vstmiane.64	r2!, {d7}
	cmp	r4, r3
	add	r1, r1, #8
	bne	.L282
	add	lr, lr, #1
	cmp	r4, lr
	add	r9, r9, r4
	bne	.L280
	mov	r1, r7
	bl	mat_det
	add	r5, r5, #1
	cmp	r4, r5
	vmla.f64	d8, d9, d0
	bne	.L284
	vldr.64	d12, .L318
	vldr.64	d11, .L318+8
	vldr.64	d10, .L318+16
	mov	r5, #0
	ldr	r2, [sp, #8]
	ldr	r3, [r2]
	ldr	r3, [r3, #4]
	ldr	r2, [r2, #8]
	add	r3, r3, #1
	add	r3, r2, r3, lsl #3
	str	r3, [sp, #4]
.L294:
	mov	r6, #0
	ldr	r3, [sp, #4]
	add	r9, r3, #8
.L292:
	vcmp.f64	d8, #0
	vmrs	APSR_nzcv, FPSCR
	vmoveq.f64	d7, d12
	beq	.L286
	add	r3, r5, r6
	tst	r3, #1
	vmov	r0, s26	@ int
	vmoveq.f64	d9, d10
	vmovne.f64	d9, d11
	mov	fp, #0
	bl	malloc
	mov	r10, fp
	mov	r2, r0
.L288:
	subs	lr, r6, r10
	movne	lr, #1
	mov	r3, #0
	add	r1, r8, fp, lsl #3
.L290:
	cmp	r5, r3
	moveq	ip, #0
	andne	ip, lr, #1
	cmp	ip, #0
	vldrne.64	d7, [r1]
	add	r3, r3, #1
	vstmiane.64	r2!, {d7}
	cmp	r4, r3
	add	r1, r1, #8
	bne	.L290
	add	r10, r10, #1
	cmp	r4, r10
	add	fp, fp, r4
	bne	.L288
	mov	r1, r7
	bl	mat_det
	vmul.f64	d0, d0, d9
	vdiv.f64	d7, d0, d8
.L286:
	add	r6, r6, #1
	cmp	r4, r6
	vstmia.64	r9!, {d7}
	bne	.L292
	ldr	r3, [sp, #8]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	ldr	r2, [sp, #4]
	add	r5, r5, #1
	add	r3, r3, #1
	add	r3, r2, r3, lsl #3
	cmp	r4, r5
	str	r3, [sp, #4]
	bne	.L294
.L277:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	vstrne.64	d8, [r3]
	mov	r0, r8
	bl	free
	add	sp, sp, #20
	@ sp needed
	vldm	sp!, {d8-d13}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L295:
	vldr.64	d8, .L318
	b	.L277
.L317:
	mov	r0, #7
	bl	runtime_error
.L275:
	mov	r0, #6
	bl	runtime_error
.L319:
	.align	3
.L318:
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
	bhi	.L321
	ldr	r3, [r3, #4]
	ldr	ip, [lr, #4]
	cmp	r3, ip
	bhi	.L321
	ldmib	r0, {r2, ip}
	str	r3, [r2, #4]
	cmp	r4, #0
	ldr	lr, [lr, #4]
	add	lr, lr, #1
	add	ip, ip, lr, lsl #3
	str	r4, [r2]
	lsl	lr, lr, #3
	beq	.L320
	cmp	r3, #0
	beq	.L320
	add	r3, r3, #1
	ldr	r6, [r1, #8]
	add	r0, ip, r3, lsl #3
	ldr	r3, [r1]
	mov	r1, #0
	ldr	r5, [r3, #4]
	add	r5, r5, #1
.L325:
	add	r1, r1, #1
	mul	r2, r1, r5
	add	r2, r2, #1
	add	r3, ip, #8
	add	r2, r6, r2, lsl #3
.L326:
	vldmia.64	r2!, {d7}
	vmul.f64	d7, d7, d0
	vstmia.64	r3!, {d7}
	cmp	r0, r3
	bne	.L326
	cmp	r4, r1
	add	ip, ip, lr
	add	r0, r0, lr
	bne	.L325
.L320:
	pop	{r4, r5, r6, lr}
	bx	lr
.L321:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error
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
	beq	.L337
	cmp	r1, #2
	beq	.L338
	cmp	r1, #0
	beq	.L365
.L336:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L337:
	ldr	r1, [lr, #4]
	cmp	r3, r1
	bhi	.L344
	ldr	ip, [r0, #8]
	add	r1, r1, #1
	cmp	r5, #0
	lsl	r4, r1, #3
	add	ip, ip, r1, lsl #3
	beq	.L336
	cmp	r3, #0
	beq	.L336
	mov	lr, #0
	mov	r0, #0
	add	r3, r3, #1
	ldr	r1, .L366
	add	r2, ip, r3, lsl #3
.L346:
	add	r3, ip, #8
.L347:
	stm	r3!, {r0-r1}
	cmp	r2, r3
	bne	.L347
	add	lr, lr, #1
	cmp	r5, lr
	add	ip, ip, r4
	add	r2, r2, r4
	bne	.L346
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L365:
	ldr	r0, [lr, #4]
	cmp	r3, r0
	bhi	.L344
	add	r6, r0, #1
	cmp	r5, #0
	ldr	r0, [ip, #8]
	lsl	r6, r6, #3
	beq	.L336
	cmp	r3, #0
	beq	.L336
	mov	r4, r1
	lsl	r7, r3, #3
	add	r3, r6, #8
	add	r3, r0, r3
.L343:
	mov	r0, r3
	mov	r2, r7
	mov	r1, #0
	bl	memset
	add	r4, r4, #1
	cmp	r5, r4
	add	r3, r0, r6
	bne	.L343
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L338:
	mov	r1, r2
	pop	{r4, r5, r6, r7, r8, lr}
	b	mat_idn
.L344:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error
.L367:
	.align	2
.L366:
	.word	1072693248
	.size	mat_zer_con_idn_dim, .-mat_zer_con_idn_dim
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"? \000"
	.align	2
.LC12:
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L405+8
	mov	r6, r0
	sub	sp, sp, #28
	mov	r0, #63
	mov	r8, r1
	str	r2, [sp, #4]
	ldr	r3, [r4]
	ldr	r7, .L405+12
	ldr	r5, .L405+16
	b	.L369
.L372:
	ldr	r1, [r5]
	bl	putc
	ldr	r3, [r4]
	ldrb	r0, [r7, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r4]
	beq	.L370
.L369:
	cmp	r3, #74
	ble	.L372
	ldrb	r3, [r7]	@ zero_extendqisi2
.L401:
	cmp	r3, #0
	bne	.L401
.L370:
	ldr	r10, .L405+20
	mov	r1, #16
	ldr	r2, [r10]
	add	r0, sp, #8
	bl	fgets
	ldrb	r3, [sp, #8]	@ zero_extendqisi2
	cmp	r3, #31
	bls	.L390
	mov	r5, #1
	ldr	r9, .L405+24
	ldr	r7, .L405+16
	add	r6, r6, #8
	add	fp, sp, #8
	b	.L387
.L403:
	ldr	r1, [r8]
	sub	r2, r5, #1
	cmp	r1, r2
	bls	.L374
	mov	lr, #0
	mov	r0, fp
	mov	r2, r6
	mov	r1, r9
	strb	lr, [ip]
	add	fp, ip, #1
	bl	__isoc99_sscanf
.L384:
	add	r6, r6, #8
	add	r5, r5, #1
.L387:
	mov	r1, #44
	mov	r0, fp
	bl	strchr
	subs	ip, r0, #0
	bne	.L403
.L374:
	mov	r2, r6
	mov	r1, r9
	mov	r0, fp
	bl	__isoc99_sscanf
	ldr	r2, [r8]
	cmp	r2, r5
	bcs	.L404
.L388:
	vmov	s15, r5	@ int
	vcvt.f64.u32	d7, s15
.L383:
	ldr	r3, [sp, #4]
	vstr.64	d7, [r3]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L404:
	mov	r0, #63
	ldr	r3, [r4]
	ldr	fp, .L405+12
	b	.L378
.L381:
	ldr	r1, [r7]
	bl	putc
	ldr	r3, [r4]
	ldrb	r0, [fp, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r4]
	beq	.L379
.L378:
	cmp	r3, #74
	ble	.L381
	ldrb	r3, [fp]	@ zero_extendqisi2
.L402:
	cmp	r3, #0
	bne	.L402
.L379:
	mov	r1, #16
	ldr	r2, [r10]
	add	r0, sp, #8
	bl	fgets
	ldrb	r3, [sp, #8]	@ zero_extendqisi2
	cmp	r3, #31
	bls	.L388
	ldr	r3, [r8]
	cmp	r3, r5
	bcc	.L388
	add	fp, sp, #8
	b	.L384
.L390:
	vldr.64	d7, .L405
	b	.L383
.L406:
	.align	3
.L405:
	.word	0
	.word	0
	.word	.LANCHOR0
	.word	.LC11
	.word	stdout
	.word	stdin
	.word	.LC12
	.size	mat_input, .-mat_input
	.align	2
	.global	read_number
	.syntax unified
	.arm
	.fpu vfp
	.type	read_number, %function
read_number:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r5, .L417
	mov	r7, r0
	ldr	r3, [r5]
	mov	r0, #63
	ldr	r4, .L417+4
	ldr	r6, .L417+8
	sub	sp, sp, #20
	b	.L408
.L411:
	ldr	r1, [r6]
	bl	putc
	ldr	r3, [r5]
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r5]
	beq	.L409
.L408:
	cmp	r3, #74
	ble	.L411
	ldrb	r3, [r4]	@ zero_extendqisi2
.L416:
	cmp	r3, #0
	bne	.L416
.L409:
	ldr	r3, .L417+12
	mov	r1, #16
	ldr	r2, [r3]
	mov	r0, sp
	bl	fgets
	mov	r2, r7
	mov	r0, sp
	ldr	r1, .L417+16
	bl	__isoc99_sscanf
	mov	r2, #0
	ldr	r3, [r5, #4]
	add	r3, r3, #1
	stm	r5, {r2, r3}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L418:
	.align	2
.L417:
	.word	.LANCHOR0
	.word	.LC11
	.word	stdout
	.word	stdin
	.word	.LC12
	.size	read_number, .-read_number
	.align	2
	.global	read_string
	.syntax unified
	.arm
	.fpu vfp
	.type	read_string, %function
read_string:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L421
	push	{r4, lr}
	ldr	r2, [r3]
	bl	fgets
	mov	r2, #0
	strb	r2, [r0]
	ldr	r3, .L421+4
	str	r2, [r3]
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	pop	{r4, lr}
	str	r2, [r3, #4]
	bx	lr
.L422:
	.align	2
.L421:
	.word	stdin
	.word	.LANCHOR0
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
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L424+8
	ldr	r1, .L424+12
	ldr	r3, [r2]
	mul	r3, r1, r3
	add	r3, r3, #12288
	add	r3, r3, #57
	bic	r3, r3, #-2147483648
	vmov	s13, r3	@ int
	vldr.64	d7, .L424
	vcvt.f64.s32	d0, s13
	str	r3, [r2]
	vmul.f64	d0, d0, d7
	bx	lr
.L425:
	.align	3
.L424:
	.word	0
	.word	1040187392
	.word	.LANCHOR1
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	mov	r1, sp
	add	r0, sp, #8
	bl	sincos
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
	ble	.L432
	vldr.64	d0, .L433
	bx	lr
.L432:
	bmi	.L431
	vldr.64	d0, .L433+8
	bx	lr
.L431:
	vldr.64	d0, .L433+16
	bx	lr
.L434:
	.align	3
.L433:
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
	bl	basic_run
	pop	{r4, lr}
	bx	lr
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
	.ident	"GCC: (GNU Toolchain for the A-profile Architecture 10.3-2021.07 (arm-10.29)) 10.3.1 20210621"
	.section	.note.GNU-stack,"",%progbits
