@ void drawpaddle(int x, int y, int lx, int ly){
@ 	int offset_color=0;
@ 	int color=0;
@ 	for (int i=0;i<ly;i++){
@ 		for (int j=0; j<lx; j++){
@ 			color=return_ball(offset_color);
@ 			DrawPixel(x+j,y+i,color);
@ 			offset_color+=4;
@

.global drawPaddle
drawPaddle:
	push	{r4-r10,lr}

	x		.req	r4
	y		.req	r5
	paddleWidth	.req	r6
	paddleHeight	.req	r7
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0
	mov	y, r1
	mov	paddleWidth, #128
	mov	paddleHeight, #32

	mov	cOffset, #0
	mov	i, #0

outerLoopDP:
	cmp	i, paddleHeight
	beq	exitOuterLoopDP

	mov	j, #0

innerLoopDP:
	cmp	j, paddleWidth
	beq	exitInnerLoopDP

	mov	r0, cOffset
	bl	return_paddle

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopDP

exitInnerLoopDP:
	add	i, #1
	b	outerLoopDP
	

exitOuterLoopDP:

	pop	{r4-r10,pc}

.global clearPaddle
clearPaddle:
	push	{r4-r10,lr}

	x		.req	r4
	y		.req	r5
	paddleWidth	.req	r6
	paddleHeight	.req	r7
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0
	mov	y, r1
	mov	paddleWidth, #128
	mov	paddleHeight, #32

	mov	cOffset, #0
	mov	i, #0

outerLoopCP:
	cmp	i, paddleHeight
	beq	exitOuterLoopCP

	mov	j, #0

innerLoopCP:
	cmp	j, paddleWidth
	beq	exitInnerLoopCP

	add	r0, x, j
	add	r1, y, i
	mov	r2, #0x00004040

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopCP

exitInnerLoopCP:
	add	i, #1
	b	outerLoopCP
	

exitOuterLoopCP:

	pop	{r4-r10,pc}


// Take r0 as the offset for the image color location
.global return_paddle
return_paddle:
	push	{r4, r5,lr}

	ldr	r4, =paddle
	mov	r5, r0	
	ldr	r0, [r4,r5]
	
	pop	{r4,r5,pc}

.section .data

.align 4

