
@ drawBrick(x, y, brickType(6=White,7=Green,8=Red){
@	offset_color = 0;
@	color=0;
@	for (int i=0;i<ly;i++){
@		for (int j=0; j<lx; j++){
@			color=return_whitebrick(offset_color);
@			DrawPixel(x+j,y+i,color);
@			offset_color+=4;
@

.global drawBrick
drawBrick:
	push	{r4-r10,lr}

	x		.req	r4
	y		.req	r5
	brickWidth	.req	r6
	brickLength	.req	r7
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0
	mov	y, r1
	mov	brickWidth, #96
	mov	brickLength, #32

	ldr	r0, =brickType
	str	r2, [r0]

	mov	cOffset, #0
	mov	i, #0

outerLoopDB:
	cmp	i, brickLength
	beq	exitOuterLoopDB

	mov	j, #0

innerLoopDB:
	cmp	j, brickWidth
	beq	exitInnerLoopDB

	ldr	r0, =brickType
	ldr	r1, [r0]
	mov	r0, cOffset
	bl	return_brick

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopDB

exitInnerLoopDB:
	add	i, #1
	b	outerLoopDB

exitOuterLoopDB:
	ldr	r0, =brickType
	ldr	r2, [r0]

	mov	r0, x
	mov	r1, y
	bl	updateArray

	pop	{r4-r10, pc}


.global clearBrick
clearBrick:
	push	{r4-r10,lr}

	x		.req	r4
	y		.req	r5
	brickWidth	.req	r6
	brickLength	.req	r7
	i		.req	r8
	j		.req	r9


	mov	x, r0
	mov	y, r1
	mov	brickWidth, #96
	mov	brickLength, #32

	mov	i, #0

outerLoopCB:
	cmp	i, brickLength
	beq	exitOuterLoopCB

	mov	j, #0

innerLoopCB:
	cmp	j, brickWidth
	beq	exitInnerLoopCB


	add	r0, x, j
	add	r1, y, i
	mov	r2, #0x00004040
	bl	DrawPixel

	add	j, #1
	b	innerLoopCB

exitInnerLoopCB:
	add	i, #1
	b	outerLoopCB

exitOuterLoopCB:
	bl	printmemory

	mov	r2, #6
	mov	r0, x
	mov	r1, y
	bl	deleteFromArray

	bl	printmemory

	pop	{r4-r10, pc}

// Take r0 as the offset for the image color location
.global return_brick
return_brick:
	push	{r4-r10, lr}

	mov	r5, r0
	
whiteBrick:
	cmp	r1, #6
	bne	greenBrick

	ldr	r4, =whitebrick
	b	colorSelected

greenBrick:
	cmp	r1, #7
	bne	redBrick

	ldr	r4, =greenbrick
	b	colorSelected

redBrick:
	ldr	r4, =redbrick

colorSelected:
	ldr	r0, [r4,r5]
	
	pop	{r4-r10, pc}

.section .data

.align 4

brickType:	.int	4