
.global drawbigpaddle
drawbigpaddle:


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
	mov paddleWidth, #192
	mov paddleHeight, #32

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
	bl	return_bpaddle

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
	
	
	
	
//------------------------------------------------------------------


.global clearBigpaddle_symbol
clearbigpaddle_symbol:

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
	mov paddleWidth, #192
	mov paddleHeight, #32

	mov	cOffset, #0
	mov	i, #0

outerLoopCP:
	cmp	i, paddleHeight
	beq	exitOuterLoopCP

	mov	j, #0

innerLoopCP:
	cmp	j, paddleWidth
	beq	exitInnerLoopCP


	ldr r2, =background
	ldr r4, [r2]

	
	mov	r2, r4		// color = background
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopCP

exitInnerLoopCP:
	add	i, #1
	b	outerLoopCP
	

exitOuterLoopCP:

	pop	{r4-r10,pc}


.global drawpaddle_symbol
drawPaddle_symbol:
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
	mov paddleWidth, #96
	mov paddleHeight, #32

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
	bl	return_bigpaddle

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




.global clearpaddle_symbol
clearPaddle_symbol:

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
	mov paddleWidth, #96
	mov paddleHeight, #32

	mov	cOffset, #0
	mov	i, #0

outerLoopCP:
	cmp	i, paddleHeight
	beq	exitOuterLoopCP

	mov	j, #0

innerLoopCP:
	cmp	j, paddleWidth
	beq	exitInnerLoopCP


	ldr r2, =background
	ldr r4, [r2]

	
	mov	r2, r4		// color = background
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopCP

exitInnerLoopCP:
	add	i, #1
	b	outerLoopCP
	

exitOuterLoopCP:

	pop	{r4-r10,pc}




//------------------------------------------------------------------------------------------
@void drawslowball_symbol(int x, int y, int lx, int ly){
@	int offset_color=0;
@	int color=0;
@	for (int i=0;i<ly;i++){
@		for (int j=0; j<lx; j++){
@			color=return_slowball(offset_color);
@			DrawPixel(x+j,y+i,color);
@			offset_color+=4;
@		}
@	}
	
@}

.global drawslowball_symbol
drawSlowball_symbol:
	push	{r4-r10,lr}
	x		.req	r4
	y		.req	r5
	slowballWidth	.req	r6
	slowballHeight	.req	r7
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0
	mov	y, r1
	mov slowballWidth, #96
	mov slowballHeight, #32

	mov	cOffset, #0
	mov	i, #0

outerLoopDP:
	cmp	i, slowballHeight
	beq	exitOuterLoopDP

	mov	j, #0

innerLoopDP:
	cmp	j, slowballWidth
	beq	exitInnerLoopDP

	mov	r0, cOffset
	bl	return_slowball

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


.global clearslowball_symbol
clearSlowball_symbol:
	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	slowballWidth	.req	r6
	slowballHeight	.req	r7
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0
	mov	y, r1
	mov slowballWidth, #96
	mov slowballHeight, #32

	mov	cOffset, #0
	mov	i, #0

outerLoopCP:
	cmp	i, slowballHeight
	beq	exitOuterLoopCP

	mov	j, #0

innerLoopCP:
	cmp	j, slowballWidth
	beq	exitInnerLoopCP


	ldr r4, =background
	ldr r4, [r4]

	
	mov	r2, r4
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopCP

exitInnerLoopCP:
	add	i, #1
	b	outerLoopCP
	

exitOuterLoopCP:

	pop	{r4-r10,pc}








