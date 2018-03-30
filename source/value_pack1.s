
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


.global clearbigpaddle
clearbigpaddle:

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

outerLoopCP1:
	cmp	i, paddleHeight
	beq	exitOuterLoopCP1

	mov	j, #0

innerLoopCP1:
	cmp	j, paddleWidth
	beq	exitInnerLoopCP1

	mov	r2, #0x00004040		// color = background
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopCP1

exitInnerLoopCP1:
	add	i, #1
	b	outerLoopCP1
	

exitOuterLoopCP1:

	pop	{r4-r10,pc}
//-------------------------------------------------------

.global drawpaddle_symbol
drawpaddle_symbol:
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

outerLoopDP2:
	cmp	i, paddleHeight
	beq	exitOuterLoopDP2

	mov	j, #0

innerLoopDP2:
	cmp	j, paddleWidth
	beq	exitInnerLoopDP2

	mov	r0, cOffset
	bl	return_bigpaddle

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopDP2

exitInnerLoopDP2:
	add	i, #1
	b	outerLoopDP2
	

exitOuterLoopDP2:

	pop	{r4-r10,pc}

//--------------------------------------------------


.global clearpaddle_symbol
clearpaddle_symbol:

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

outerLoopCP3:
	cmp	i, paddleHeight
	beq	exitOuterLoopCP3

	mov	j, #0

innerLoopCP3:
	cmp	j, paddleWidth
	beq	exitInnerLoopCP3
	
	mov	r2, #0x00004040		// color = background
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopCP3

exitInnerLoopCP3:
	add	i, #1
	b	outerLoopCP3
	

exitOuterLoopCP3:

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
drawslowball_symbol:
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

outerLoopDP4:
	cmp	i, slowballHeight
	beq	exitOuterLoopDP4

	mov	j, #0

innerLoopDP4:
	cmp	j, slowballWidth
	beq	exitInnerLoopDP4

	mov	r0, cOffset
	bl	return_slowball

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopDP4

exitInnerLoopDP4:
	add	i, #1
	b	outerLoopDP4
	

exitOuterLoopDP4:

	pop	{r4-r10,pc}
//-------------------------------------------

.global clearslowball_symbol
clearslowball_symbol:
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

outerLoopCP5:
	cmp	i, slowballHeight
	beq	exitOuterLoopCP5

	mov	j, #0

innerLoopCP5:
	cmp	j, slowballWidth
	beq	exitInnerLoopCP5


	mov	r2, #0x00004040		// color = background
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopCP5

exitInnerLoopCP5:
	add	i, #1
	b	outerLoopCP5
	

exitOuterLoopCP5:

	pop	{r4-r10,pc}








