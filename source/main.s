
@ Code section
.section .text

.global main
main:
	@ ask for frame buffer information
	ldr 		r0, =frameBufferInfo 	@ frame buffer information structure
	bl		initFbInfo

	bl		initSnes
	

	//bl		Draw		@ Draw picture 16x16
	
	//ldr	r0, =Notification
	//bl printf
	
	// left:  1111111110111111
	// right: 1111111101111111
	
	bl draw

	@ stop
	haltLoop$:
		b	haltLoop$

.globl te
te:
	push {lr}
	mov r1, #1
	mov r2, #2
	ldr r0, =testMsg
	bl printf
	pop {pc}

@ Data section
.section .data

.align 


.globl frameBufferInfo
frameBufferInfo:
	.int	0		@ frame buffer pointer
	.int	0		@ screen width
	.int	0		@ screen height

.align 4

testMsg:
.asciz		"Test: %x %x\n"

Notification:
.asciz		"Pressed\n"
