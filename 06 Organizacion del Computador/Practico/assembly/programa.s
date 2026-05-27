	.arch armv8-a
	.file	"programa.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	xzr, [sp, 24]
	str	xzr, [sp, 16]
	b	.L2
.L3:
	ldr	x0, [sp, 24]
	ldr	x1, [sp, 8]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 48
	cset	w0, eq
	and	w0, w0, 255
	and	x0, x0, 255
	ldr	x1, [sp, 16]
	add	x0, x1, x0
	str	x0, [sp, 16]
	ldr	x0, [sp, 24]
	add	x0, x0, 1
	str	x0, [sp, 24]
.L2:
	ldr	x0, [sp, 24]
	cmp	x0, 1024
	bne	.L3
	mov	w0, 0
	add	sp, sp, 32
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
