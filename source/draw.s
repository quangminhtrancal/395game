
@ Code section
.section .text

@ Draw Pixel
@  r0 - x
@  r1 - y
@  r2 - colour

.global DrawPixel

DrawPixel:
	push		{r4-r9}

	offset		.req	r4

	ldr		r5, =frameBufferInfo	

	@ offset = (y * width) + x
	
	ldr		r3, [r5, #4]		@ r3 = width
	mul		r1, r3
	add		offset,	r0, r1
	
	@ offset *= 4 (32 bits per pixel/8 = 4 bytes per pixel)
	lsl		offset, #2

	@ store the colour (word) at frame buffer pointer + offset
	ldr		r0, [r5]		@ r0 = frame buffer pointer
	str		r2, [r0, offset]

	pop		{r4-r9}
	bx		lr



@ Data section
.section .data

.align 4
image:	.word 0