	.cpu arm710t
	.arch armv4t
	.fpu vfp
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
	.syntax unified
	.arm
	.type	print_string, %function
print_string:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	ldrb	r0, [r0]	@ zero_extendqisi2
	ldr	r6, .L13
	cmp	r0, #0
.LPIC0:
	add	r6, pc, r6
	beq	.L1
	ldr	r4, .L13+4
.LPIC3:
	add	r4, pc, r4
	b	.L2
.L5:
	ldr	r3, [r6, r2]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	ldrb	r0, [r5, #1]!	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L1
.L2:
	ldr	r3, [r4]
	cmp	r3, #74
	ldr	r2, .L13+8
	ble	.L5
	ldrb	r3, [r5]	@ zero_extendqisi2
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
	.type	print_number, %function
print_number:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #16
	push	{r4, r5, r6, lr}
	ldr	r2, .L28
.LPIC4:
	add	r2, pc, r2
	ldr	r0, .L28+4
	ldr	r1, .L28+8
.LPIC10:
	add	r0, pc, r0
	ldr	r6, .L28+12
	sub	sp, sp, #40
	str	r2, [sp]
	add	r5, sp, #20
	mov	r2, #1
	ldr	r1, [r0, r1]
	mov	r0, r5
	ldr	r1, [r1]
	str	r1, [sp, #36]
	mov	r1, #0
	vstr.64	d0, [sp, #8]
	mov	r1, r3
	bl	__snprintf_chk(PLT)
	ldrb	r0, [sp, #20]	@ zero_extendqisi2
	ldr	r4, .L28+16
	cmp	r0, #0
.LPIC5:
	add	r6, pc, r6
.LPIC8:
	add	r4, pc, r4
	bne	.L16
	b	.L15
.L19:
	ldr	r3, .L28+20
	ldr	r3, [r6, r3]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r4]
	ldrb	r0, [r5, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r4]
	beq	.L15
.L16:
	ldr	r3, [r4]
	cmp	r3, #74
	ble	.L19
	ldrb	r3, [r5]	@ zero_extendqisi2
.L26:
	cmp	r3, #0
	bne	.L26
.L15:
	ldr	r2, .L28+24
	ldr	r3, .L28+8
.LPIC9:
	add	r2, pc, r2
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [sp, #36]
	eors	r2, r3, r2
	mov	r3, #0
	bne	.L27
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L27:
	bl	__stack_chk_fail(PLT)
.L29:
	.align	2
.L28:
	.word	.LC0-(.LPIC4+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC10+8)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC5+8)
	.word	.LANCHOR0-(.LPIC8+8)
	.word	stdout(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC9+8)
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
	.type	print_integer, %function
print_integer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	mov	r3, #16
	push	{r4, r5, r6, lr}
	ldr	r1, .L43
.LPIC11:
	add	r1, pc, r1
	ldr	r0, .L43+4
.LPIC17:
	add	r0, pc, r0
	mov	r2, #1
	sub	sp, sp, #32
	str	r1, [sp]
	ldr	r1, .L43+8
	add	r5, sp, #12
	ldr	r6, .L43+12
	ldr	r1, [r0, r1]
	mov	r0, r5
	ldr	r1, [r1]
	str	r1, [sp, #28]
	mov	r1, #0
	mov	r1, r3
	str	ip, [sp, #4]
	bl	__snprintf_chk(PLT)
	ldrb	r0, [sp, #12]	@ zero_extendqisi2
	ldr	r4, .L43+16
	cmp	r0, #0
.LPIC12:
	add	r6, pc, r6
.LPIC15:
	add	r4, pc, r4
	bne	.L31
	b	.L30
.L34:
	ldr	r3, .L43+20
	ldr	r3, [r6, r3]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r4]
	ldrb	r0, [r5, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r4]
	beq	.L30
.L31:
	ldr	r3, [r4]
	cmp	r3, #74
	ble	.L34
	ldrb	r3, [r5]	@ zero_extendqisi2
.L41:
	cmp	r3, #0
	bne	.L41
.L30:
	ldr	r2, .L43+24
	ldr	r3, .L43+8
.LPIC16:
	add	r2, pc, r2
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [sp, #28]
	eors	r2, r3, r2
	mov	r3, #0
	bne	.L42
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	bl	__stack_chk_fail(PLT)
.L44:
	.align	2
.L43:
	.word	.LC1-(.LPIC11+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC17+8)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC12+8)
	.word	.LANCHOR0-(.LPIC15+8)
	.word	stdout(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC16+8)
	.size	print_integer, .-print_integer
	.align	2
	.global	print_newline
	.syntax unified
	.arm
	.type	print_newline, %function
print_newline:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L47
	ldr	r2, .L47+4
.LPIC18:
	add	r3, pc, r3
	mov	r0, #10
	ldr	r2, [r3, r2]
	ldr	r1, [r2]
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L47+8
.LPIC19:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	pop	{r4, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC18+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC19+8)
	.size	print_newline, .-print_newline
	.align	2
	.global	print_comma
	.syntax unified
	.arm
	.type	print_comma, %function
print_comma:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L56
	ldr	r2, .L56+4
.LPIC22:
	add	r3, pc, r3
	ldr	r7, .L56+8
.LPIC23:
	add	r7, pc, r7
	mov	r0, #32
	ldr	r4, [r3, r2]
	ldr	r1, [r4]
	bl	putc(PLT)
	ldr	r2, [r7]
	add	r2, r2, #1
	add	r3, r2, r2, lsl #4
	ldr	r6, .L56+12
	add	r3, r3, r3, lsl #8
	ldr	r5, .L56+16
	add	r3, r3, r3, lsl #16
	sub	r3, r6, r3
	cmp	r3, r5
	str	r2, [r7]
	bcc	.L50
.L51:
	mov	r0, #32
	ldr	r1, [r4]
	bl	putc(PLT)
	ldr	r2, [r7]
	add	r2, r2, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r6, r3
	cmp	r3, r5
	str	r2, [r7]
	bcs	.L51
.L50:
	cmp	r2, #60
	bgt	.L55
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L55:
	ldr	r1, [r4]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L56+20
.LPIC27:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC22+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC23+8)
	.word	143165576
	.word	286331153
	.word	.LANCHOR0-(.LPIC27+8)
	.size	print_comma, .-print_comma
	.align	2
	.global	print_semicolon
	.syntax unified
	.arm
	.type	print_semicolon, %function
print_semicolon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L62
	ldr	r2, .L62+4
.LPIC30:
	add	r3, pc, r3
	ldr	r4, .L62+8
	mov	r0, #32
	ldr	r5, [r3, r2]
.LPIC31:
	add	r4, pc, r4
	ldr	r1, [r5]
	bl	putc(PLT)
	ldr	r3, [r4]
	cmp	r3, #60
	bgt	.L61
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	ldr	r1, [r5]
	mov	r0, #10
	bl	putc(PLT)
	mov	r2, #0
	ldr	r3, [r4, #4]
	add	r3, r3, #1
	stm	r4, {r2, r3}
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC30+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC31+8)
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
	.type	runtime_error, %function
runtime_error:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r6, .L76
	sub	r3, r0, #1
	push	{r4, lr}
.LPIC44:
	add	r6, pc, r6
	mov	r4, r0
	mov	r5, r1
	cmp	r3, #6
	addls	pc, pc, r3, asl #2
	b	.L65
.L67:
	b	.L73
	b	.L72
	b	.L71
	b	.L70
	b	.L69
	b	.L68
	b	.L66
	.p2align 1
.L66:
	ldr	r0, .L76+4
.LPIC41:
	add	r0, pc, r0
	bl	print_string(PLT)
.L74:
	ldr	r0, .L76+8
.LPIC43:
	add	r0, pc, r0
	bl	print_string(PLT)
	mov	r0, r5
	bl	print_integer(PLT)
	ldr	r3, .L76+12
	ldr	r3, [r6, r3]
	mov	r0, #10
	ldr	r1, [r3]
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L76+16
.LPIC45:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	mov	r0, r4
	add	r2, r2, #1
	stm	r3, {r1, r2}
	bl	exit(PLT)
.L73:
	ldr	r0, .L76+20
.LPIC35:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L74
.L72:
	ldr	r0, .L76+24
.LPIC36:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L74
.L71:
	ldr	r0, .L76+28
.LPIC37:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L74
.L70:
	ldr	r0, .L76+32
.LPIC38:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L74
.L69:
	ldr	r0, .L76+36
.LPIC39:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L74
.L68:
	ldr	r0, .L76+40
.LPIC40:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L74
.L65:
	ldr	r0, .L76+44
.LPIC42:
	add	r0, pc, r0
	bl	print_string(PLT)
	b	.L74
.L77:
	.align	2
.L76:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC44+8)
	.word	.LC8-(.LPIC41+8)
	.word	.LC10-(.LPIC43+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC45+8)
	.word	.LC2-(.LPIC35+8)
	.word	.LC3-(.LPIC36+8)
	.word	.LC4-(.LPIC37+8)
	.word	.LC5-(.LPIC38+8)
	.word	.LC6-(.LPIC39+8)
	.word	.LC7-(.LPIC40+8)
	.word	.LC9-(.LPIC42+8)
	.size	runtime_error, .-runtime_error
	.align	2
	.global	mat_print
	.syntax unified
	.arm
	.type	mat_print, %function
mat_print:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L122
	ldr	r3, .L122+4
.LPIC85:
	add	r2, pc, r2
	mov	r7, r0
	add	fp, sp, #32
	sub	sp, sp, #68
	ldr	r3, [r2, r3]
	ldr	r3, [r3]
	str	r3, [fp, #-40]
	mov	r3, #0
	ldr	r2, .L122+8
	ldr	r3, .L122+12
.LPIC48:
	add	r2, pc, r2
	ldr	r5, [r2, r3]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #8]
	add	r3, r3, #1
	add	r3, r2, r3, lsl #3
	str	r1, [fp, #-76]
	mov	r0, #10
	ldr	r1, [r5]
	str	r3, [fp, #-80]
	bl	putc(PLT)
	mov	r0, #0
	ldr	r2, .L122+16
.LPIC49:
	add	r2, pc, r2
	ldr	r1, [r2, #4]
	ldr	r3, [r7, #4]
	add	r1, r1, #1
	stm	r2, {r0, r1}
	ldr	r2, [r3]
	cmp	r2, r0
	beq	.L80
	str	r0, [fp, #-84]
	ldr	r4, .L122+20
.LPIC53:
	add	r4, pc, r4
.L79:
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L94
	mov	r6, #0
	ldr	r3, .L122+24
.LPIC52:
	add	r3, pc, r3
	str	r3, [fp, #-68]
	ldr	r3, .L122+28
.LPIC83:
	add	r3, pc, r3
	sub	r10, fp, #56
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-80]
	add	r3, r3, #8
	str	r3, [fp, #-64]
.L93:
	ldr	r1, [fp, #-64]
	vldmia.64	r1!, {d7}
	mov	r3, #16
	str	r1, [fp, #-64]
	vstr.64	d7, [sp, #8]
	ldr	r1, [fp, #-68]
	mov	r2, #1
	str	r1, [sp]
	mov	r0, r10
	mov	r1, r3
	bl	__snprintf_chk(PLT)
	ldrb	r0, [fp, #-56]	@ zero_extendqisi2
	cmp	r0, #0
	mov	r9, sp
	beq	.L82
	ldr	r3, [fp, #-72]
	mov	r8, r10
	ldr	r3, [r3]
	b	.L83
.L85:
	ldr	r1, [r5]
	bl	putc(PLT)
	ldr	r3, [r4]
	ldrb	r0, [r8, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r4]
	beq	.L82
.L83:
	cmp	r3, #74
	ble	.L85
	ldrb	r3, [r8]	@ zero_extendqisi2
.L114:
	cmp	r3, #0
	bne	.L114
.L82:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	add	r6, r6, #1
	cmp	r3, r6
	mov	sp, r9
	bhi	.L103
.L104:
	cmp	r3, #1
	ldr	r1, [r5]
	bhi	.L117
.L94:
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	mov	r0, #32
	ldr	r1, [r5]
	beq	.L96
	ldr	r6, .L122+32
.LPIC69:
	add	r6, pc, r6
	bl	putc(PLT)
	ldr	r3, [r6]
	cmp	r3, #60
	bgt	.L118
.L95:
	ldm	r7, {r2, r3}
	ldr	r0, [fp, #-84]
	ldr	r1, [r3]
	add	r0, r0, #1
	ldr	r2, [r2, #4]
	cmp	r1, r0
	ldr	r1, [fp, #-80]
	add	r2, r2, #1
	add	r2, r1, r2, lsl #3
	str	r0, [fp, #-84]
	str	r2, [fp, #-80]
	bhi	.L79
.L80:
	ldr	r3, [r3, #4]
	cmp	r3, #1
	beq	.L119
.L78:
	ldr	r2, .L122+36
	ldr	r3, .L122+4
.LPIC84:
	add	r2, pc, r2
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	eors	r2, r3, r2
	mov	r3, #0
	bne	.L120
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L103:
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	ldr	r1, [r5]
	beq	.L87
	ldr	r9, .L122+40
	mov	r0, #32
.LPIC55:
	add	r9, pc, r9
	bl	putc(PLT)
	ldr	r3, [r9]
	cmp	r3, #60
	bgt	.L88
.L116:
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
.L89:
	cmp	r3, r6
	bhi	.L93
	b	.L104
.L87:
	ldr	r9, .L122+44
	mov	r0, #32
.LPIC59:
	add	r9, pc, r9
	b	.L115
.L121:
	mov	r0, #32
	ldr	r1, [r5]
.L115:
	bl	putc(PLT)
	ldr	r2, [r9]
	add	r2, r2, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #142606336
	add	r3, r3, #557056
	ldr	r1, .L122+48
	add	r3, r3, #2176
	add	r3, r3, #8
	cmp	r3, r1
	str	r2, [r9]
	bcs	.L121
	cmp	r2, #60
	ble	.L116
	mov	r0, #10
	ldr	r1, [r5]
	bl	putc(PLT)
	mov	r2, #0
	ldr	r3, .L122+52
.LPIC63:
	add	r3, pc, r3
	str	r2, [r3]
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	b	.L116
.L88:
	mov	r0, #10
	ldr	r1, [r5]
	bl	putc(PLT)
	mov	r3, #0
	str	r3, [r9]
	ldr	r3, [r9, #4]
	add	r3, r3, #1
	str	r3, [r9, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	b	.L89
.L117:
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L122+56
.LPIC66:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	b	.L95
.L96:
	ldr	r6, .L122+60
.LPIC73:
	add	r6, pc, r6
	bl	putc(PLT)
	ldr	r2, [r6]
	add	r2, r2, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #142606336
	add	r3, r3, #557056
	ldr	r1, .L122+48
	add	r3, r3, #2176
	add	r3, r3, #8
	cmp	r3, r1
	str	r2, [r6]
	bcc	.L98
.L99:
	ldr	r1, [r5]
	mov	r0, #32
	bl	putc(PLT)
	ldr	r2, [r6]
	add	r2, r2, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	rsb	r3, r3, #142606336
	add	r3, r3, #557056
	ldr	r1, .L122+48
	add	r3, r3, #2176
	add	r3, r3, #8
	cmp	r3, r1
	str	r2, [r6]
	bcs	.L99
.L98:
	cmp	r2, #60
	ble	.L95
	mov	r0, #10
	ldr	r1, [r5]
	bl	putc(PLT)
	mov	r2, #0
	ldr	r3, .L122+64
.LPIC77:
	add	r3, pc, r3
	str	r2, [r3]
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	str	r2, [r3, #4]
	b	.L95
.L118:
	mov	r0, #10
	ldr	r1, [r5]
	bl	putc(PLT)
	mov	r3, #0
	str	r3, [r6]
	ldr	r3, [r6, #4]
	add	r3, r3, #1
	str	r3, [r6, #4]
	b	.L95
.L119:
	ldr	r1, [r5]
	mov	r0, #10
	bl	putc(PLT)
	mov	r1, #0
	ldr	r3, .L122+68
.LPIC80:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	b	.L78
.L120:
	bl	__stack_chk_fail(PLT)
.L123:
	.align	2
.L122:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC85+8)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC48+8)
	.word	stdout(GOT)
	.word	.LANCHOR0-(.LPIC49+8)
	.word	.LANCHOR0-(.LPIC53+8)
	.word	.LC0-(.LPIC52+8)
	.word	.LANCHOR0-(.LPIC83+8)
	.word	.LANCHOR0-(.LPIC69+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC84+8)
	.word	.LANCHOR0-(.LPIC55+8)
	.word	.LANCHOR0-(.LPIC59+8)
	.word	286331153
	.word	.LANCHOR0-(.LPIC63+8)
	.word	.LANCHOR0-(.LPIC66+8)
	.word	.LANCHOR0-(.LPIC73+8)
	.word	.LANCHOR0-(.LPIC77+8)
	.word	.LANCHOR0-(.LPIC80+8)
	.size	mat_print, .-mat_print
	.align	2
	.global	mat_read
	.syntax unified
	.arm
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
	bhi	.L125
	ldr	r5, [r2, #4]
	ldr	r6, [r3, #4]
	cmp	r5, r6
	bhi	.L125
	ldr	r2, [r0, #8]
	add	r6, r6, #1
	cmp	r7, #0
	add	r2, r2, r6, lsl #3
	lsl	r6, r6, #3
	beq	.L124
	mov	r4, #0
.L128:
	cmp	r5, #0
	beq	.L132
	ldm	r1, {r3, lr}
	add	r0, r3, #1
	add	r0, r1, r0, lsl #3
	add	ip, r2, #8
	add	r9, r5, r3
.L130:
	cmp	lr, r3
	beq	.L138
	vldmia.64	r0!, {d7}
	add	r3, r3, #1
	cmp	r3, r9
	str	r3, [r1]
	vstmia.64	ip!, {d7}
	bne	.L130
.L132:
	add	r4, r4, #1
	cmp	r4, r7
	add	r2, r2, r6
	bne	.L128
.L124:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L138:
	mov	r1, r8
	mov	r0, #1
	bl	runtime_error(PLT)
.L125:
	mov	r1, r8
	mov	r0, #6
	bl	runtime_error(PLT)
	.size	mat_read, .-mat_read
	.align	2
	.global	mat_add
	.syntax unified
	.arm
	.type	mat_add, %function
mat_add:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	ip, [r1, #4]
	mov	lr, r1
	ldr	r1, [r2, #4]
	ldr	r9, [ip]
	ldr	r4, [r1]
	cmp	r9, r4
	bne	.L140
	ldr	ip, [ip, #4]
	ldr	r1, [r1, #4]
	cmp	ip, r1
	bne	.L140
	ldr	r5, [r0]
	ldr	r1, [r5]
	cmp	r9, r1
	bhi	.L142
	ldr	r1, [r5, #4]
	cmp	ip, r1
	bhi	.L142
	ldmib	r0, {r3, r4}
	stm	r3, {r9, ip}
	ldr	r3, [lr]
	ldr	lr, [lr, #8]
	cmp	r9, #0
	ldr	r6, [r3, #4]
	ldr	r3, [r2]
	ldr	r7, [r5, #4]
	ldr	r8, [r3, #4]
	ldr	r5, [r2, #8]
	add	r7, r7, #1
	add	r6, r6, #1
	add	r8, r8, #1
	add	r4, r4, r7, lsl #3
	add	lr, lr, r6, lsl #3
	add	r5, r5, r8, lsl #3
	lsl	r7, r7, #3
	lsl	r6, r6, #3
	lsl	r8, r8, #3
	beq	.L139
	cmp	ip, #0
	beq	.L139
	add	r0, ip, #1
	mov	ip, #0
	add	r0, lr, r0, lsl #3
.L145:
	add	r3, lr, #8
	add	r1, r5, #8
	add	r2, r4, #8
.L146:
	vldmia.64	r3!, {d7}
	vldmia.64	r1!, {d6}
	vadd.f64	d7, d7, d6
	cmp	r0, r3
	vstmia.64	r2!, {d7}
	bne	.L146
	add	ip, ip, #1
	cmp	ip, r9
	add	r4, r4, r7
	add	lr, lr, r6
	add	r5, r5, r8
	add	r0, r0, r6
	bne	.L145
.L139:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L140:
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error(PLT)
.L142:
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error(PLT)
	.size	mat_add, .-mat_add
	.align	2
	.global	mat_sub
	.syntax unified
	.arm
	.type	mat_sub, %function
mat_sub:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	ip, [r1, #4]
	mov	lr, r1
	ldr	r1, [r2, #4]
	ldr	r9, [ip]
	ldr	r4, [r1]
	cmp	r9, r4
	bne	.L156
	ldr	ip, [ip, #4]
	ldr	r1, [r1, #4]
	cmp	ip, r1
	bne	.L156
	ldr	r5, [r0]
	ldr	r1, [r5]
	cmp	r9, r1
	bhi	.L158
	ldr	r1, [r5, #4]
	cmp	ip, r1
	bhi	.L158
	ldmib	r0, {r3, r4}
	stm	r3, {r9, ip}
	ldr	r3, [lr]
	ldr	lr, [lr, #8]
	cmp	r9, #0
	ldr	r6, [r3, #4]
	ldr	r3, [r2]
	ldr	r7, [r5, #4]
	ldr	r8, [r3, #4]
	ldr	r5, [r2, #8]
	add	r7, r7, #1
	add	r6, r6, #1
	add	r8, r8, #1
	add	r4, r4, r7, lsl #3
	add	lr, lr, r6, lsl #3
	add	r5, r5, r8, lsl #3
	lsl	r7, r7, #3
	lsl	r6, r6, #3
	lsl	r8, r8, #3
	beq	.L155
	cmp	ip, #0
	beq	.L155
	add	r0, ip, #1
	mov	ip, #0
	add	r0, lr, r0, lsl #3
.L161:
	add	r3, lr, #8
	add	r1, r5, #8
	add	r2, r4, #8
.L162:
	vldmia.64	r3!, {d7}
	vldmia.64	r1!, {d6}
	vsub.f64	d7, d7, d6
	cmp	r0, r3
	vstmia.64	r2!, {d7}
	bne	.L162
	add	ip, ip, #1
	cmp	ip, r9
	add	r4, r4, r7
	add	lr, lr, r6
	add	r5, r5, r8
	add	r0, r0, r6
	bne	.L161
.L155:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L156:
	mov	r1, r3
	mov	r0, #7
	bl	runtime_error(PLT)
.L158:
	mov	r1, r3
	mov	r0, #6
	bl	runtime_error(PLT)
	.size	mat_sub, .-mat_sub
	.align	2
	.global	mat_mul
	.syntax unified
	.arm
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
	bne	.L194
	ldr	lr, [ip]
	mov	r4, lr
	ldr	r3, [r0]
	str	lr, [sp]
	ldr	lr, [r3]
	cmp	r4, lr
	bhi	.L173
	ldr	r2, [r2, #4]
	ldr	lr, [r3, #4]
	cmp	r2, lr
	bhi	.L173
	ldmib	r0, {r1, fp}
	str	r2, [r1, #4]
	cmp	r4, #0
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	add	fp, fp, r3, lsl #3
	lsl	r3, r3, #3
	str	r4, [r1]
	str	r3, [sp, #4]
	beq	.L171
	cmp	r2, #0
	beq	.L171
	mov	r10, #0
	vldr.64	d4, .L195
	add	r2, r2, #1
	ldr	r5, [ip, #4]
	add	r9, fp, r2, lsl #3
.L177:
	mov	r4, #0
	add	r10, r10, #1
	add	r0, fp, #8
.L179:
	cmp	r5, #0
	vstmia.64	r0!, {d4}
	beq	.L182
	vldr.64	d7, .L195
	ldr	r2, [r6]
	ldr	lr, [r2, #4]
	add	lr, lr, #1
	mul	lr, r10, lr
	ldr	r2, [r7]
	ldr	r1, [r2, #4]
	ldr	r3, [r6, #8]
	add	r1, r1, #1
	ldr	r2, [r7, #8]
	add	ip, r1, r4
	add	r8, lr, #1
	add	r2, r2, ip, lsl #3
	add	lr, lr, r5
	add	ip, r3, #8
	lsl	r1, r1, #3
	add	r3, r3, r8, lsl #3
	add	ip, ip, lr, lsl #3
.L181:
	vldmia.64	r3!, {d5}
	vldr.64	d6, [r2, #8]
	vmla.f64	d7, d5, d6
	cmp	ip, r3
	vstr.64	d7, [r0, #-8]
	add	r2, r2, r1
	bne	.L181
.L182:
	cmp	r9, r0
	add	r4, r4, #1
	bne	.L179
	ldr	r3, [sp]
	cmp	r3, r10
	ldr	r3, [sp, #4]
	add	fp, fp, r3
	add	r9, r9, r3
	bne	.L177
.L171:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L194:
	mov	r0, #7
	bl	runtime_error(PLT)
.L173:
	mov	r0, #6
	bl	runtime_error(PLT)
.L196:
	.align	3
.L195:
	.word	0
	.word	0
	.size	mat_mul, .-mat_mul
	.align	2
	.global	mat_zer_con
	.syntax unified
	.arm
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
	bhi	.L198
	ldr	r3, [r3, #4]
	ldr	ip, [ip, #4]
	cmp	r3, ip
	bhi	.L198
	ldr	r1, [r0, #8]
	add	ip, ip, #1
	cmp	lr, #0
	add	r1, r1, ip, lsl #3
	lsl	ip, ip, #3
	beq	.L197
	vldr.64	d7, .L211
	vldr.64	d6, .L211+8
	cmp	r2, #0
	vmoveq.f64	d7, d6
	cmp	r3, #0
	beq	.L197
	mov	r0, #0
	add	r3, r3, #1
	add	r2, r1, r3, lsl #3
.L201:
	add	r3, r1, #8
.L202:
	vstmia.64	r3!, {d7}
	cmp	r2, r3
	bne	.L202
	add	r0, r0, #1
	cmp	r0, lr
	add	r1, r1, ip
	add	r2, r2, ip
	bne	.L201
.L197:
	pop	{r4, lr}
	bx	lr
.L198:
	mov	r0, #6
	bl	runtime_error(PLT)
.L212:
	.align	3
.L211:
	.word	0
	.word	1072693248
	.word	0
	.word	0
	.size	mat_zer_con, .-mat_zer_con
	.align	2
	.global	mat_idn
	.syntax unified
	.arm
	.type	mat_idn, %function
mat_idn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #4]
	ldr	r3, [r0]
	push	{r4, r5, r6, lr}
	ldr	ip, [r3]
	ldr	r4, [r2]
	cmp	r4, ip
	bhi	.L214
	ldr	ip, [r2, #4]
	ldr	r3, [r3, #4]
	cmp	ip, r3
	bhi	.L214
	ldr	lr, [r0, #8]
	add	r3, r3, #1
	cmp	r4, #0
	lsl	r5, r3, #3
	add	lr, lr, r3, lsl #3
	beq	.L213
	cmp	ip, #0
	beq	.L213
	mov	r1, #0
	vldr.64	d6, .L230
	vldr.64	d7, .L230+8
.L221:
	mov	r3, #0
	add	r2, lr, #8
	add	r0, r1, #1
.L220:
	cmp	r1, r3
	beq	.L217
	add	r3, r3, #1
	cmp	ip, r3
	vstmia.64	r2!, {d7}
	bne	.L220
	cmp	r4, r0
	mov	r1, r0
	add	lr, lr, r5
	bne	.L221
.L213:
	pop	{r4, r5, r6, lr}
	bx	lr
.L217:
	cmp	ip, r0
	vstmia.64	r2!, {d6}
	mov	r3, r0
	bne	.L220
	cmp	r4, r0
	mov	r1, r0
	add	lr, lr, r5
	bne	.L221
	b	.L213
.L214:
	mov	r0, #6
	bl	runtime_error(PLT)
.L231:
	.align	3
.L230:
	.word	0
	.word	1072693248
	.word	0
	.word	0
	.size	mat_idn, .-mat_idn
	.align	2
	.global	mat_trn
	.syntax unified
	.arm
	.type	mat_trn, %function
mat_trn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	ip, [r0]
	ldr	lr, [r1, #4]
	mov	r3, r1
	ldr	r4, [lr]
	ldr	r1, [ip, #4]
	cmp	r4, r1
	bhi	.L233
	ldr	r7, [lr, #4]
	ldr	r1, [ip]
	cmp	r7, r1
	bhi	.L233
	ldmib	r0, {r1, r5}
	str	r7, [r1]
	cmp	r7, #0
	ldr	r2, [lr]
	str	r2, [r1, #4]
	ldr	r6, [ip, #4]
	add	r6, r6, #1
	add	r5, r5, r6, lsl #3
	lsl	r6, r6, #3
	beq	.L232
	cmp	r2, #0
	beq	.L232
	mov	r4, #0
	add	r2, r2, #1
	add	ip, r5, r2, lsl #3
	ldr	r2, [r3]
	ldr	r8, [r2, #4]
	ldr	r9, [r3, #8]
	add	r8, r8, #1
	lsl	lr, r8, #3
.L236:
	add	r3, r4, r8
	add	r3, r9, r3, lsl #3
	add	r2, r5, #8
.L237:
	add	r1, r3, #8
	ldmia	r1, {r0-r1}
	stm	r2!, {r0-r1}
	add	r3, r3, lr
	cmp	ip, r2
	bne	.L237
	add	r4, r4, #1
	cmp	r7, r4
	add	r5, r5, r6
	add	ip, ip, r6
	bne	.L236
.L232:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L233:
	mov	r1, r2
	mov	r0, #6
	bl	runtime_error(PLT)
	.size	mat_trn, .-mat_trn
	.align	2
	.global	mat_minor
	.syntax unified
	.arm
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
	ble	.L246
	mov	r2, #0
	mov	lr, r0
	mov	r3, r2
.L248:
	subs	r1, r10, r3
	movne	r1, #1
	mov	ip, #0
	add	r5, r9, r2, lsl #3
	b	.L250
.L251:
	mov	ip, r4
.L250:
	cmp	r8, ip
	moveq	r6, #0
	andne	r6, r1, #1
	cmp	r6, #0
	vldrne.64	d7, [r5]
	add	r4, ip, #1
	vstmiane.64	lr!, {d7}
	cmp	r7, r4
	add	r5, r5, #8
	bne	.L251
	cmp	r3, ip
	add	r2, r2, r7
	add	r3, r3, #1
	bne	.L248
.L246:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
	.size	mat_minor, .-mat_minor
	.align	2
	.global	mat_det
	.syntax unified
	.arm
	.type	mat_det, %function
mat_det:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r1, #1
	mov	r9, r0
	vpush.64	{d8, d9, d10, d11, d12}
	beq	.L257
	cmp	r1, #2
	mov	r5, r1
	beq	.L258
	cmp	r1, #0
	beq	.L268
	ble	.L276
	vldr.64	d7, .L277
	sub	r7, r1, #1
	mul	r3, r7, r7
	lsl	r3, r3, #3
	mov	r6, r0
	vldr.64	d8, .L277+8
	vldr.64	d10, .L277+16
	vmov	s24, r3	@ int
	vmov.f64	d9, d7
	mov	r8, #0
.L267:
	vldmia.64	r6!, {d11}
	vmov	r0, s24	@ int
	vmul.f64	d11, d11, d7
	mov	fp, #0
	bl	malloc(PLT)
	mov	r10, fp
	mov	r3, r0
.L262:
	subs	lr, r10, #0
	movne	lr, #1
	mov	r4, #0
	add	r1, r9, fp, lsl #3
	b	.L264
.L270:
	mov	r4, r2
.L264:
	cmp	r4, r8
	moveq	ip, #0
	andne	ip, lr, #1
	cmp	ip, #0
	vldrne.64	d7, [r1]
	add	r2, r4, #1
	vstmiane.64	r3!, {d7}
	cmp	r5, r2
	add	r1, r1, #8
	bne	.L270
	cmp	r4, r10
	add	fp, fp, r5
	add	r10, r10, #1
	bne	.L262
	mov	r1, r7
	bl	mat_det(PLT)
	cmp	r4, r8
	vmla.f64	d8, d11, d0
	add	r8, r8, #1
	beq	.L259
	tst	r8, #1
	vmoveq.f64	d7, d9
	vmovne.f64	d7, d10
	b	.L267
.L268:
	vldr.64	d8, .L277
.L259:
	mov	r0, r9
	bl	free(PLT)
	vmov.f64	d0, d8
	vldm	sp!, {d8-d12}
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L257:
	vldr.64	d8, [r0]
	b	.L259
.L258:
	vldr.64	d7, [r0, #8]
	vldr.64	d8, [r0, #16]
	vldr.64	d5, [r0]
	vldr.64	d6, [r0, #24]
	vmul.f64	d8, d7, d8
	vnmls.f64	d8, d5, d6
	b	.L259
.L276:
	vldr.64	d8, .L277+8
	b	.L259
.L278:
	.align	3
.L277:
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
	.type	mat_inv, %function
mat_inv:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	vpush.64	{d8, d9, d10, d11}
	mov	r1, r3
	ldr	r3, [r4, #4]
	sub	sp, sp, #20
	str	r2, [sp, #4]
	ldm	r3, {r2, r6}
	cmp	r2, r6
	str	r0, [sp, #8]
	bne	.L317
	ldr	r3, [r0]
	ldr	r2, [r3]
	cmp	r6, r2
	bhi	.L281
	ldr	r3, [r3, #4]
	cmp	r6, r3
	bhi	.L281
	mul	r0, r6, r6
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #4]
	lsl	r0, r0, #3
	str	r6, [r3, #4]
	str	r6, [r3]
	bl	malloc(PLT)
	ldr	r3, [r4]
	ldr	r5, [r3, #4]
	cmp	r6, #0
	add	r5, r5, #1
	mov	r8, r0
	ldr	r7, [r4, #8]
	lsl	r5, r5, #3
	ble	.L283
	mov	r3, r0
	mov	r1, #0
	add	r2, r5, #8
	add	r7, r7, r2
	lsl	r9, r6, #3
.L284:
	mov	r4, r1
	mov	r0, r3
	mov	r1, r7
	mov	r2, r9
	bl	memcpy(PLT)
	add	r1, r4, #1
	cmp	r6, r1
	add	r3, r0, r9
	add	r7, r7, r5
	bne	.L284
	mul	r3, r4, r4
	lsl	r3, r3, #3
	vmov	s22, r3	@ int
	mov	r2, #0
	mov	r3, #0
	vldr.64	d10, .L318
	vldr.64	d9, .L318+8
	mov	r10, r8
	mov	r5, #0
	ldr	r7, [sp, #4]
	stm	r7, {r2-r3}
.L291:
	tst	r5, #1
	vmoveq.f64	d7, d9
	vmovne.f64	d7, d10
	vldmia.64	r10!, {d8}
	vmov	r0, s22	@ int
	vmul.f64	d8, d8, d7
	mov	r9, #0
	bl	malloc(PLT)
	mov	lr, r9
	mov	r2, r0
.L287:
	subs	ip, lr, #0
	movne	ip, #1
	mov	r3, #0
	add	r1, r8, r9, lsl #3
.L289:
	cmp	r5, r3
	moveq	fp, #0
	andne	fp, ip, #1
	cmp	fp, #0
	vldrne.64	d7, [r1]
	vstmiane.64	r2!, {d7}
	cmp	r4, r3
	add	r1, r1, #8
	add	r3, r3, #1
	bne	.L289
	cmp	r4, lr
	add	r9, r9, r6
	add	lr, lr, #1
	bne	.L287
	mov	r1, r4
	bl	mat_det(PLT)
	vldr.64	d7, [r7]
	vmla.f64	d7, d8, d0
	cmp	r4, r5
	vstr.64	d7, [r7]
	add	r5, r5, #1
	bne	.L291
	vldr.64	d9, .L318
	vldr.64	d8, .L318+8
	mov	r5, #0
	ldr	r2, [sp, #8]
	ldr	r3, [r2]
	ldr	r3, [r3, #4]
	ldr	r2, [r2, #8]
	add	r3, r3, #1
	add	r3, r2, r3, lsl #3
	str	r3, [sp, #12]
.L300:
	mov	r7, #0
	ldr	r3, [sp, #12]
	add	r9, r3, #8
.L298:
	add	r3, r5, r7
	tst	r3, #1
	vmov	r0, s22	@ int
	vmoveq.f64	d10, d8
	vmovne.f64	d10, d9
	mov	fp, #0
	bl	malloc(PLT)
	mov	r10, fp
	mov	r2, r0
.L294:
	subs	ip, r7, r10
	movne	ip, #1
	mov	r3, #0
	add	r1, r8, fp, lsl #3
.L296:
	cmp	r5, r3
	moveq	lr, #0
	andne	lr, ip, #1
	cmp	lr, #0
	vldrne.64	d7, [r1]
	vstmiane.64	r2!, {d7}
	cmp	r4, r3
	add	r1, r1, #8
	add	r3, r3, #1
	bne	.L296
	cmp	r4, r10
	add	fp, fp, r6
	add	r10, r10, #1
	bne	.L294
	mov	r1, r4
	bl	mat_det(PLT)
	ldr	r3, [sp, #4]
	vmul.f64	d0, d0, d10
	vldr.64	d7, [r3]
	vdiv.f64	d6, d0, d7
	cmp	r4, r7
	vstmia.64	r9!, {d6}
	add	r7, r7, #1
	bne	.L298
	ldr	r3, [sp, #8]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	ldr	r2, [sp, #12]
	add	r3, r3, #1
	cmp	r4, r5
	add	r3, r2, r3, lsl #3
	str	r3, [sp, #12]
	add	r5, r5, #1
	bne	.L300
	add	sp, sp, #20
	@ sp needed
	vldm	sp!, {d8-d11}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L283:
	mov	r2, #0
	mov	r3, #0
	ldr	r1, [sp, #4]
	stm	r1, {r2-r3}
	add	sp, sp, #20
	@ sp needed
	vldm	sp!, {d8-d11}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L317:
	mov	r0, #7
	bl	runtime_error(PLT)
.L281:
	mov	r0, #6
	bl	runtime_error(PLT)
.L319:
	.align	3
.L318:
	.word	0
	.word	-1074790400
	.word	0
	.word	1072693248
	.size	mat_inv, .-mat_inv
	.align	2
	.global	mat_scalar
	.syntax unified
	.arm
	.type	mat_scalar, %function
mat_scalar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, [r1, #4]
	ldr	lr, [r0]
	mov	r5, r1
	ldr	r4, [r3]
	ldr	r1, [lr]
	cmp	r4, r1
	bhi	.L321
	ldr	r3, [r3, #4]
	ldr	r1, [lr, #4]
	cmp	r3, r1
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
	mov	r1, #0
	add	r3, r3, #1
	add	r0, ip, r3, lsl #3
	ldr	r3, [r5]
	ldr	r6, [r5, #8]
	ldr	r5, [r3, #4]
	add	r5, r5, #1
.L325:
	add	r1, r1, #1
	mul	r2, r5, r1
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
	bl	runtime_error(PLT)
	.size	mat_scalar, .-mat_scalar
	.section	.rodata.str1.4
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
	.type	read_number, %function
read_number:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r2, .L348
	ldr	r3, .L348+4
.LPIC96:
	add	r2, pc, r2
	ldr	r7, .L348+8
	ldr	r5, .L348+12
	ldr	r4, .L348+16
	ldr	r3, [r2, r3]
	sub	sp, sp, #28
	mov	r6, r0
	ldr	r3, [r3]
	str	r3, [sp, #20]
	mov	r3, #0
	mov	r0, #63
.LPIC87:
	add	r7, pc, r7
.LPIC86:
	add	r5, pc, r5
.LPIC90:
	add	r4, pc, r4
	b	.L337
.L340:
	ldr	r3, .L348+20
	ldr	r3, [r7, r3]
	ldr	r1, [r3]
	bl	putc(PLT)
	ldr	r3, [r4]
	ldrb	r0, [r5, #1]!	@ zero_extendqisi2
	add	r3, r3, #1
	cmp	r0, #0
	str	r3, [r4]
	beq	.L338
.L337:
	ldr	r3, [r4]
	cmp	r3, #74
	ble	.L340
	ldrb	r3, [r5]	@ zero_extendqisi2
.L346:
	cmp	r3, #0
	bne	.L346
.L338:
	ldr	r3, .L348+24
	ldr	r3, [r7, r3]
	add	r4, sp, #4
	ldr	r2, [r3]
	mov	r1, #16
	mov	r0, r4
	bl	fgets(PLT)
	ldr	r1, .L348+28
	mov	r2, r6
.LPIC91:
	add	r1, pc, r1
	mov	r0, r4
	bl	__isoc99_sscanf(PLT)
	mov	r1, #0
	ldr	r3, .L348+32
.LPIC92:
	add	r3, pc, r3
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	stm	r3, {r1, r2}
	ldr	r2, .L348+36
	ldr	r3, .L348+4
.LPIC95:
	add	r2, pc, r2
	ldr	r3, [r2, r3]
	ldr	r2, [r3]
	ldr	r3, [sp, #20]
	eors	r2, r3, r2
	mov	r3, #0
	bne	.L347
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L347:
	bl	__stack_chk_fail(PLT)
.L349:
	.align	2
.L348:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC96+8)
	.word	__stack_chk_guard(GOT)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC87+8)
	.word	.LC11-(.LPIC86+8)
	.word	.LANCHOR0-(.LPIC90+8)
	.word	stdout(GOT)
	.word	stdin(GOT)
	.word	.LC12-(.LPIC91+8)
	.word	.LANCHOR0-(.LPIC92+8)
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC95+8)
	.size	read_number, .-read_number
	.align	2
	.global	read_string
	.syntax unified
	.arm
	.type	read_string, %function
read_string:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L352
	ldr	r2, .L352+4
.LPIC97:
	add	r3, pc, r3
	ldr	r3, [r3, r2]
	ldr	r2, [r3]
	bl	fgets(PLT)
	mov	r2, #0
	strb	r2, [r0]
	ldr	r3, .L352+8
.LPIC98:
	add	r3, pc, r3
	str	r2, [r3]
	ldr	r2, [r3, #4]
	add	r2, r2, #1
	pop	{r4, lr}
	str	r2, [r3, #4]
	bx	lr
.L353:
	.align	2
.L352:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC97+8)
	.word	stdin(GOT)
	.word	.LANCHOR0-(.LPIC98+8)
	.size	read_string, .-read_string
	.align	2
	.global	random_lcg
	.syntax unified
	.arm
	.type	random_lcg, %function
random_lcg:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L355+8
.LPIC101:
	add	r2, pc, r2
	ldr	r3, [r2]
	ldr	r1, .L355+12
	mul	r3, r1, r3
	add	r3, r3, #12288
	add	r3, r3, #57
	bic	r3, r3, #-2147483648
	vmov	s13, r3	@ int
	vldr.64	d7, .L355
	vcvt.f64.s32	d0, s13
	str	r3, [r2]
	vmul.f64	d0, d0, d7
	bx	lr
.L356:
	.align	3
.L355:
	.word	0
	.word	1040187392
	.word	.LANCHOR1-(.LPIC101+8)
	.word	1103515245
	.size	random_lcg, .-random_lcg
	.align	2
	.global	cot
	.syntax unified
	.arm
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
	.type	sgn, %function
sgn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	vcmpe.f64	d0, #0
	vmrs	APSR_nzcv, FPSCR
	ble	.L363
	vldr.64	d0, .L364
	bx	lr
.L363:
	bmi	.L362
	vldr.64	d0, .L364+8
	bx	lr
.L362:
	vldr.64	d0, .L364+16
	bx	lr
.L365:
	.align	3
.L364:
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
	.ident	"GCC: (Ubuntu 11.2.0-5ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",%progbits
