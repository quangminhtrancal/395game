

.global drawGameinterface
drawGameinterface:
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
	mov	paddleWidth, #1024
	mov	paddleHeight, #704

	mov	cOffset, #0
	mov	i, #0

outerLoopDG:
	cmp	i, paddleHeight
	beq	exitOuterLoopDG

	mov	j, #0

innerLoopDG:
	cmp	j, paddleWidth
	beq	exitInnerLoopDG

	mov	r0, cOffset
	bl	return_gameinterface

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopDG

exitInnerLoopDG:
	add	i, #1
	b	outerLoopDG
	

exitOuterLoopDG:

	pop	{r4-r10,pc}


//--------------------------------------------------------------------------------



.global drawQuit
drawQuit:
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
	mov	paddleWidth, #320
	mov	paddleHeight, #160

	mov	cOffset, #0
	mov	i, #0

outerLoopDQ:
	cmp	i, paddleHeight
	beq	exitOuterLoopDQ

	mov	j, #0

innerLoopDQ:
	cmp	j, paddleWidth
	beq	exitInnerLoopDQ

	mov	r0, cOffset
	bl	return_quitgame

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopDQ

exitInnerLoopDQ:
	add	i, #1
	b	outerLoopDQ
	

exitOuterLoopDQ:

	pop	{r4-r10,pc}
	
	
	
//------------------------------------------------------------------------------



.global drawQuit2
drawQuit2:
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
	mov	paddleWidth, #320
	mov	paddleHeight, #160

	mov	cOffset, #0
	mov	i, #0

outerLoopDQ2:
	cmp	i, paddleHeight
	beq	exitOuterLoopDQ2

	mov	j, #0

innerLoopDQ2:
	cmp	j, paddleWidth
	beq	exitInnerLoopDQ2

	mov	r0, cOffset
	bl	return_quitgame2

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopDQ2

exitInnerLoopDQ2:
	add	i, #1
	b	outerLoopDQ2
	

exitOuterLoopDQ2:

	pop	{r4-r10,pc}


//-----------------------------------------------------------------------------



.global drawStart
drawStart:
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
	mov	paddleWidth, #320
	mov	paddleHeight, #160

	mov	cOffset, #0
	mov	i, #0

outerLoopDS:
	cmp	i, paddleHeight
	beq	exitOuterLoopDS

	mov	j, #0

innerLoopDS:
	cmp	j, paddleWidth
	beq	exitInnerLoopDS

	mov	r0, cOffset
	bl	return_startgame

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopDS

exitInnerLoopDS:
	add	i, #1
	b	outerLoopDS
	

exitOuterLoopDS:

	pop	{r4-r10,pc}
	
	
	

//-----------------------------------------------------------------------------------------------------------




.global drawStart2
drawStart2:
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
	mov	paddleWidth, #320
	mov	paddleHeight, #160

	mov	cOffset, #0
	mov	i, #0

outerLoopDS2:
	cmp	i, paddleHeight
	beq	exitOuterLoopDS2

	mov	j, #0

innerLoopDS2:
	cmp	j, paddleWidth
	beq	exitInnerLoopDS2

	mov	r0, cOffset
	bl	return_startgame2

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopDS2

exitInnerLoopDS2:
	add	i, #1
	b	outerLoopDS2
	

exitOuterLoopDS2:

	pop	{r4-r10,pc}

//----------------------------------------------------------
	


