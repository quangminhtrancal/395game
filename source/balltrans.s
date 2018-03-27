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

.global reversey
reversey:
	push	{r4-r10,lr}
 

	pop	{r4-r10,pc}



.global reversey
reversey:
	push	{r4-r10,lr}
 

	pop	{r4-r10,pc}


.global reversey
reversey:
	push	{r4-r10,lr}
 

	pop	{r4-r10,pc}



.global reversey
reversey:
	push	{r4-r10,lr}
 

	pop	{r4-r10,pc}


.global reversey
reversey:
	push	{r4-r10,lr}
 

	pop	{r4-r10,pc}
 

 

 
 
 
