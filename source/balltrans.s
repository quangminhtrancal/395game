//int reversex(int indexx){
//	int a=indexx/3;
//	return (originx+a*96);
 //}
// convert from index of brick in the array to the real x position
// ro has indexx
.global reversex
reversex:
	push	{r4-r10,lr}
	mov r9, r0	// r9=indexx
	mov r4,#-1
	mov r5, #3
	mov r6, #0

	checkmultiple:
				add r4, #1
				mul r6, r4, r5
				cmp r6,r9  // r6= 3*r4
				ble checkmultiple
				sub r4, #1

	
	ldr r8, =originx
	ldr r5, [r8]    // r5=originx
	mov r7, #96
	mul r4, r7  // r4= 96*a
	add r5, r4
	mov r0, r5
	
	pop	{r4-r10,pc}

//int reversey(int indexy){	 
//	return (originy+indexy*32);
// }
// convert from index in the array to the real y position

.global reversey
reversey:
	push	{r4-r10,lr}
	mov r6, r0
	mov r3, #32
	ldr r4, =originy
	ldr r5, [r4]    // r5=originy
	mul r6, r3  // r1= 32*a
	add r0, r5, r6
	pop	{r4-r10,pc}

 //int checkbrick(int brickvalue){
//	if (brickvalue==6) return 1;
//	else if (brickvalue==7) return 2;
//	else if (brickvalue==8) return 3;
//	return 0;
 //}

.global checkbrick
checkbrick:
	push	{r4-r10,lr}
	mov 	r4, r0
	cmp		r4, #6
	moveq	r0, #1
	beq		donecheckbrick
	cmp		r4, #7
	moveq	r0, #2
	beq		donecheckbrick
	cmp		r4, #8
	moveq	r0, #3
	beq		donecheckbrick
donecheckbrick:	
	pop	{r4-r10,pc}



 //void treatbrick(int nextx, int nexty, int category){
// 	if (category==1) {
//		clearBrick(reversex(nextx),reversey(nexty));
//		scores++;
		// Setting to define the column of white brick which has the trigger for the value pack
//		if (nextx/3==trigslow) {
//			triggerslowball=1;
//		}
//		else if (nextx/3==trigbig) {
//			triggerbigpaddle=1;
//		}
//	}
//	else if (category==2) {
//		clearBrick(reversex(nextx),reversey(nexty));
//		drawBrick(reversex(nextx),reversey(nexty),6);//draw white bricks
//	}
//	else if (category==3) {
//		clearBrick(reversex(nextx),reversey(nexty));
//		drawBrick(reversex(nextx),reversey(nexty),7);	//draw green bricks
//	}
	
// }
.global treatbrick
// r0 for nextx; r1 for nexty, r2 for category

treatbrick:
	push	{r4-r10,lr}

	mov r4, r0	// r4=nextx
	mov r5, r1	// r5=nexty
	mov r6, r2	// r6= category
	
	cmp r6, #1
	bne	cate2
	
	//triggerslowball=1;
	ldr	r0, =trigslow
	ldr	r8, [r0]	// r8=trigslow
	mov r9, #3
	mul r8, r9
	ldr r10, =triggerslowball
	cmp r4, r8	// compare nextx == trigslow*3
	mov	r0,#1
	streq r0, [r10]	//triggerslowball=1;
	beq clear
	
	//if (nextx/3==trigbig)
	ldr	r0, =trigbig
	ldr	r8, [r0]	// r8=trigbig
	mov r9, #3
	mul r8, r9
	ldr r10, =triggerbigpaddle
	cmp r4, r8	// compare nextx == trigbig*3
	mov	r0,#1
	streq r0, [r10]	//triggerslowball=1;

clear:	
	//clearBrick(reversex(nextx),reversey(nexty));
	mov	r0, r4
	bl reversex
	mov r7,r0	// r7=reversex(nextx)

	mov	r0, r5
	bl reversey
	mov r8,r0	// r8=reversey(nexty)
	
	mov r0, r7
	mov r1, r8
	bl clearBrick

	bl increase_score

	b donetreatbrick
	
cate2:
	//		clearBrick(reversex(nextx),reversey(nexty));
//		drawBrick(reversex(nextx),reversey(nexty),6);//draw white bricks
	cmp r6, #2
	bne cate3
	mov r0, r4
	bl reversex	
	mov r7,r0	// r7=reversex(nextx)
	
	mov	r0, r5
	bl reversey
	mov r8,r0	// r8=reversey(nexty)

	mov r0, r7
	mov r1, r8
	bl clearBrick
	
	mov r0, r7
	mov r1, r8
	mov r2, #6
	bl drawBrick

	b donetreatbrick
cate3:	
	cmp r6, #3
	bne donetreatbrick
	mov r0, r4
	bl reversex	
	mov r7,r0	// r7=reversex(nextx)
	
	mov	r0, r5
	bl reversey
	mov r8,r0	// r8=reversey(nexty)

	mov r0, r7
	mov r1, r8
	bl clearBrick
	
	mov r0, r7
	mov r1, r8
	mov r2, #7
	bl drawBrick

	b donetreatbrick
	
	b donetreatbrick
donetreatbrick:
	pop	{r4-r10,pc}
 
//---------------------------------------------------------------------

//int Touching(int al, int ar, int at, int ab, int bl, int br, int bt, int bb)
//{
//	int check=0;
//	if ((ar >= bl)&&(al <= br)&&(ab>=bt)&&(at<=bb)){
//		check=1;
//	}
//	return check;
//}
// r0=al; r1=ar; r2=at; r3=ab; r4=bl; r5=br; r6=bt; r7=bb

//------------------------------------------------------------

//void checkcollision_ballbrick(int bry, int brx, int brvalue)
  

/////// r0: bricky; r1: bickx; r2: brick value

.global checkcollision_ballbrick
checkcollision_ballbrick:
	push	{r4-r10,lr}
	mov r4, r0	// r4=bry
	mov r5, r1	// r5=brx
	mov r6, r2	// r6=brvalue
	ldr r9, =originx
	ldr r7, [r9]	// r7=originx
	
	mov r0, #32
	mul r8, r5, r0	// r8=32*brx
	add r8, r7		// r8=32*brx+originx=brickx
	ldr r0, =brl
	str r8, [r0]
	mov r1, #96
	add r8, r1
	ldr r0, =brr
	str r8, [r0]
	
	ldr r0, =originy
	ldr r7, [r0]	// r7=originy
	mov r0, #32
	mul r8, r4, r0	// r8=32*bry
	add r8, r7		// r8=32*bry+originy=bricky
	ldr r0, =brt
	str r8, [r0]
	mov r1, #32
	add r8, r1
	ldr r0, =brb
	str r8, [r0]
	
	ldr r9, =ballx
	ldr r7, [r9]	// r7=ballx
	ldr r8, =bl
	str r7, [r8]	// bl=ballx

	ldr r9, =ballx
	ldr r7, [r9]	// r7=ballx
	add r7, #32
	ldr r8, =br
	str r7, [r8]	// br=ballx+32
	
	ldr r9, =bally
	ldr r7, [r9]	// r7=bally
	ldr r8, =bt
	str r7, [r8]	// bt=bally

	ldr r9, =bally
	ldr r7, [r9]	// r7=ballx
	add r7, #32
	ldr r8, =bb
	str r7, [r8]	// bb=bally+32

	// Check touching
	//	 if ((brr >= bl)&&(brl <= br)&&(brb>=bt)&&(brt<=bb))
	ldr r0, =brr
	ldr r7, [r0]	// r7=brr
	ldr r0, =bl
	ldr r8, [r0]	// r8=bl
	cmp r7, r8
	blt donetouch
	ldr r0, =brl
	ldr r7, [r0]	// r7=brl
	ldr r0, =br
	ldr r8, [r0]	// r8=br
	cmp r7, r8
	bgt donetouch
	
	ldr r0, =brb
	ldr r7, [r0]	// r7=brb
	ldr r0, =bt
	ldr r8, [r0]	// r8=bt
	cmp r7, r8
	blt donetouch
	
	ldr r0, =brt
	ldr r7, [r0]	// r7=brt
	ldr r0, =bb
	ldr r8, [r0]	// r8=bb
	cmp r7, r8
	bgt donetouch
	// touch then treat brick
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl treatbrick
	
//		 int leftarea=br-brl;
//		 int rightarea=brr-bl;
//		 int toparea=bb-brt;
//		 int botarea=brb-bt;
	ldr r4, =br
	ldr r5, [r4] // r5=br
	ldr r4, =brl
	ldr r6, [r4] // r6=brl
	sub r5, r6	// r5= br- brl
	ldr r4, =leftarea
	str r5, [r4] // r5=leftarea

		
	ldr r4, =brr
	ldr r5, [r4] // r5=brr
	ldr r4, =bl
	ldr r6, [r4] // r6=bl
	sub r5, r6	// r5= brr- bl
	ldr r4, =rightarea
	str r5, [r4] // r5=rightarea
	
	ldr r4, =bb
	ldr r5, [r4] // r5=bb
	ldr r4, =brt
	ldr r6, [r4] // r6=brt
	sub r5, r6	// r5= bb- brt
	ldr r4, =toparea
	str r5, [r4] // r5=toparea
	
	ldr r4, =brb
	ldr r5, [r4] // r5=brb
	ldr r4, =bt
	ldr r6, [r4] // r6=bt
	sub r5, r6	// r5= brb- bt
	ldr r4, =botarea
	str r5, [r4] // r5=botarea
	
	//		 int ballfromleft=0;
//		 int minX=rightarea;
//		 int minY=botarea;
//		 int ballfromtop=0;

	ldr r4, =ballfromleft
	mov r5, #0
	str r5, [r4]
	
	
	ldr r5, =rightarea
	ldr r6, [r5]	// minX=rightarea
	ldr r4, =minX
	str r6, [r4]
	
	ldr r5, =botarea
	ldr r6, [r5]	// minY=botarea
	ldr r4, =miny
	str r6, [r4]
	
	ldr r4, =ballfromtop
	mov r5, #0
	str r5, [r4]
	
//	if (leftarea<rightarea) {
//			 ballfromleft=1;
//			 minX=leftarea;
//		}

	ldr r4, =leftarea
	ldr r5, [r4]	// r5=leftarea
	ldr r4, =rightarea
	ldr r6, [r4]	// r6=rightarea
	cmp r5, r6
	bge doneleftright
	ldr r4, =ballfromleft
	mov r5, #1
	str r5, [r4]	//ballfromleft=1;
	ldr r4, =leftarea
	ldr r5, [r4]	// r5=leftarea
	ldr r4, =minX
	str r5, [r4]	// minX=leftarea

//	 if (toparea<botarea){
//			 ballfromtop=1;
//			 minY=toparea;
//		}	

	ldr r4, =toparea
	ldr r5, [r4]	// r5=toparea
	ldr r4, =botarea
	ldr r6, [r4]	// r6=botarea
	cmp r5, r6
	bge doneleftright
	ldr r4, =ballfromtop
	mov r5, #1
	str r5, [r4]	//ballfromtop=1;
	ldr r4, =toparea
	ldr r5, [r4]	// r5=toparea
	ldr r4, =minY
	str r5, [r4]	// minY=toparea	

doneleftright:	
//	if (minX<minY){
//			if (ballfromleft==1) 
//			{
//				if (dx>0) dx=-dx;
//			}
//			else if (ballfromleft==0)
//			{
//				if (dx<0) dx=-dx;
//			}
//		}

	ldr r4, =minX
	ldr r5, [r4] // r5=minX
	ldr r4, =minY
	ldr r6, [r4] // r6=minY
	cmp r5, r6
	bge larger
	ldr r4, =ballfromleft
	ldr r5, [r4]	
	cmp r5, #1	// ballfromleft==1
	bne notfromleft
	ldr r4, =dx
	ldr r5, [r4] // r5=dx
	cmp r5, #0	// dx with 0
	ble larger
	mov	r6, #0
	sub r6, r5	// r6=-dx
	str r6, [r4]	// dx=-dx
	
notfromleft:	
	ldr r4, =dx
	ldr r5, [r4] // r5=dx
	cmp r5, #0	// dx with 0
	bge larger
	mov	r6, #0
	sub r6, r5	// r6=-dx
	str r6, [r4]	// dx=-dx
	

	b donetouch	
	
//	else if (minX>=minY){
//			if (ballfromtop==1) 
//			{
//				if (dy>0) dy=-dy;
//			}
//			else if (ballfromtop==0)
//			{
//				if (dy<0) dy=-dy;
//			}
//		}	
larger:
	
	ldr r4, =ballfromtop
	ldr r5, [r4]	
	cmp r5, #1	// ballfromtop==1
	bne notfromtop
	ldr r4, =dy
	ldr r5, [r4] // r5=dy
	cmp r5, #0	// dy with 0
	ble donetouch
	mov	r6, #0
	sub r6, r5	// r6=-dy
	str r6, [r4]	// dy=-dy
	
notfromtop:	
	ldr r4, =dy
	ldr r5, [r4] // r5=dy
	cmp r5, #0	// dx with 0
	bge donetouch
	mov	r6, #0
	sub r6, r5	// r6=-dy
	str r6, [r4]	// dy=-dy
	
 donetouch:
	pop	{r4-r10,pc}
//--------------------------------------------------------
	

.section .data

.align 4

bl:	.int	0
br:	.int	0
bt:	.int	0
bb:	.int	0
 
brl: .int	0
brr: .int	0
brt: .int	0
brb: .int	0
leftarea: .int	0
rightarea: .int 0
toparea: .int 0
botarea: .int 0
ballfromleft: .int 0
minX: .int 0
minY: .int 0
ballfromtop: .int 0
