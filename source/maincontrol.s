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
	
// ----------------------DRAW-------------
//void draw(){	
//	paddlex=originx+width_bggame/2-width_paddle/2;
//	paddley=originy+height_bggame-paddlegap;
//	ballx=originx+width_bggame/2-width_ball/2;
//	bally=paddley-32;
//	drawBackground();
//	initializeBricks(originx, originy+brickgap);
//	drawBorder();

.global draw
draw:
	push	{r4-r10,lr}
	ldr r4, =originx
	ldr r5, [r4]	// r5=originx
	mov r6, #416
	add r5, r6		// r5= originx+416
	ldr r4, =paddlex
	str r5, [r4]	// paddlex=originx+416
	
	ldr r4, =originy
	ldr r5, [r4]	// r5=originy
	mov r6, #640
	add r5, r6		// r5= originy+640
	ldr r4, =paddlegap
	ldr r6, [r4]	// r6=paddlegap
	sub r5, r6		// r5=originy+640-paddlegap
	ldr r4, =paddley
	str r5, [r4]	// paddley=originy+640-paddlegap
	
	ldr r4, =originx
	ldr r5, [r4]	// r5=originx
	mov r6, #464	
	add r5, r6		// r5=originx+464
	ldr r4, =ballx
	str r5, [r4]	// ballx=originx+464
	
	ldr r4, =paddley
	ldr r5, [r4]	// r5=paddley
	mov r6, #32
	sub r5, r6		// r5=paddley-32
	ldr r4, =bally
	str r5, [r4]	//bally=paddley-32
	
	bl drawBackground
	
	ldr r4, =originx
	ldr r5, [r4]	// r5=originx
	ldr r4, =originy
	ldr r6, [r4]	// r6= originy
	ldr r4, =brickgap
	ldr r7, [r4]	// r7=brickgap
	add r6, r7		// r6= originy+brickgap
	mov r0, r5
	mov r1, r6
	bl initializeBricks
	bl drawBorder
	
	//	drawBall(ballx,bally);
//	drawPaddle(paddlex, paddley);
	ldr r4, =ballx
	ldr r5, [r4]	// r5=ballx
	ldr r4, =bally
	ldr r6, [r4]	// r6=bally
	mov r0, r5
	mov r1, r6
	bl drawBall

	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	bl drawPaddle
	
		// Draw information for score and live
	ldr r4, =originy
	ldr r5, [r4]		// r5=originy
	mov r0, #348
	mov r1, r5
	bl drawscorelabel
	
	mov r0, #604
	mov r1, r5
	bl drawlivelabel
	
	 	bl updatescores
	bl drawscore
	
	ldr r4, =lives
	ldr r5, [r4]	// r5=lives
	ldr r4, =originy
	ldr r6, [r4]	// r6=originy
	mov r0, r5
	mov r1, #700
	mov r2, r6
	bl Drawnum
	
//	int check=0;
//	int read=0;
//	int count=0;
//	int previousbutton=0;
//	int speed=0;
//	int startball=0;
//	dx=ang_valu;
//	dy=ang_valu;

	ldr r4, =check
	mov r5, #0
	str r5, [r4]	//check=0
	
	ldr r4, =read
	mov r5, #0
	str r5, [r4]	//read=0
	
	ldr r4, =count
	mov r5, #0
	str r5, [r4]	//count=0
	
	ldr r4, =previousbutton
	mov r5, #0
	str r5, [r4]	//previousbutton=0
	
	ldr r4, =speed
	mov r5, #0
	str r5, [r4]	//speed=0

	ldr r4, =startball
	mov r5, #0
	str r5, [r4]	//startball=0
	
	ldr r4, =ang_valu
	ldr r5, [r4]	// r5=ang_valu
	ldr r4, =dx
	str r5, [r4]	// dx=ang_valu
	ldr r4, =dy
	str r5, [r4]	// dy=ang_valu
	
//	while(gamestate==0){
//		while (check==0){
			// if B button is pressed- ball release
//			read=readSnes();
//			if (read==65534){
//				startball=1;
//			}

b checkgamestate
loopgamesate:
b checkcheck
loopcheck:		
	bl readSnes
	mov	r10, r0		// r10=read
	ldr r4, =read
	str r10, [r4]	// read= SNES
	//cmp r10, #65534	// B is pressed- start game
	ldr r4, =Bpress
	ldr r9, [r4]		// r9=Bpress
	cmp r10, r9
	bne checkstartball
	ldr r4, =startball
	mov r7, #1		// don't use r5, r6	; r5=gamestate; r6=check
	str r7, [r4]	//startball=1

checkstartball:	
//	if (startball==1){
//					moveball();
//						if(gamestate==1) check=1;
					// left button
//					if (read==65471){
//						check=1;
						// speed is used to check if the button is pressed repeatedly
//						speed=0;
//						leftmove(speed);
//						read=0xFFFF;
	ldr r4, =startball
	ldr r7, [r4]	// r7=startball
	cmp r7, #1
	bne loopcheck
	
	bl moveball
		
	ldr r4, =gamestate
	ldr r5, [r4]
	cmp r5, #1		// check if gamestate==1 then check=1
	bne next1
	ldr r4, =check
	mov r7, #1
	str r7, [r4]	// check=1
	b checkcheck

	
next1:	
	
	//cmp r10, #65471
	ldr r4, =Lpress
	ldr r9, [r4]		// r9=Lpress
	ldr r4, =read
	ldr r10, [r4]		// r10=read
	cmp r10, r9
	bne next2
	ldr r4, =check
	mov r7, #1
	str r7, [r4]	// check=1
	
	ldr r4, =speed
	mov r7, #0
	str r7, [r4]	//speed=0
	
	mov r0, #0
	bl leftmove
	
	ldr r4, =Resetpress
	ldr r9, [r4]		// r9=Resetpress
	ldr r4, =read
	str r9, [r4]	// read reset
	
	ldr r4, =speed
	mov r7, #0
	str r7, [r4]	//speed=0
	
	b donestartball
	


next2:	
// right button is clicked
//					else if (read==65407){
//						check=1;
						// speed is used to check if the button is pressed repeatedly
//						speed=0;
//						rightmove(speed);
//						read=0xFFFF;
//						speed=0;
					//}
	//cmp r10, #65407
	ldr r4, =Rpress
	ldr r9, [r4]		// r9= Rpress
	ldr r4, =read
	ldr r10, [r4]		// r10=read
	cmp r10, r9
	bne next3
	ldr r4, =check
	mov r7, #1
	str r7, [r4]	// check=1
	
	ldr r4, =speed
	mov r7, #0
	str r7, [r4]	//speed=0
	
	mov r0, #0
	bl rightmove
	
	ldr r4, =Resetpress
	ldr r9, [r4]		// r9=Resetpress
	ldr r4, =read
	str r9, [r4]	// read reset
	
	ldr r4, =speed
	mov r7, #0
	str r7, [r4]	//speed=0
	
	b donestartball

next3:	
	// If A and right move is pressed
//					else if (read==65151){
//						if (previousbutton==read){
//							count++;
//							if ((count>=10) && (count<=20)) speed=1;
//							if ((count>20)&& (count<=30)) speed=2;
//							if (count>30)	speed=3;
//						}
//						if (previousbutton!=read) {
//							count=0;
//						}

//						rightmove(speed);
//						read=0xFFFF;
//						speed=0;
//						previousbutton=65151;	
//					}
	//cmp r10, #65151
	ldr r4, =ARpress
	ldr r9, [r4]		// r9=ARpress
	ldr r4, =read
	ldr r10, [r4]		// r10=read
	cmp r10, r9
	bne next4
	ldr r4, =previousbutton
	ldr r7, [r4]		// r7=previousbutton
	cmp r7, r10
	bne resetcount
	
	ldr r4, =count
	ldr r7, [r4]	// r7=count
	add r7, #1		// r7=count+1
	str r7, [r4]	// count++
	
	cmp r7, #10
	blt nextright
	ldr r4, =speed
	cmp r7, #20
	movle r8, #1	
	strle r8, [r4]	// speed=1	 
	cmp r7, #30
	movle r8, #2	
	strle r8, [r4]	// speed=2
	movgt r8, #3	
	strgt r8, [r4]	// speed=3

	b nextright
resetcount:
	ldr r4, =count
	mov r7, #0
	str r7, [r4]
	
nextright:	
	ldr r4, =speed
	ldr r7, [r4]	// r7=speed
	mov r0, r7		
	bl rightmove
	
	ldr r4, =Resetpress
	ldr r9, [r4]		// r9=Resetpress
	ldr r4, =read
	str r9, [r4]	// read reset

	ldr r4, =speed
	mov r7, #0
	str r7, [r4]	//speed=0	


	//mov r7, #65151
	ldr r4, =ARpress
	ldr r9, [r4]
	ldr r4, =previousbutton	
	str r9, [r4]	//previousbutton=65151	
	

next4:
					// If A and left move is pressed
//					else if (read==65215){
//						if (previousbutton==read){
//							count++;
//							if ((count>=10) && (count<=20)) speed=1;
//							if ((count>20)&& (count<=30)) speed=2;
//							if (count>30)	speed=3;
//						}
//						if (previousbutton!=read) {
//							count=0;
//						}

//						leftmove(speed);
//						read=0xFFFF;
//						speed=0;
//						previousbutton=65215;	
//					}

	//cmp r10, #65215
	ldr r4, =ALpress
	ldr r9, [r4]		// r9=ALpress
	ldr r4, =read
	ldr r10, [r4]		// r10=read
	cmp r10, r9
	bne next5
	ldr r4, =previousbutton
	ldr r7, [r4]		// r7=previousbutton
	cmp r7, r10
	bne resetcount1
	
	ldr r4, =count
	ldr r7, [r4]	// r7=count
	add r7, #1		// r7=count+1
	str r7, [r4]	// count++
	
	cmp r7, #10
	blt nextleft
	ldr r4, =speed
	cmp r7, #20
	movle r8, #1	
	strle r8, [r4]	// speed=1	 
	cmp r7, #30
	movle r8, #2	
	strle r8, [r4]	// speed=2
	movgt r8, #3	
	strgt r8, [r4]	// speed=3

	b nextleft
resetcount1:
	ldr r4, =count
	mov r7, #0
	str r7, [r4]
	
nextleft:	
	ldr r4, =speed
	ldr r7, [r4]	// r7=speed
	mov r0, r7		
	bl leftmove
	
	ldr r4, =Resetpress
	ldr r9, [r4]		// r9=Resetpress
	ldr r4, =read
	str r9, [r4]	// read reset

	ldr r4, =speed
	mov r7, #0
	str r7, [r4]	//speed=0	

	//mov r7, #65151
	ldr r4, =ALpress
	ldr r9, [r4]	// r0 =ALpress
	
	ldr r4, =previousbutton
	str r9, [r4]	//previousbutton=65151	


next5:


donestartball:
	mov r0, #5000
	bl delayMicroseconds


checkcheck:	
	ldr r4, =check
	ldr r6, [r4]	// r6=check
	cmp r6, #0
	beq loopcheck
	
resetcheck:
	ldr r4, =check
	mov r8, #0
	str r8, [r4]	// check=0;

checkgamestate:	
	ldr r4, =gamestate
	ldr r5, [r4]	// r5=gamestate
	cmp r5, #0
	beq	loopgamesate
	
donegame:
	pop	{r4-r10,pc}

.section .data

.align 4


Bpress:	.int	65534
Lpress: .int 	65471
Rpress: .int 	65407
ARpress: .int 	65151
ALpress: .int 	65215
Resetpress: .int 	65535
check: .int 	0
read: .int 	0
count: .int 	0
previousbutton: .int 	0
speed: .int 	0
startball: .int 	0

//testMsg:
//.asciz		"In SNES: %x\n"
//	ldr r4, =read
//	ldr r1, [r4]	// read= SNES	
//	ldr		r0, =testMsg
//	bl printf

