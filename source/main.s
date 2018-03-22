
@ Code section
.section .text

.global main
main:
	@ ask for frame buffer information
	ldr 		r0, =frameBufferInfo 	@ frame buffer information structure
	bl		initFbInfo

	bl		initSnes
	


	bl begingame
	//bl draw

	@ stop
	haltLoop$:
		b	haltLoop$


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
