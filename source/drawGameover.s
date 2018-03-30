@  void drawgameover(int x, int y, int lx, int ly){
 	
@	int offset_color=0;
@ 	int color=0;
 
@ 	for (int i=0;i<ly;i++){
@ 		for (int j=0; j<lx; j++){
@ 			color=return_gameover(offset_color);
@ 			DrawPixel(x+j,y+i,color);
@ 			offset_color+=4;
@ 		}
@ 	}
 	
@ }





.global drawgameover
drawgameover:


	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	gameoverWidth	.req	r6
	gameoverHeight	.req	r7
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0
	mov	y, r1
	mov gameoverWidth, #256
	mov gameoverHeight, #256

	mov	cOffset, #0
	mov	i, #0

outerLoopDGO:
	cmp	i, gameoverHeight
	beq	exitOuterLoopDGO

	mov	j, #0

innerLoopDGO:
	cmp	j, gameoverWidth
	beq	exitInnerLoopDGO

	mov	r0, cOffset
	bl	return_gameover

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopDGO

exitInnerLoopDGO:
	add	i, #1
	b	outerLoopDGO
	

exitOuterLoopDGO:

	pop	{r4-r10,pc}
	
	
	
