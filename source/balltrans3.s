//int convert_x(int x){
//	return ((x-originx)/32);
//}
.global convert_x
convert_x:
	push {r4-r10,lr}
	mov r4, r0	// r4=40=x
	ldr r5, =originx
	ldr r6, [r5]	// r6=originx
	sub r4, r6	// r4= x-originx

	mov r5,#-1
	mov r6, #32
	mov r7, #0
loop:
	add r5, #1
	mul r7, r5, r6
	cmp r7, r4
	ble loop
	
	sub r5, #1
	mov r0, r5
	pop	{r4-r10,pc}
	
	///
.global convert_y
convert_y:
	push {r4-r10,lr}
	mov r4, r0	// r4=40=x
	ldr r5, =originy
	ldr r6, [r5]	// r6=originy
	sub r4, r6	// r4= x-originy

	mov r5,#-1
	mov r6, #32
	mov r7, #0
loop1:
	add r5, #1
	mul r7, r5, r6
	cmp r7, r4
	ble loop1

	sub r5, #1
	mov r0, r5
	pop	{r4-r10,pc}

.global checkbordercollision
checkbordercollision:
	push	{r4-r10,lr}
	
//	next_xtl=ballx+dx;
//	next_ytl=bally+dy;
//	next_xbl=ballx+dx;

	ldr r4, =ballx
	ldr r5, [r4]	// r5=ballx
	ldr r4, =dx
	ldr r6, [r4]	// r6=dx
	add r6, r5		// r6=ballx+dx
	ldr	r4, =next_xtl
	str r6, [r4]	//next_xtl=ballx+dx
	
	ldr r4, =bally
	ldr r5, [r4]	// r5=bally
	ldr r4, =dy
	ldr r6, [r4]	// r6=dy
	add r6, r5		// r6=bally+dy
	ldr	r4, =next_ytl
	str r6, [r4]	//next_ytl=bally+dy
	
	ldr r4, =ballx
	ldr r5, [r4]	// r5=ballx
	ldr r4, =dx
	ldr r6, [r4]	// r6=dx
	add r6, r5		// r6=ballx+dx
	ldr	r4, =next_xbl
	str r6, [r4]	//next_xbl=ballx+dx
	
//  next_ybl=bally+width_ball+dy;
	ldr r4, =bally
	ldr r5, [r4]	// r5=bally
	ldr r4, =dy
	ldr r6, [r4]	// r6=dy
	add r6, r5		// r6=bally+dy
	ldr r4, =width_ball
	ldr r5, [r4]	// r5=width_ball
	add r6, r5		// r6=bally+dy+width_ball
	ldr	r4, =next_ybl
	str r6, [r4]	//next_ybl=bally+dy+width_ball
//	next_xtr=ballx+width_ball+dx;
	ldr r4, =ballx
	ldr r5, [r4]	// r5=ballx
	ldr r4, =dx
	ldr r6, [r4]	// r6=dx
	add r6, r5		// r6=ballx+dx
	ldr r4, =width_ball
	ldr r5, [r4]	// r5=width_ball
	add r6, r5		// r6=ballx+dx+width_ball
	ldr	r4, =next_xtr
	str r6, [r4]	//next_xtr=ballx+dx+width_ball
//	next_ytr=bally+dy;
	ldr r4, =bally
	ldr r5, [r4]	// r5=bally
	ldr r4, =dy
	ldr r6, [r4]	// r6=dy
	add r6, r5		// r6=bally+dy
	ldr	r4, =next_ytr
	str r6, [r4]	//next_xbl=ballx+dx
//	next_xbr=ballx+width_ball+dx;
	ldr r4, =ballx
	ldr r5, [r4]	// r5=ballx
	ldr r4, =dx
	ldr r6, [r4]	// r6=dx
	add r6, r5		// r6=ballx+dx
	ldr r4, =width_ball
	ldr r5, [r4]	// r5=width_ball
	add r6, r5		// r6=ballx+dx+width_ball
	ldr	r4, =next_xbr
	str r6, [r4]	//next_xbr=ballx+dx+width_ball

//	next_ybr=bally+height_ball+dy;
	ldr r4, =bally
	ldr r5, [r4]	// r5=bally
	ldr r4, =dy
	ldr r6, [r4]	// r6=dy
	add r6, r5		// r6=bally+dy
	ldr r4, =width_ball
	ldr r5, [r4]	// r5=width_ball
	add r6, r5		// r6=bally+dy+width_ball    width=height
	ldr	r4, =next_ybr
	str r6, [r4]	//next_ybr=bally+dy+width_ball
	
//	int a=next_xtl; // real x coordinate
	ldr r4, =next_xtl
	ldr r5, [r4]	// r5=next_xtl
	ldr r4, =a
	str r5, [r4]	// a=next_xtl
//	int b=next_ytl;  // real y coordinate
	ldr r4, =next_ytl
	ldr r5, [r4]	// r5=next_ytl
	ldr r4, =b
	str r5, [r4]	// b=next_ytl

//		next_xtl=convert_x(next_xtl);
	ldr r4, =next_xtl
	ldr r5, [r4]	// r5=next_xtl
	mov r0, r5	//r0=next_xtl
	bl convert_x
	mov r5, r0	//r5=convert_x(next_xtl)
	ldr r4, =next_xtl
	str r5, [r4]	
//		next_ytl=convert_y(next_ytl);
	ldr r4, =next_ytl
	ldr r5, [r4]	// r5=next_ytl
	mov r0, r5	//r0=next_ytl
	bl convert_y
	mov r5, r0	//r5=convert_y(next_ytl)
	ldr r4, =next_ytl
	str r5, [r4]	
//		next_xtr=convert_x(next_xtr);
	ldr r4, =next_xtr
	ldr r5, [r4]	// r5=next_xtr
	mov r0, r5	//r0=next_xtr
	bl convert_x
	mov r5, r0	//r5=convert_x(next_xtr)
	ldr r4, =next_xtr
	str r5, [r4]	
//		next_ytr=convert_y(next_ytr);
	ldr r4, =next_ytr
	ldr r5, [r4]	// r5=next_ytr
	mov r0, r5	//r0=next_ytr
	bl convert_y
	mov r5, r0	//r5=convert_y(next_ytr)
	ldr r4, =next_ytr
	str r5, [r4]	
//		next_xbl=convert_x(next_xbl);
	ldr r4, =next_xbl
	ldr r5, [r4]	// r5=next_xbl
	mov r0, r5	//r0=next_xbl
	bl convert_x
	mov r5, r0	//r5=convert_x(next_xbl)
	ldr r4, =next_xbl
	str r5, [r4]	
//		next_ybl=convert_y(next_ybl);
	ldr r4, =next_ybl
	ldr r5, [r4]	// r5=next_ybl
	mov r0, r5	//r0=next_ybl
	bl convert_y
	mov r5, r0	//r5=convert_y(next_ybl)
	ldr r4, =next_ybl
	str r5, [r4]	
//		next_xbr=convert_x(next_xbr);
	ldr r4, =next_xbr
	ldr r5, [r4]	// r5=next_xbr
	mov r0, r5	//r0=next_xbr
	bl convert_x
	mov r5, r0	//r5=convert_x(next_xbr)
	ldr r4, =next_xbr
	str r5, [r4]	
//		next_ybr=convert_y(next_ybr);
	ldr r4, =next_ybr
	ldr r5, [r4]	// r5=next_ybr
	mov r0, r5	//r0=next_ybr
	bl convert_y
	mov r5, r0	//r5=convert_y(next_ybr)
	ldr r4, =next_ybr
	str r5, [r4]	

	// CASE for change x direction -----------------------------------------------------------------------------------------
//		if ((next_xtl<=0) && (a <originx)) {
//			dx=-dx;
//		}
//		else if (next_xbr >29) {
//			dx=-dx;
//		}
	ldr r4, =next_xtl
	ldr r5, [r4]	// r5=next_xtl
	cmp r5, #0
	bgt	nottouchleft
	ldr r4, =a
	ldr r5, [r4]	//r5=a
	ldr r4, =originx
	ldr r6, [r4]	// r6=originx
	cmp r5, r6
	bge nottouchleft
	ldr r4, =dx
	ldr r5, [r4]	// r5=dx
	mov r6, #0
	sub r6, r5		// r6=-dx
	ldr r4, =dx
	str r6, [r4]	// dx=-dx
	b checkydirection
nottouchleft:	
	ldr r4, =next_xbr
	ldr r5, [r4]	// r5=next_xbr
	cmp r5, #29
	ble	checkydirection
	ldr r4, =dx
	ldr r5, [r4]	// r5=dx
	mov r6, #0
	sub r6, r5		// r6=-dx
	ldr r4, =dx
	str r6, [r4]	// dx=-dx

checkydirection:
// CASE for change y direction ------------------------------------------------------------------------------------------
				// Touch the top of the game
//		if((gamearray[next_ytl][next_xtl]==9) && (next_ytl==0)){
//			dy=-dy;
//		}

	ldr r4, =next_ytl
	ldr r5, [r4]	// r5= next_ytl
	cmp r5, #0
	bne checkbottom
		//gamearray[next_ytl][next_xtl]  -> index=next_ytl*120+next_xtl
	ldr r4, =next_ytl
	ldr r5, [r4]	//r5=next_ytl
	ldr r4, =next_xtl
	ldr r6, [r4]	//r6=next_xtl
	mov r7, #120
	mul r5, r7	// r5= next_ytl*120
	add r5, r6	//	r5=next_ytl*120+next_xtl
	ldr r4, =gamearray
	str r6, [r4, r5]	//r6=gamearray[next_ytl][next_xtl]
	cmp r6, #9
	blt checkbottom
	ldr r4, =next_ytl
	ldr r5, [r4]
	cmp r5, #0
	bgt checkbottom
	ldr r4, =dy
	ldr r5, [r4]	// r5=dy
	mov r6, #0
	sub r6, r5		// r6=-dy
	ldr r4, =dy
	str r6, [r4]	// dy=-dy
	
checkbottom:	
//		if (b >originy+height_bggame-30){
//				if (lives==0){
//					printf("STOP\n");
//					drawgameover(originx+width_bg/2-width_gameover/2,originy+height_bg/2-height_gameover/2,width_gameover,height_gameover);
//					gamestate=1;
//				}		
	ldr r4, =b
	ldr r5, [r4]	// r5=b
	ldr r4, =originy
	ldr r6, [r4]	// r6=originy
	ldr r4, =height_bggame
	ldr r7, [r4]	// r7=height_bggame
	add r6, r7	//r6=height_bggame+originy
	mov r7, #-30
	add r6, r7	//r6=height_bggame+originy-30
	cmp r5, r6	// compare b with bottom
	ble donebordercheck
	ldr r4, =lives
	ldr r5, [r4]	// r5=lives
	cmp r5, #0
	bgt havelives
	mov r6, #1
	ldr r4, =gamestate
	str r6, [r4]	// gamestate=1
	// x=originx+352
	//y=originy+192
	// w=256; h=256
	ldr r4,=originx
	ldr r5, [r4]	// r5=originx
	mov r6, #352
	add r5, r6		// r5=originx+352
	ldr r4,=originy
	ldr r6, [r4]	// r6=originy
	mov r7, #192
	add r6, r7		// r6=originy+192
	mov r0, r5
	mov r1, r6
	mov r2, #256
	mov r3, #256
	bl drawgameover
	b donebordercheck
	
havelives:	
//					lives--;
//					dx=ang_valu;
//					dy=-ang_valu;
	ldr r4, =lives
	ldr r5, [r4]	//r5=lives
	sub r5, #1
	str r5, [r4]	// lives--
	ldr r4, =ang_valu
	ldr r5, [r4]	// r5=ang_valu
	mov r6, #0
	sub r6, r5		// r6=-ang_valu
	ldr r4, =dx
	str r5, [r4]	// dx=ang_valu
	ldr r4, =dy
	str r6, [r4]	// dy=-ang_valu
//		if (receivebpaddle==0){
//						clearPaddle(paddlex,paddley,width_paddle,height_paddle); width =128
//						clearBall(ballx,bally,width_ball,height_ball);
//						paddlex=originx+width_bggame/2-width_paddle/2; 960/2-128/2=416
//						paddley=originy+height_bggame-paddlegap; height=640
//						ballx=originx+width_bggame/2-width_ball/2;  960/2-32/2=464

	ldr r4, =receivebpaddle
	ldr r5, [r4]	// r5=receivebpaddle
	cmp r5, #0
	bgt hasbigpaddle
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	mov r2, #128
	mov r3, #32
	bl clearPaddle

	ldr r4, =ballx
	ldr r5, [r4]	// r5=ballx
	ldr r4, =bally
	ldr r6, [r4]	// r6=bally
	mov r0, r5
	mov r1, r6
	mov r2, #32
	mov r3, #32
	bl clearBall
	
	ldr r4, =originx
	ldr r5, [r4]	// r5= originx
	mov r6, #416
	add r5, r6		// r5= originx+416
	ldr r4, =paddlex
	str r5, [r4]	// paddlex=originx+416
	
	ldr r4, =originy
	ldr r5, [r4]	// r5= originy
	mov r6, #640
	add r5, r6		// r5= originy+640
	ldr r4, =paddlegap
	ldr r6, [r4]	// r6=paddlegap
	sub r5, r6		// r5=originy+640-paddlegap 
	ldr r4, =paddley
	str r5, [r4]	// paddley=originy+640-paddlegap 
	
	ldr r4, =originx
	ldr r5, [r4]	// r5= originx
	mov r6, #464
	add r5, r6		// r5= originx+464
	ldr r4, =ballx
	str r5, [r4]	// ballx=originx+464
	
	//						bally=paddley-34;
//						drawPaddle(paddlex,paddley,width_paddle,height_paddle);						//draw paddle @ start position
//						drawBall(ballx,bally,width_ball,height_ball);
	ldr r4, =paddley
	ldr r5, [r4]	// r5=paddley
	mov r6, #34
	sub r5, r6	// r5=paddley-34
	ldr r4, =bally
	str r5, [r4]	// bally=paddley-34

	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	mov r2, #128
	mov r3, #32
	bl drawPaddle

	ldr r4, =ballx
	ldr r5, [r4]	// r5=ballx
	ldr r4, =bally
	ldr r6, [r4]	// r6=bally
	mov r0, r5
	mov r1, r6
	mov r2, #32
	mov r3, #32
	bl drawBall
	b donebordercheck

hasbigpaddle:
//						clearbigpaddle(paddlex,paddley,192,height_paddle);
//						clearBall(ballx,bally,width_ball,height_ball);
//						paddlex=originx+width_bggame/2-192/2;   384
//						paddley=originy+height_bggame-paddlegap;
//						ballx=originx+width_bggame/2-width_ball/2=originx+464
//						bally=paddley-34;
//						drawbigpaddle(paddlex,paddley,192,height_paddle);						//draw paddle @ start position
//						drawBall(ballx,bally,width_ball,height_ball);
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	mov r2, #192
	mov r3, #32
	bl clearbigpaddle

	ldr r4, =ballx
	ldr r5, [r4]	// r5=ballx
	ldr r4, =bally
	ldr r6, [r4]	// r6=bally
	mov r0, r5
	mov r1, r6
	mov r2, #32
	mov r3, #32
	bl clearBall
	
	ldr r4, =originx
	ldr r5, [r4]	// r5= originx
	mov r6, #384
	add r5, r6		// r5= originx+384
	ldr r4, =paddlex
	str r5, [r4]	// paddlex=originx+384
	
	ldr r4, =originy
	ldr r5, [r4]	// r5= originy
	mov r6, #640
	add r5, r6		// r5= originy+640
	ldr r4, =paddlegap
	ldr r6, [r4]	// r6=paddlegap
	sub r5, r6		// r5=originy+640-paddlegap 
	ldr r4, =paddley
	str r5, [r4]	// paddley=originy+640-paddlegap 
	
	ldr r4, =originx
	ldr r5, [r4]	// r5= originx
	mov r6, #464
	add r5, r6		// r5= originx+464
	ldr r4, =ballx
	str r5, [r4]	// ballx=originx+464
	

	ldr r4, =paddley
	ldr r5, [r4]	// r5=paddley
	mov r6, #34
	sub r5, r6	// r5=paddley-34
	ldr r4, =bally
	str r5, [r4]	// bally=paddley-34

	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	mov r2, #192
	mov r3, #32
	bl drawPaddle

	ldr r4, =ballx
	ldr r5, [r4]	// r5=ballx
	ldr r4, =bally
	ldr r6, [r4]	// r6=bally
	mov r0, r5
	mov r1, r6
	mov r2, #32
	mov r3, #32
	bl drawBall
	
donebordercheck:		
	pop	{r4-r10,pc}

.section .data

.align 4

bl:	.int	0
next_xtl:	.int	0
next_ytl:	.int	0
next_xbl:	.int	0
next_ybl:	.int	0
next_xtr:	.int	0
next_ytr:	.int	0
next_xbr:	.int	0
next_ybr:	.int	0
a:	.int	0 // real x coordinate
b:	.int	0 // real y coordinate
