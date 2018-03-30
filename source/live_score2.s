.global drawLivelabel
drawLivelabel:
	push	{r4-r10,lr}
	
	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD0:
	cmp	i, #32
	beq	exitOuterLoopD0

	mov	j, #0

innerLoopD0:
	cmp	j, #96
	beq	exitInnerLoopD0

	mov	r0, cOffset
	bl	return_score

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD0

exitInnerLoopD0:
	add	i, #1
	b	outerLoopD0
	

exitOuterLoopD0:

	pop	{r4-r10,pc}
////------------------------------

.global drawScorelabel
drawScorelabel:
	push	{r4-r10,lr}
	
	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD0:
	cmp	i, #32
	beq	exitOuterLoopD0

	mov	j, #0

innerLoopD0:
	cmp	j, #96
	beq	exitInnerLoopD0

	mov	r0, cOffset
	bl	return_score

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD0

exitInnerLoopD0:
	add	i, #1
	b	outerLoopD0
	

exitOuterLoopD0:

	pop	{r4-r10,pc}
//--------------------------------------



.global Drawnum
Drawnum:
	push	{r4-r10,lr}
	
	

	num		.req	r4
	x		.req	r5
	y		.req    r6

	mov	num, r0		// num = r0
	mov	x, r1		// x = r1
	mov y, r2		// y = r2
	
	
if0:
	cmp r4, #0
	bne if1
	
	mov r0, r5		// moving r5(x) into r0
	mov r1, r6		// movingg r6(Y) into r1

	bl Draw0
	
if1:
	cmp r4, #0
	bne if2
	
	mov r0, r5		// moving r5(x) into r0
	mov r1, r6		// movingg r6(Y) into r1

	bl Draw1
if2:
	cmp r4, #0
	bne if3
	
	mov r0, r5		// moving r5(x) into r0
	mov r1, r6		// movingg r6(Y) into r1

	bl Draw2
	
if3:
	cmp r4, #0
	bne if4
	
	mov r0, r5		// moving r5(x) into r0
	mov r1, r6		// movingg r6(Y) into r1

	bl Draw3	
if4:
	cmp r4, #0
	bne if5
	
	mov r0, r5		// moving r5(x) into r0
	mov r1, r6		// movingg r6(Y) into r1

	bl Draw4		

if5:
	cmp r4, #0
	bne if6
	
	mov r0, r5		// moving r5(x) into r0
	mov r1, r6		// movingg r6(Y) into r1

	bl Draw5		
if6:
	cmp r4, #0
	bne if7
	
	mov r0, r5		// moving r5(x) into r0
	mov r1, r6		// movingg r6(Y) into r1

	bl Draw6
if7:
	cmp r4, #0
	bne if8
	
	mov r0, r5		// moving r5(x) into r0
	mov r1, r6		// movingg r6(Y) into r1

	bl Draw7
if8:
	cmp r4, #0
	bne if9
	
	mov r0, r5		// moving r5(x) into r0
	mov r1, r6		// movingg r6(Y) into r1

	bl Draw8

if9:
	cmp r4, #0
	bne exit
	
	mov r0, r5		// moving r5(x) into r0
	mov r1, r6		// movingg r6(Y) into r1

	bl Draw9							
exit:
	pop	{r4-r10,pc}
	
//-------------------------------------------------------------------------------------------	
.global Draw0
Draw0:
	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD0:
	cmp	i, #32
	beq	exitOuterLoopD0

	mov	j, #0

innerLoopD0:
	cmp	j, #32
	beq	exitInnerLoopD0

	mov	r0, cOffset
	bl	return_zero

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD0

exitInnerLoopD0:
	add	i, #1
	b	outerLoopD0
	

exitOuterLoopD0:

	pop	{r4-r10,pc}
	
//-------------------------------------------------------------------------------------------	

.global Draw1
Draw1:
	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD1:
	cmp	i, #32
	beq	exitOuterLoopD1

	mov	j, #0

innerLoopD1:
	cmp	j, #32
	beq	exitInnerLoopD1

	mov	r0, cOffset
	bl	return_one

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD1

exitInnerLoopD1:
	add	i, #1
	b	outerLoopD1
	

exitOuterLoopD1:

	pop	{r4-r10,pc}
	
//-------------------------------------------------------------------------------------------	

.global Draw2
Draw2:
	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD2:
	cmp	i, #32
	beq	exitOuterLoopD2

	mov	j, #0

innerLoopD2:
	cmp	j, #32
	beq	exitInnerLoopD2

	mov	r0, cOffset
	bl	return_two

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD2

exitInnerLoopD2:
	add	i, #1
	b	outerLoopD2
	

exitOuterLoopD2:

	pop	{r4-r10,pc}
	
//-------------------------------------------------------------------------------------------	
.global Draw3
Draw3:
	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD3:
	cmp	i, #32
	beq	exitOuterLoopD3

	mov	j, #0

innerLoopD3:
	cmp	j, #32
	beq	exitInnerLoopD3

	mov	r0, cOffset
	bl	return_three

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD3

exitInnerLoopD3:
	add	i, #1
	b	outerLoopD3
	

exitOuterLoopD3:

	pop	{r4-r10,pc}
	
//-------------------------------------------------------------------------------------------	
.global Draw4
Draw4:
	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD4:
	cmp	i, #32
	beq	exitOuterLoopD4

	mov	j, #0

innerLoopD4:
	cmp	j, #32
	beq	exitInnerLoopD4

	mov	r0, cOffset
	bl	return_four

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD4

exitInnerLoopD4:
	add	i, #1
	b	outerLoopD4
	

exitOuterLoopD4:

	pop	{r4-r10,pc}
	
//-------------------------------------------------------------------------------------------	
.global Draw5
Draw5:
	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD5:
	cmp	i, #32
	beq	exitOuterLoopD5

	mov	j, #0

innerLoopD5:
	cmp	j, #32
	beq	exitInnerLoopD5

	mov	r0, cOffset
	bl	return_five

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD5

exitInnerLoopD5:
	add	i, #1
	b	outerLoopD5
	

exitOuterLoopD5:

	pop	{r4-r10,pc}
	
//-------------------------------------------------------------------------------------------	
.global Draw6
Draw6:
	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD6:
	cmp	i, #32
	beq	exitOuterLoopD6

	mov	j, #0

innerLoopD6:
	cmp	j, #32
	beq	exitInnerLoopD6

	mov	r0, cOffset
	bl	return_six

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD6

exitInnerLoopD6:
	add	i, #1
	b	outerLoopD6
	

exitOuterLoopD6:

	pop	{r4-r10,pc}
	
//-------------------------------------------------------------------------------------------
.global Draw7
Draw7:
	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD7:
	cmp	i, #32
	beq	exitOuterLoopD7

	mov	j, #0

innerLoopD7:
	cmp	j, #32
	beq	exitInnerLoopD7

	mov	r0, cOffset
	bl	return_seven

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD7

exitInnerLoopD7:
	add	i, #1
	b	outerLoopD7
	

exitOuterLoopD7:

	pop	{r4-r10,pc}
	
//-------------------------------------------------------------------------------------------	

	
.global Draw8
Draw8:
	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD8:
	cmp	i, #32
	beq	exitOuterLoopD8

	mov	j, #0

innerLoopD8:
	cmp	j, #32
	beq	exitInnerLoopD8

	mov	r0, cOffset
	bl	return_eight

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD8

exitInnerLoopD8:
	add	i, #1
	b	outerLoopD8
	

exitOuterLoopD8:

	pop	{r4-r10,pc}
	
//-------------------------------------------------------------------------------------------	
.global Draw9
Draw9:
	push	{r4-r10,lr}
	
	
	

	x		.req	r4
	y		.req	r5
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0		// x = r4
	mov	y, r1		// y = r5


	mov	cOffset, #0		// cOffset = r10
	mov	i, #0			// i - 0 

outerLoopD9:
	cmp	i, #32
	beq	exitOuterLoopD9

	mov	j, #0

innerLoopD9:
	cmp	j, #32
	beq	exitInnerLoopD9

	mov	r0, cOffset
	bl	return_nine

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopD9

exitInnerLoopD9:
	add	i, #1
	b	outerLoopD9
	

exitOuterLoopD9:

	pop	{r4-r10,pc}
	
//-------------------------------------------------------------------------------------------	


 
 .global drawScore
drawScore:
	push	{r4-r10,lr}
	

intnum0:
	ldr r1, =scores		// load value of scores to r1
	ldr r4, [r1]		// load value of scores to r4
	
	and r4, r4, #10		// scores % 10  store the value in to r4  ( only works for non negative value)

intnum1:
	
	ldr r1, =scores		// load value of scores to r1
	ldr r4, [r1]		// load value of scores to r4
	mov r10, #10

	SDIV r5, r4, r10		// 	int num1=scores/10;


drawnum1:

	ldr r1, =originx		// load value of originx to r1
	ldr r6, [r1]		// load value of originx to r6
	add r6, r6,#384
	
	ldr r1, =originy		// load value of originy to r1
	ldr r7, [r1]		// load value of originy to r7

	mov r0, r5 		// r0 = num1
	mov r1, r6		// r1 = originx+384
	mov r2, r7		// r2 = originy
	
	bl Drawnum
	
	
	
drawnum2:

	ldr r1, =originx		// load value of originx to r1
	ldr r6, [r1]		// load value of originx to r6
	add r6, r6, #416
	
	ldr r1, =originy		// load value of originy to r1
	ldr r7, [r1]		// load value of originy to r7
	
	mov r0, r4
	mov r1, r6
	mov r2, r7

exit:
	pop	{r4-r10,pc}
	







