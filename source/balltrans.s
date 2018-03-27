//int reversex(int indexx){
//	int a=indexx/3;
//	return (originx+a*96);
 //}
// convert from index of brick in the array to the real x position
// ro has indexx
.global reversex1
reversex1:
	push	{r4-r10,lr}
	mov r1,#0
	mov r2, #3

	checkmultiple:
				add r1, #1
				mul r3, r1,r2
				cmp r0, r3  // r0 has indexx
				ble checkmultiple
				// after this, r1 is the result of a or a+1 ??
	mov r3, #96
	ldr r4, =originx
	ldr r5, [r4]    // r5=originx
	mul r1, r3  // r1= 96*a
	add r0, r5, r1
	
	pop	{r4-r10,pc}

//int reversey(int indexy){	 
//	return (originy+indexy*32);
// }
// convert from index in the array to the real y position

.global reversey1
reversey1:
	push	{r4-r10,lr}
	mov r3, #32
	ldr r4, =originy
	ldr r5, [r4]    // r5=originy
	mul r1, r3  // r1= 32*a
	add r0, r5, r1
	pop	{r4-r10,pc}
