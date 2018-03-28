/////////////// LEFT MOVE ---------------------------------
//void leftmove(int speed){
//	if (receivebpaddle==0) clearPaddle(paddlex, paddley);
//	if (receivebpaddle==1) clearbigpaddle(paddlex,paddley,192,height_paddle);
// r0 has the speed
.global leftmove
leftmove:
	push	{r4-r10,lr}
	mov r10, r0	// r10=speed
	
	ldr r4, =receivebpaddle
	ldr r5, [r4]	//r5=receivebpaddle
	cmp r5, #0
	bne largepaddle
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	bl clearPaddle
	b checkleftlimit
	
largepaddle:	
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	mov r2, #192
	mov r3, #32
	bl clearbigpaddle
	
	//	if (paddlex>originx) {
//		if (speed==0) 	paddlex-=1;
//		if (speed==1)	paddlex-=5;
//		if (speed==2)	paddlex-=10;
//		if (speed==3)	paddlex-=20;
checkleftlimit:
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =originx
	ldr r6, [r4]	// r6=originx
	cmp r5, r6
	blt reachleft
	cmp r10, #0
	bgt higherzero
	ldr r4, =paddlex
	ldr	r5, [r4]	// r5=paddlex
	mov r6, #1
	sub r5, r6		// r5=paddlex-1
	str r5, [r4]	//paddlex=paddlex-1
	b reachleft
higherzero:
	cmp r10, #1
	bgt higherone
	ldr r4, =paddlex
	ldr	r5, [r4]	// r5=paddlex
	mov r6, #5
	sub r5, r6		// r5=paddlex-5
	str r5, [r4]	//paddlex=paddlex-5
	b reachleft
higherone:
	cmp r10, #2
	bgt highertwo
	ldr r4, =paddlex
	ldr	r5, [r4]	// r5=paddlex
	mov r6, #10
	sub r5, r6		// r5=paddlex-10
	str r5, [r4]	//paddlex=paddlex-10
	b reachleft
highertwo:
	cmp r10, #3
	bgt reachleft
	ldr r4, =paddlex
	ldr	r5, [r4]	// r5=paddlex
	mov r6, #20
	sub r5, r6		// r5=paddlex-20
	str r5, [r4]	//paddlex=paddlex-20
	
reachleft:	

//	if (paddlex<originx) paddlex=originx;
//	if (receivebpaddle==0) drawPaddle(paddlex,paddley);
//	if (receivebpaddle==1) drawbigpaddle(paddlex,paddley,192,height_paddle);
//}
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =originx
	ldr r6, [r4]	// r6=originx
	cmp r5, r6
	bge drawleft
	ldr r4, =paddlex
	str r6, [r4]	// paddlex=originx
	
drawleft:	
	ldr r4, =receivebpaddle
	ldr r5, [r4]	//r5=receivebpaddle
	cmp r5, #0
	bne drawlarge
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	bl drawPaddle
	b doneleft

drawlarge:
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	mov r2, #192
	mov r3, #32
	bl drawbigpaddle

doneleft:	
	
	pop	{r4-r10,pc}

////////////////// RIGHT MOVE////////////////
.global rightmove
rightmove:
	push	{r4-r10,lr}
	mov r10, r0	// r10=speed
	
	ldr r4, =receivebpaddle
	ldr r5, [r4]	//r5=receivebpaddle
	cmp r5, #0
	bne largepaddle1
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	bl clearPaddle
	b checkrightlimit
	
largepaddle1:	
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	mov r2, #192
	mov r3, #32
	bl clearbigpaddle
	
//	if (paddlex<(originx+width_bg-width_paddle)) { // 960-128=832
//		if (speed==0) 	paddlex+=1;
//		if (speed==1)	paddlex+=5;
//		if (speed==2)	paddlex+=10;
//		if (speed==3)	paddlex+=20;	
//	}
checkrightlimit:
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =originx
	ldr r6, [r4]	// r6=originx
	mov r7, #832
	add r6, r7		// r6=originx+832
	cmp r5, r6
	bge reachright
	cmp r10, #0
	bgt higherzero1
	ldr r4, =paddlex
	ldr	r5, [r4]	// r5=paddlex
	mov r6, #1
	add r5, r6		// r5=paddlex+1
	str r5, [r4]	//paddlex=paddlex+1
	b reachright
higherzero1:
	cmp r10, #1
	bgt higherone1
	ldr r4, =paddlex
	ldr	r5, [r4]	// r5=paddlex
	mov r6, #5
	add r5, r6		// r5=paddlex+5
	str r5, [r4]	//paddlex=paddlex+5
	b reachright
higherone1:
	cmp r10, #2
	bgt highertwo1
	ldr r4, =paddlex
	ldr	r5, [r4]	// r5=paddlex
	mov r6, #10
	add r5, r6		// r5=paddlex+10
	str r5, [r4]	//paddlex=paddlex+10
	b reachright
highertwo1:
	cmp r10, #3
	bgt reachright
	ldr r4, =paddlex
	ldr	r5, [r4]	// r5=paddlex
	mov r6, #20
	add r5, r6		// r5=paddlex+20
	str r5, [r4]	//paddlex=paddlex+20
	
reachright:	


//	if (receivebpaddle==0) {
//		if (paddlex>(originx+width_bggame-width_paddle)) paddlex=originx+width_bggame-width_paddle;
//		drawPaddle(paddlex,paddley);
	//}
//	else if (receivebpaddle==1) 
//	{
//		if (paddlex>(originx+width_bggame-192)) paddlex=originx+width_bggame-192; 
//		drawbigpaddle(paddlex,paddley,192,height_paddle);
//	}

	
drawright:	
	ldr r4, =receivebpaddle
	ldr r5, [r4]	//r5=receivebpaddle
	cmp r5, #0
	bne drawlargeright
	
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =originx
	ldr r6, [r4]	// r6=originx
	mov r7, #832
	add r6, r7	// r6=originx+832
	cmp r5, r6
	ble drawsmallpad
	ldr r4, =paddlex
	str r6, [r4]	// paddlex=originx+832
	
drawsmallpad:	
	
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	bl drawPaddle
	b doneright

drawlargeright:

	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =originx
	ldr r6, [r4]	// r6=originx
	mov r7, #768
	add r6, r7	// r6=originx+768
	cmp r5, r6
	ble drawlarger
	ldr r4, =paddlex
	str r6, [r4]	// paddlex=originx+768

drawlarger:
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	mov r2, #192
	mov r3, #32
	bl drawbigpaddle

doneright:	
	
	pop	{r4-r10,pc}
