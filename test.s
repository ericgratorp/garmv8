	.arch armv8-a
	.file	"test.c"
	.text
	.comm	t1,4,4
	.global	t2
	.data
	.align	2
	.type	t2, %object
	.size	t2, 4
t2:
	.word	3
	.text
	.align	2
	.global	print
	.type	print, %function
print:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, 8]
	mov	x0, 150994944
	str	x0, [sp, 24]
	b	.L2
.L3:
	ldr	x0, [sp, 8]
	ldrb	w0, [x0]
	mov	w1, w0
	ldr	x0, [sp, 24]
	str	w1, [x0]
	ldr	x0, [sp, 8]
	add	x0, x0, 1
	str	x0, [sp, 8]
.L2:
	ldr	x0, [sp, 8]
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L3
	nop
	nop
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	print, .-print
	.align	2
	.global	relocate
	.type	relocate, %function
relocate:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	mov	x0, 64
	str	x0, [sp, 24]
	adrp	x0, :got:END_OF_DATA
	ldr	x1, [x0, #:got_lo12:END_OF_DATA]
	adrp	x0, :got:START_OF_DATA
	ldr	x0, [x0, #:got_lo12:START_OF_DATA]
	sub	x0, x1, x0
	asr	x0, x0, 3
	str	x0, [sp, 16]
	adrp	x0, :got:START_OF_DATA
	ldr	x0, [x0, #:got_lo12:START_OF_DATA]
	str	x0, [sp, 24]
	adrp	x0, :got:END_OF_RODATA
	ldr	x0, [x0, #:got_lo12:END_OF_RODATA]
	str	x0, [sp, 8]
	b	.L5
.L6:
	ldr	x0, [sp, 8]
	ldr	x1, [x0]
	ldr	x0, [sp, 24]
	str	x1, [x0]
	ldr	x0, [sp, 24]
	add	x0, x0, 8
	str	x0, [sp, 24]
	ldr	x0, [sp, 8]
	add	x0, x0, 8
	str	x0, [sp, 8]
.L5:
	ldr	x0, [sp, 16]
	sub	x1, x0, #1
	str	x1, [sp, 16]
	cmp	x0, 0
	bne	.L6
	nop
	nop
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	relocate, .-relocate
	.section	.rodata
	.align	3
.LC0:
	.string	"Hello world\n"
	.align	3
.LC1:
	.string	"uh\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	bl	relocate
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	print
	adrp	x0, t2
	add	x0, x0, :lo12:t2
	ldr	w0, [x0]
	cmp	w0, 3
	bne	.L9
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	print
.L9:
	nop
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (GNU) 9.2.0"
	.section	.note.GNU-stack,"",@progbits
