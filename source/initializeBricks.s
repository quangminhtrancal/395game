@ void initializeBricks(int x, int y)
@	int yOffset = 0;	
@	for(int brickType = 8; brickType >= 6; brickType--)
@		int xOffset = 0;		
@		for (int i=0; i<10;i++){
@			drawBrick(x+xIncrease,y+yIncrease,color);
@			xOffset+=width_brick;		
@		yOffset+=height_brick;	
@

.global initializeBricks
initializeBricks:
	push	{r4-r10, lr}

	x		.req	r4
	y		.req	r5
	xOffset		.req	r6
	yOffset		.req	r7
	brickType	.req	r8
	i		.req	r9

	ldr	r0, =xOrigin
	mov	r1, #50
	str	r1, [r0]

	ldr	r0, =yOrigin
	mov	r1, #50
	str	r1, [r0]

	ldr	r0, =brickWidth
	mov	r1, #96
	str	r1, [r0]

	ldr	r0, =brickHeight
	mov	r1, #32
	str	r1, [r0]

	ldr	r0, =xOrigin
	ldr	x, [r0]
	
	ldr	r0, =yOrigin
	ldr	y, [r0]
	add	y, #32			//brick gap

	mov	xOffset, #0
	mov	yOffset, #0
	mov	brickType, #8

drawRow:
	cmp	brickType, #6
	blt	finishedRows

	mov	i, #0

drawColumns:
	cmp	i, #10
	beq	finishedColumns

	add	r0, x, xOffset
	add	r1, y, yOffset
	mov	r2, brickType
	bl	drawBrick

	ldr	r0, =brickWidth
	ldr	r1, [r0]
	add	xOffset, r1

	add	i, #1
	b	drawColumns

finishedColumns:
	sub	brickType, #1
	mov	xOffset, #0

	ldr	r0, =brickHeight
	ldr	r1, [r0]
	add	yOffset, r1

	b	drawRow

finishedRows:	

	pop	{r4-r10, pc}

.section	.data

.align	4

test:
brickHeight:	.int	4
brickWidth:	.int	4
brickGap:	.int	4