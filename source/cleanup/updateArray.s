@ updateArray(x, y, type)
@ types:
@	0 = no element
@	1 = paddle
@	2 = ball
@	6 = white brick
@	7 = green brick
@	8 = red brick
.global updateArray
updateArray:
	push	{r4-r10, lr}

	x		.req	r4
	y		.req	r5
	type		.req	r6
	i		.req	r7
	loopCounter	.req	r8


	mov	x, r0
	mov	y, r1
	mov	type, r2

	cmp 	x, #32
	ble	storeComplete

	cmp	y, #32
	ble	storeComplete

	sub	x,#32
	sub	y,#32

	lsr	x, #5
	lsr	y, #5

	cmp	type, #0		//no element
	moveq	i, #1

	cmp	type, #1		//paddle
	moveq	i, #4

	cmp	type, #2		//ball
	moveq	i, #1
	
	cmp	type, #6		//white brick
	moveq	i, #3
	
	cmp	type, #7		//green brick
	moveq	i, #3

	cmp	type, #8		//red brick
	moveq	i, #3

	mov	r2, y
	lsl	r2, #5
	sub	r2, y
	sub	r2, y
	add	r2, x
	lsl	r2, #2

	mov	r1, r2
	mov	loopCounter, #0
	
storeType:

	cmp	loopCounter, i
	beq	storeComplete	

	ldr	r1, =gamearray
	str	type, [r1, r2]

	add	loopCounter, #1
	add	r2, #4

	b	storeType

storeComplete:

	pop	{r4-r10, pc}

.global deleteFromArray
deleteFromArray:
	push	{r4-r10, lr}

	x		.req	r4
	y		.req	r5
	type		.req	r6
	i		.req	r7
	loopCounter	.req	r8

	mov	x, r0
	mov	y, r1
	mov	type, r2

	cmp 	x, #32
	ble	deleteComplete

	cmp	y, #32
	ble	deleteComplete

	sub	x,#32
	sub	y,#32

	lsr	x, #5
	lsr	y, #5

	cmp	type, #0		//no element
	moveq	i, #1

	cmp	type, #1		//paddle
	moveq	i, #4

	cmp	type, #2		//ball
	moveq	i, #1
	
	cmp	type, #6		//white brick
	moveq	i, #3
	
	cmp	type, #7		//green brick
	moveq	i, #3

	cmp	type, #8		//red brick
	moveq	i, #3

	mov	r2, y
	lsl	r2, #5
	sub	r2, y
	sub	r2, y
	add	r2, x
	lsl	r2, #2

	mov	r1, r2
	mov	loopCounter, #0
	mov	type, #0
	
deleteType:

	cmp	loopCounter, i
	beq	deleteComplete	

	ldr	r1, =gamearray
	str	type, [r1, r2]

	add	loopCounter, #1
	add	r2, #4

	b	deleteType

deleteComplete:

	pop	{r4-r10, pc}


.section .data
.align	4

test:
.asciz "TEST NUM: %d\n"
