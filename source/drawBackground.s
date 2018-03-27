.global drawBackground
drawBackground:
	push	{r4-r10, lr}

	x		.req	r4
	y		.req	r5
	width		.req	r6
	height		.req	r7
	i		.req	r8
	j		.req	r9
	
	ldr	r0, =xOrigin
	ldr	x, [r0]
	
	ldr	r0, =windowWidth
	ldr	width, [r0]

	ldr	r0, =yOrigin
	ldr	y, [r0]
	
	ldr	r0, =windowHeight
	ldr	height, [r0]

	mov	x, #50
	mov	y, #50
	mov	width, #960
	mov	height, #640

	mov	i, #0

outerLoopDBG:
	cmp	i, height
	beq	exitOuterLoopDBG

	mov	j, #0

innerLoopDBG:
	cmp	j, width
	beq	exitInnerLoopDBG

	add	r0, x, j
	add	r1, y, i
	mov	r2, #0x00004040
	bl	DrawPixel

	add	j, #1
	b	innerLoopDBG

exitInnerLoopDBG:
	add	i, #1
	b	outerLoopDBG	

exitOuterLoopDBG:

	pop	{r4-r10, pc}


.section	.data
.align 4

test:	.asciz	"TEST VAL: %d\n"