
.global drawstart
drawstart:
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
	mov	paddleWidth, #960
	mov	paddleHeight, #640

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
	bl	return_gameinterface

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



.global drawquit
drawquit:
	push	{r4-r10,lr}

	x		.req	r4
	y		.req	r5
	Width	.req	r6
	Height	.req	r7
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0
	mov	y, r1
	mov	Width, #960
	mov	Height, #640

	mov	cOffset, #0
	mov	i, #0

outerLoopDQ:
	cmp	i, Height
	beq	exitOuterLoopDQ

	mov	j, #0

innerLoopDQ:
	cmp	j, Width
	beq	exitInnerLoopDQ

	mov	r0, cOffset
	bl	return_gameinterface2

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
//void drawstartscreen(){
//	int read;
//	int up=1;
//	int down=0;
//	drawstart(originx,originy, 960,640);
//	int movetogame=0;
//	while (movetogame==0){
//		read=readSnes();




.global drawstartscreen
drawstartscreen:
	push	{r4-r10,lr}
	
	ldr r4, =originx
	ldr r5, [r4]	// r5=originx
	ldr r4, =originx
	ldr r6, [r4]	// r6=originy
	mov r0, r5
	mov r1, r6
	mov r2, #960
	mov r3, #640
	bl drawstart
	b checkstartgame
loopcheck:	
	bl readSnes
	mov r5, r0		// r5= readSnes
	ldr r4, =read
	str r5, [r4]	// read=readSnes

		// up button
//		if (read==65519){
//			drawstart(originx,originy, 960,640);
//			up=1;
//			down=0;
//		}	
	
	ldr r4, =read
	ldr r5, [r4]	// r5=read
	ldr r4, =Uppress
	ldr r6, [r4]	// r6=Uppress
	cmp r5, r6
	bne nextcheck1
	ldr r4, =originx
	ldr r5, [r4]	// r5=originx
	ldr r4, =originy
	ldr r6, [r4]	// r6=originy
	mov r0, r5
	mov r1, r6
	mov r2, #960
	mov r3, #640
	bl drawstart
	ldr r4, =up
	mov r5, #1
	str r5, [r4]	// up=1
	
	ldr r4, =down
	mov r5, #0
	str r5, [r4]	// down=0
	b checkstartgame
	
nextcheck1:	
			// down button
//		if (read==65503){
//			drawquit(originx,originy, 960,640);
//			down=1;
//			up=0;
//		}
	ldr r4, =read
	ldr r5, [r4]	// r5=read
	ldr r4, =Downpress
	ldr r6, [r4]	// r6=Downpress
	cmp r5, r6
	bne nextcheck2
	ldr r4, =originx
	ldr r5, [r4]	// r5=originx
	ldr r4, =originy
	ldr r6, [r4]	// r6=originy
	mov r0, r5
	mov r1, r6
	mov r2, #960
	mov r3, #640
	bl drawquit
	ldr r4, =up
	mov r5, #0
	str r5, [r4]	// up=0
	
	ldr r4, =down
	mov r5, #1
	str r5, [r4]	// down=1
	b checkstartgame


nextcheck2:	
			// if A button is pressed
//		if (read==65279){
//			if (up==1) draw();
//			else if (down==1) printf ("You quit\n");
//		}

	ldr r4, =read
	ldr r5, [r4]	// r5=read
	ldr r4, =Apress
	ldr r6, [r4]	// r6=Apress
	cmp r5, r6
	bne checkstartgame
	ldr r4, =up
	ldr r5, [r4]	// r5=up
	cmp r5, #1
	blt quit
	bl draw
	b checkstartgame
quit:
	
	b checkstartgame

checkstartgame:
	ldr r4, =movetogame
	ldr r5, [r4]	// r5= movetogame
	cmp r5, #0
	beq loopcheck
	
	
	pop	{r4-r10,pc}
	
	
.section .data

.align 4

read:	.int	0
up:	.int	1
down:	.int	0
movetogame:	.int	0
Uppress: .int	65519
Downpress: .int 65503
Apress: .int 65279
