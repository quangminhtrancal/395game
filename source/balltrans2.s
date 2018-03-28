//----------void checkcollision_ballpaddle()
	 
.global checkcollision_ballpaddle
checkcollision_ballpaddle:
	push	{r4-r10,lr}
	ldr r4, =triggerbigpaddle
	ldr r5, [r4]	// r5= triggerbigpaddle
	cmp r5, #0
	bne	largepaddle
	ldr	r4, =plength
	mov r5, #128
	str r5, [r4] //plength=128
	ldr	r4, =firstseg
	mov r5, #20
	str r5, [r4] //firstseg=20
	ldr	r4, =midseg
	mov r5, #64
	str r5, [r4] //midseg=64
	b calculate
largepaddle:
	ldr	r4, =plength
	mov r5, #192
	str r5, [r4] //plength=192
	ldr	r4, =firstseg
	mov r5, #28
	str r5, [r4] //firstseg=28
	ldr	r4, =midseg
	mov r5, #96
	str r5, [r4] //midseg=96

calculate:

// 		pl=paddlex;
//		pr=paddlex+plength;
//		pt=paddley;
//		pb=paddley+32;
	 
//	 bl=ballx;
//	 br=ballx+32;
//	 bt=bally;
//	 bb=bally+32;
	ldr r4, =paddlex
	ldr r5, [r4]	//r5=paddlex
	ldr r4, =pl
	str r5, [r4]	//pl =paddlex
	ldr r4, =paddlex
	ldr r5, [r4]	//r5=paddlex
	ldr r4, =plength
	ldr r6, [r4]	//r6=plength
	add r6, r5		// r6=paddlex+plength
	ldr r4, =pr
	str r6, [r4]	//pr =paddlex+plength
	ldr r4, =paddley
	ldr r5, [r4]	//r5=paddley
	ldr r4, =pt
	str r5, [r4]	//pt =paddley
	
	ldr r4, =paddley
	ldr r5, [r4]	//r5=paddley
	mov r7, #32
	add r5, r7		// r5= paddley+32
	ldr r4, =pb
	str r5, [r4]	//pb =paddley+32
	
	ldr r4, =ballx
	ldr	r5, [r4]	// r5= ballx
	ldr r4, =bl
	str r5, [r4]	// bl=ballx
	
	ldr r4, =ballx
	ldr r5, [r4]	//r5=ballx
	mov r7, #32
	add r5, r7		// r5= ballx+32
	ldr r4, =br
	str r5, [r4]	//br =ballx+32

	ldr r4, =bally
	ldr	r5, [r4]	// r5= bally
	ldr r4, =bt
	str r5, [r4]	// bt=bally
	
	ldr r4, =bally
	ldr r5, [r4]	//r5=bally
	mov r7, #32
	add r5, r7		// r5= bally+32
	ldr r4, =bb
	str r5, [r4]	//br =bally+32
	
// check if touching if ((pr >= bl)&&(pl <= br)&&(pb>=bt)&&(pt<=bb)){

	ldr r0, =pr
	ldr r7, [r0]	// r7=pr
	ldr r0, =bl
	ldr r8, [r0]	// r8=bl
	cmp r7, r8
	blt donetouch
	ldr r0, =pl
	ldr r7, [r0]	// r7=pl
	ldr r0, =br
	ldr r8, [r0]	// r8=br
	cmp r7, r8
	bgt donetouch
	
	ldr r0, =pb
	ldr r7, [r0]	// r7=pb
	ldr r0, =bt
	ldr r8, [r0]	// r8=bt
	cmp r7, r8
	blt donetouch
	
	ldr r0, =pt
	ldr r7, [r0]	// r7=brt
	ldr r0, =bb
	ldr r8, [r0]	// r8=bb
	cmp r7, r8
	bgt donetouch
	// touch then change direction
//			dy=-dy;
//		if ((ballx+16)<(paddlex+midseg)) {
//			if (dx>0) dx=-dx;
//		}
//		else{
//			if (dx<0) dx=-dx;
//		}
	ldr r4, =dy
	ldr r5, [r4]	// r5=dy
	mov r6, #0
	sub r6, r5
	str	r6, [r4]	// dy= -dy
	ldr r4, =ballx
	ldr r5, [r4]	//r4=ballx
	mov r4, #16
	add r5, r4		// r5=ballx+16
	
	ldr r4, =paddlex
	ldr r6, [r4]	// r6=paddlex
	ldr r4, =midseg
	ldr r7, [r4]	// r7=midseg
	add r6, r7		// r6=paddlex+midseg
	cmp r5, r6
	bge touch_at_right
	ldr r4, =dx
	ldr r5, [r4]
	cmp r5, #0
	ble degree
	ldr r4, =dx
	ldr r5, [r4] //r5=dx
	mov r6, #0
	sub r6, r5 	// r6=-dx
	str r6, [r4]	// dx=-dx
	b degree
touch_at_right:
	ldr r4, =dx
	ldr r5, [r4]
	cmp r5, #0
	bge degree
	ldr r4, =dx
	ldr r5, [r4] //r5=dx
	mov r6, #0
	sub r6, r5 	// r6=-dx
	str r6, [r4]	// dx=-dx

degree:
//			if ((bl<(pl+firstseg))||(bl>(pl+firstseg+midseg)))  // check if collision is at the edge 45
//		{
//					if (dy>0) dy=ang_valu;
//					else dy=-ang_valu;
//		}
//		else if(((bl>(pl+firstseg))&&(bl<(pl+firstseg+midseg)))){  // check if collision is at the middle 60
//	}
//		}
		ldr r4, =bl
		ldr r5, [r4]	//r5=bl
		ldr r4, =pl
		ldr r6, [r4]	//r6=pl
		ldr r4, =firstseg
		ldr r7, [r4]	//r7=firstseg
		add r6, r7		// r6=pl+firstseg
		cmp r5, r6
		ble at_edge
		
		ldr r4, =bl
		ldr r5, [r4]	//r5=bl
		ldr r4, =pl
		ldr r6, [r4]	//r6=pl
		ldr r4, =firstseg
		ldr r7, [r4]	//r7=firstseg
		ldr r4, =midseg
		ldr r8, [r4]	//r7=midseg
		add r6, r7		// r6=pl+firstseg
		add r6, r8		// r6=pl+firstseg+midseg
		cmp r5, r6
		bge at_edge
		
//				if (startthisgame==0) {
//					startthisgame=1;
//					if (dy>0) dy=ang_valu;
//					else dy=-ang_valu;

//				}
				// the next one get 60 degree
//				else{
//					if (dy>0) dy=ang_valu+1;
//					else dy=-ang_valu-1;



		ldr r4, =startthisgame
		ldr r5, [r4]
		cmp r5, #0
		bne degree60
		mov r6, #1
		str r6, [r4]	//startthisgame=1
		ldr r4, =dy
		ldr r5, [r4]	// r5=dy
		cmp r5, #0
		ble con1
		ldr r4, =ang_valu
		ldr r6, [r4]	// r6= ang_valu
		ldr r4, =dy
		str r6, [r4]	// dy=ang_valu
		b donetouch
con1:		
		ldr r4, =ang_valu
		ldr r6, [r4]	// r6= ang_valu
		mov r7, #0
		sub r7, r6		// r7=-ang_valu
		ldr r4, =dy
		str r7, [r4]	// dy=-ang_valu
		
		b donetouch
degree60:
		ldr r4, =dy
		ldr r5, [r4]	// r5=dy
		cmp r5, #0
		ble con2
		ldr r4, =ang_valu
		ldr r6, [r4]	// r6= ang_valu
		mov r7, #1
		add r6, r7		// r6= ang_valu+1
		ldr r4, =dy
		str r6, [r4]	// dy=ang_valu+1
		b donetouch		
con2:		
		ldr r4, =ang_valu
		ldr r6, [r4]	// r6= ang_valu
		mov r7, #0
		sub r7, r6		// r7=-ang_valu
		mov r8, #-1
		add r7, r8		//r7=-ang_valu-1
		ldr r4, =dy
		str r7, [r4]	// dy=-ang_valu-1		
		b donetouch		
		
		// ---------check for dx
//					if (dx>0) dx=ang_valu-1;
//					else dx=-ang_valu+1;		

		ldr r4, =dx
		ldr r5, [r4]	// r5=dx
		cmp r5, #0
		ble con3
		ldr r4, =ang_valu
		ldr r6, [r4]	// r6= ang_valu
		mov r7, #-1
		add r6, r7		// r6= ang_valu-1
		ldr r4, =dx
		str r6, [r4]	// dx=ang_valu-1
		b donetouch		
con3:		
		ldr r4, =ang_valu
		ldr r6, [r4]	// r6= ang_valu
		mov r7, #0
		sub r7, r6		// r7=-ang_valu
		mov r8, #1
		add r7, r8		//r7=-ang_valu+1
		ldr r4, =dx
		str r7, [r4]	// dx=-ang_valu+1	
		b donetouch
		
at_edge:		
//					if (dy>0) dy=ang_valu;
//					else dy=-ang_valu;
//					if (dx>0) dx=ang_valu;
//					else dx=-ang_valu;

		ldr r4, =dy
		ldr r5, [r4]	// r5=dy
		cmp r5, #0
		ble con4
		ldr r4, =ang_valu
		ldr r6, [r4]	// r6= ang_valu
		ldr r4, =dy
		str r6, [r4]	// dy=ang_valu
		b donetouch		
con4:		
		ldr r4, =ang_valu
		ldr r6, [r4]	// r6= ang_valu
		mov r7, #0
		sub r7, r6		// r7=-ang_valu
		ldr r4, =dy
		str r7, [r4]	// dy=-ang_valu+1	
		b donetouch
		
		ldr r4, =dx
		ldr r5, [r4]	// r5=dx
		cmp r5, #0
		ble con5
		ldr r4, =ang_valu
		ldr r6, [r4]	// r6= ang_valu
		ldr r4, =dx
		str r6, [r4]	// dx=ang_valu
		b donetouch		
con5:		
		ldr r4, =ang_valu
		ldr r6, [r4]	// r6= ang_valu
		mov r7, #0
		sub r7, r6		// r7=-ang_valu
		ldr r4, =dx
		str r7, [r4]	// dx=-ang_valu
		b donetouch
		
donetouch:	
	
	pop	{r4-r10,pc}

.section .data

.align 4

bl:	.int	0
br:	.int	0
bt:	.int	0
bb:	.int	0
 
pl: .int	0
pr: .int	0
pt: .int	0
pb: .int	0
plength: .int	0
firstseg: .int	0
midseg: .int	0 	 

