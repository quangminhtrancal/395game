@ void drawball(int x, int y, int lx, int ly){
@ 	int offset_color=0;
@ 	int color=0;
@ 	for (int i=0;i<ly;i++){
@ 		for (int j=0; j<lx; j++){
@ 			color=return_ball(offset_color);
@ 			DrawPixel(x+j,y+i,color);
@ 			offset_color+=4;
@

.global drawBall
drawBall:
	push	{r4-r10,lr}

	x		.req	r4
	y		.req	r5
	ballWidth	.req	r6
	ballHeight	.req	r7
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0
	mov	y, r1
	mov	ballWidth, #32
	mov	ballHeight, #32

	mov	cOffset, #0
	mov	i, #0

outerLoopDB:
	cmp	i, ballHeight
	beq	exitOuterLoopDB

	mov	j, #0

innerLoopDB:
	cmp	j, ballWidth
	beq	exitInnerLoopDB

	mov	r0, cOffset
	bl	return_ball

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

	mov	r0, x
	mov	r1, y
	mov	r2, #2
	bl	updateArray

	pop	{r4-r10,pc}


.global clearBall
clearBall:
	push	{r4-r10, lr}

	x		.req	r4
	y		.req	r5
	ballWidth	.req	r6
	ballHeight	.req	r7
	i		.req	r8
	j		.req	r9

	mov	x, r0
	mov	y, r1
	mov	ballWidth, #32
	mov	ballHeight, #32

	mov	i, #0

outerLoopCB:
	cmp	i, ballHeight
	beq	exitOuterLoopCB

	mov	j, #0

innerLoopCB:
	cmp	j, ballWidth
	beq	exitInnerLoopCB

	mov	r0, #0x00004040

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	j, #1
	b	innerLoopCB

exitInnerLoopCB:
	add	i, #1
	b	outerLoopCB	

exitOuterLoopCB:

	mov	r0, x
	mov	r1, y
	mov	r2, #2
	bl	deleteFromArray

	pop	{r4-r10, pc}



// Take r0 as the offset for the image color location
.global return_ball
return_ball:
	push	{r4, r5,lr}

	ldr	r4, =ball
	mov	r5, r0	
	ldr	r0, [r4,r5]
	
	pop	{r4,r5,pc}

.section .data

.align 4