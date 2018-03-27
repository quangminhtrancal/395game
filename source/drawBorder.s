.global drawBorder
drawBorder:
	push	{r4-r10,lr}

	x		.req	r4
	y		.req	r5

	ldr	r0, =xOrigin		//set xOrigin
	mov	r1, #50
	str	r1, [r0]
	ldr	r0, =yOrigin		//set yOrigin
	mov	r1, #50
	str	r1, [r0]
	ldr	r0, =windowHeight	//set WindowHeight
	mov	r1, #640
	str	r1, [r0]
	ldr	r0, =windowWidth	//set WindowWidth
	mov	r1, #960
	str	r1, [r0]

	ldr	r5, =xOrigin
	ldr	r6, [r5]
	sub	r6, #32
	mov	r0, r6
	ldr	r5, =yOrigin
	ldr	r6, [r5]
	sub	r6, #32
	mov	r1, r6
	mov	r2, #1			//TopLeftEdge
	bl	drawBorderElement

	ldr	r5, =xOrigin
	ldr	r6, [r5]
	ldr	r7, =windowWidth
	ldr	r8, [r7]
	add	r6, r8
	mov	r0, r6
	ldr	r5, =yOrigin
	ldr	r6, [r5]
	sub	r6, #32
	mov	r1, r6
	mov	r2, #2			//TopRightEdge
	bl	drawBorderElement


	ldr	r5, =xOrigin
	ldr	r6, [r5]
	sub	r6, #32
	mov	r0, r6
	ldr	r5, =yOrigin
	ldr	r6, [r5]
	ldr	r7, =windowHeight
	ldr	r8, [r7]
	add	r6, r8
	mov	r1, r6
	mov	r2, #3			//BottomLeftEdge
	bl	drawBorderElement



	ldr	r5, =xOrigin
	ldr	r6, [r5]
	ldr	r7, =windowWidth
	ldr	r8, [r7]
	add	r6, r8
	mov	r0, r6
	ldr	r5, =yOrigin
	ldr	r6, [r5]
	ldr	r7, =windowHeight
	ldr	r8, [r7]
	add	r6, r8
	mov	r1, r6
	mov	r2, #4			//BottomRightEdge
	bl	drawBorderElement


	ldr	r5, =xOrigin		//draw TopHorizontalBorder
	ldr	x, [r5]
	ldr	r5, =yOrigin
	ldr	y, [r5]
	sub	y, #32
	ldr	r7, =windowWidth
	ldr	r8, [r7]	

	mov	r6, x			
	add	r6, r8			//originX + windowWidth(x)

drawTopHorizontal:
	cmp	x, r6			// draw 6 times
	bge	doneTopHorizontal

	mov	r0, x			//horizontalBorderX
	mov	r1, y			//horizontalBorderY
	mov	r2, #5			//borderType (TopHorizontal)
	bl	drawBorderElement

	add	x, #160
	b	drawTopHorizontal

doneTopHorizontal:

	ldr	r5, =xOrigin		//draw BottomHorizontalBorder
	ldr	x, [r5]
	ldr	r5, =yOrigin
	ldr	y, [r5]
	ldr	r7, =windowHeight
	ldr	r8, [r7]
	add	y, r8		
	add	r6, r8			
	mov	r6, x

	ldr	r7, =windowWidth
	ldr	r8, [r7]
	mov	r6, x			
	add	r6, r8

drawBottomHorizontal:
	cmp	x, r6			// draw 6 times
	bge	doneBottomHorizontal

	mov	r0, x			//horizontalBorderX
	mov	r1, y			//horizontalBorderY
	mov	r2, #5			//borderType (BottomHorizontal)
	bl	drawBorderElement

	add	x, #160
	b	drawBottomHorizontal

doneBottomHorizontal:

	ldr	r5, =xOrigin		//draw LeftVerticalBorder
	ldr	x, [r5]
	sub	x, #32
	ldr	r5, =yOrigin
	ldr	y, [r5]

	ldr	r7, =windowHeight
	ldr	r8, [r7]
	mov	r6, x			
	add	r6, r8

drawLeftVertical:
	cmp	y, r6			// draw 4 times
	bge	doneLeftVertical

	mov	r0, x			
	mov	r1, y			
	mov	r2, #6			//draw LeftVerticalBorder
	bl	drawBorderElement

	add	y, #160
	b	drawLeftVertical

doneLeftVertical:

	ldr	r5, =xOrigin		//draw RightVerticalBorder
	ldr	x, [r5]
	ldr	r7, =windowWidth
	ldr	r8, [r7]
	add	x, r8

	ldr	r5, =yOrigin
	ldr	y, [r5]

	ldr	r7, =windowHeight 	
	ldr	r8, [r7]
	mov	r6, y			
	add	r6, r8


drawRightVertical:
	cmp	y, r6			// draw 4 times
	bge	doneRightVertical

	mov	r0, x			//edgeX
	mov	r1, y			//edgeY
	mov	r2, #6			//draw RightVerticalBorder
	bl	drawBorderElement

	add	y, #160
	b	drawRightVertical

doneRightVertical:
	pop	{r4-r10,pc}


.global drawBorderElement
drawBorderElement:
	push	{r4-r10,lr}

	x		.req	r4
	y		.req	r5
	borderWidth	.req	r6
	borderHeight	.req	r7
	i		.req	r8
	j		.req	r9
	cOffset		.req	r10

	mov	x, r0
	mov	y, r1

	ldr	r0, =borderType
	str	r2, [r0]

	cmp	r2, #5
	beq	hBorder

	cmp	r2, #6
	beq	vBorder

	mov	borderWidth, #32
	mov	borderHeight, #32
	b	drawElement

hBorder:
	mov	borderWidth, #160
	mov	borderHeight, #32
	b	drawElement

vBorder:
	mov	borderWidth, #32
	mov	borderHeight, #160

drawElement:
	mov	cOffset, #0
	mov	i, #0

outerLoopEdge:
	cmp	i, borderHeight
	beq	exitOuterLoopEdge

	mov	j, #0

innerLoopEdge:
	cmp	j, borderWidth
	beq	exitInnerLoopEdge

	mov	r0, cOffset
	ldr	r2, =borderType
	ldr	r1, [r2]
	bl	return_edge

	mov	r2, r0
	add	r0, x, j
	add	r1, y, i

	bl	DrawPixel

	add	cOffset, #4

	add	j, #1
	b	innerLoopEdge

exitInnerLoopEdge:
	add	i, #1
	b	outerLoopEdge	

exitOuterLoopEdge:

	pop	{r4-r10,pc}





// Take r0 as the offset for the image color location
.global return_edge

return_edge:
	push	{r4-r10, lr}

	mov	r5, r0
	
topLeft:
	cmp	r1, #1
	bne	topRight

	ldr	r4, =edgeTL
	b	elementSelected

topRight:
	cmp	r1, #2
	bne	bottomLeft

	ldr	r4, =edgeTR
	b	elementSelected

bottomLeft:
	cmp	r1, #3
	bne	bottomRight

	ldr	r4, =edgeBL
	b	elementSelected

bottomRight:
	cmp	r1, #4
	bne	horizontal

	ldr	r4, =edgeBR
	b	elementSelected

horizontal:
	cmp	r1, #5
	bne	vertical

	ldr	r4, =borderH
	b	elementSelected

vertical:
	cmp	r1, #6
	bne	elementSelected

	ldr	r4, =borderV
	b	elementSelected

elementSelected:
	ldr	r0, [r4,r5]
	
	pop	{r4-r10, pc}



.section .data

.align 4
.global borderType, xOrigin, yOrigin, windowHeight, windowWidth, edgeWidth
.global edgeHeight, hBorderHeight, hBorderHeight
borderType:	.int	4
xOrigin:	.int	4
yOrigin:	.int	4
windowHeight:	.int	4
windowWidth:	.int	4
edgeWidth:	.int	4
edgeHeight:	.int	4
hBorderHeight:	.int	4
vBorderHeight:	.int	4