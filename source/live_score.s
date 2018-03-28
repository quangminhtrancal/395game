 //void updatescores(){
//	int count=0; // count white bricks
//	for (int j=0;j<30;j=j+3){
//		if (gamearray[3][j]==6){ count+=1;
//		}
//		if (gamearray[2][j]==7){ count+=1;
//		}
//		if (gamearray[1][j]==8){ count+=1;
//		}
		//int total=count6+2*count7+3*count8;
//		scores=30-count;
		
//	}
//}

.global updatescores
updatescores:
	push	{r4-r10,lr}
	mov		r4, #0	// r4= index
	mov		r5, #0	// r5=j

	// index = y*width +x
	//gamearray[3][j]  -> index=3*30+j
	mov	r6, #360
	mov r7, #240
	mov r8, #120
	mov	r10, #0	// count=0;

loop1:	
	
	add r6, r4
	add r7, r4
	add r8, r4
	ldr	r0, =gamearray
	ldr	r9, [r0,r6]
	cmp	r9, #6
	addeq r10,#1
	
	ldr	r0, =gamearray
	ldr	r9, [r0,r7]
	cmp	r9, #7
	addeq r10,#1
	
	ldr	r0, =gamearray
	ldr	r9, [r0,r8]
	cmp	r9, #8
	addeq r10,#1
	
	add r5, #3
	mov r4, #12
	cmp 	r5, #30
	blt	loop1
	
	// r2=scores; r10=count
	mov r3, #30
	sub r3, r10
	ldr	r1, =scores
	str r3, [r1]	// update scores
	
	pop	{r4-r10,pc}

.global increase_score
increase_score:
	push	{r4-r10,lr}
	ldr r4, =scores
	ldr	r5, [r4]
	add r5, #1
	str r5, [r4]
	pop	{r4-r10,pc}


.section .data

.align 4

count: .int 0
