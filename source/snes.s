@Minh Tran 	30017773
@Johnathan Kim 	30008039
@Zia Rehman	10145002




@ Code section
.section    .text

.global initSnes



initSnes: 

	push {lr}
	gBase		.req	r7		@ gBase = GPIO Base Address	

	//ldr     	r0, =creators 		@ Address of Creators string
	//bl 		printf  			@ printf(creators)
	
	bl		getGpioPtr		@ returns GPIO Base Address
	ldr		r1, =gpioBaseAddress	@ Address of variable (gpioBaseAddress)
	str		r0, [r1]		@ GPIO Base Address

	ldr		r0, =gpioBaseAddress	@ ddress of variable (gpioBaseAddress)
	ldr		gBase, [r0]		@ gBase = GPIO Base Address

	mov		r1, #1			@ function code (output)
	mov		r2, #9			@ pin #9
	bl		initGpio

	mov		r1, #0			@ function code (input)
	mov		r2, #10			@ pin #10
	bl		initGpio

	mov		r1, #1			@ function code (output)
	mov		r2, #11			@ pin #11
	bl		initGpio
	

    pop	{pc}
    


    
/////////////////////////////    
/*
    
    	ldr 		r0, =prompt		@ print the prompt 
	bl 		printf
	
	bl  		readSnes   		@ reads the SNES controller
    	mov 		r5, r0			@ r5 =  buttons pressed by user
    	bl  		showPressed		@ showPressed(buttons pressed by user)
    
    
    

ask:
      
	mov 		r0 , #50000		@ delay program for 50, 000 ms
	bl 		delayMicroseconds 	
	bl  		readSnes		@ reads the SNES controller
	cmp 		r5, r0			@ compare buttons pressed with the previous set

	beq 		ask			@ loop back to ask label
	mov 		r5, r0			@ buttons that were pressed by user
	bl  		showPressed   		@ showPressed(buttons pressed by user)
	
	

	cmp		r1, #3			@ checks if terminate was pressed
	beq		end			@ exit, if so
	
	b		ask

end:
	.unreq 		gBase
haltLoop$:  
	b       	haltLoop$
*/


@ intitGpio(gpioBaseAddress, ioFunc, pinNum) Initializes PINS  ---------------------------------------------------
initGpio:

	push		{r4,r5,lr}		@ push r4, r5 and Link Register onto Stack
	
	ldr		r5, =gpioBaseAddress	@ Address of variable (gpioBaseAddress)
	ldr		r0, [r5]		@ GPIO Base Address
	
iLoop:

	cmp		r2, #9			@ check if pin number is greater than 9		
	subhi		r2, #10			@ if so, subtract pin number by 10
	addhi		r0, #4			@ and add 4 to the base address
	bhi		iLoop			@ and loop back to iLoop

	add		r2, r2, lsl #1		@ get the offset of pin bits
	lsl		r1, r2			@ shift the function by the offset

	mov		r3, #7			@ bit mask
	lsl		r3, r2			@ shift bitmask by the pin offset

	ldr		r2, [r0]		@ load GPSELx register

	bic		r2, r3			@ clear appropriate bits
	orr 		r2, r1			@ set the function bits


	str		r2, [r0]		@ update GPSELx register
	
	pop 		{r4,r5,pc}		@ pop r4, r5 and Link Register off Stack

	
@ toggleLatch(boolean val) Sets or clears the latch, depending on input parameter(r1) -----------------------
toggleLatch:
	push 		{r4,r5,lr}		@ push r4, r5 and Link Register onto Stack
	mov		r0, #9			@ r0 = 9
	ldr 		r4, =gpioBaseAddress	
	ldr		r5, [r4]			@ r5 = [gpioBaseAddress]
	mov 		r3, #1			
	lsl 		r3, r0			@ shift r3 by 9 to align with pin 9
	teq		r1, #0				
	streq 		r3, [r5, #40]		@ GPCLR0 pin 9 is cleared
	strne 		r3, [r5, #28]		@ GPSET0 pin 9 is set
	
	pop 		{r4,r5,pc}		@ pop r4, r5 and Link Register off Stack


@ toggleClock(boolean val) Sets or clears the clock, depending on input parameter(r1) -----------------------
toggleClock:
	push		{r4, r5,lr}		@ push r4, r5 and Link Register onto Stack
	mov		r0,	#11		@ r0 = 11
	ldr		r4, =gpioBaseAddress	
	ldr		r5, [r4]		
	mov		r3, #1			
	lsl		r3, r0					@ shift r3 by 11 to align with pin 11
	teq		r1, #0			
	streq		r3, [r5, #40]		@ GPCLR0 pin 11 is cleared
	strne		r3, [r5, #28]		@ GPSET0 pin 11 is set
	
	pop		{r4,r5,pc}		@ pop r4, r5 and Link Register off Stack

@ Read_Data() -----------------------------------------------------------------------------------------------
Read_Data:

	push		{r4,r5,lr}		@ push r4, r5 and Link Register onto Stack
	mov		r0, #10			@ r0 = 10

	ldr		r4, =gpioBaseAddress	
	ldr		r5, [r4]		

	ldr		r1, [r5,#52]		@ GPLEV0 address

	mov		r3, #1			
	lsl		r3, r0			@ shift r3 by 10 to align with pin 10
	and		r1, r3			

	teq		r1, #0				@ r1 == 0?
	moveq		r0, #0			@ If yes, return 0
	movne		r0, #1			@ Else, return 1
	pop 		{r4,r5,pc}		@ pop r4, r5 and Link Register off Stack


@ readSnes() -----------------------------------------------------------------------------------------------
  // Return value in r0 for which button is pressed if 0 then pressed
 
 .global readSnes
 
readSnes:
	push		{r4, r5, lr}   		@ push r4, r5 and Link Register onto Stack
	mov		r5, #0    		@ reset pushed button values

	mov		r1, #1			
	bl		toggleLatch		@ toggleLatch(1)

	mov		r1, #1			
	bl		toggleClock		@ toggleClock(1)

	mov		r0, #12			
	bl		delayMicroseconds   	@ delayMicroseconds(12)

	mov		r1, #0			
	bl		toggleLatch		@ toggleLatch(0)
	mov		r4, #0			

loop:     
	mov		r0, #6			
	bl		delayMicroseconds    	@ delayMicroseconds(6)

	mov		r1, #0			
	bl		toggleClock		@ toggleClock(0)

	mov		r0, #6			
	bl		delayMicroseconds	@ delayMicroseconds(6)

	bl		Read_Data		@ Read Data from GPLEV0
	lsl		r0, r4			@ Shift r0 by loop counter to align with button
	orr		r5, r0			@ r5 OR r0, to update the pressed buttons in r5

	mov		r1, #1			
	bl		toggleClock		@ toggleClock(1)

	add		r4, #1    		@ r4++, increment loop counter
	cmp		r4, #16			
	blt		loop    		@ If not, branch back to loop
	
	mov		r1, r5
//	ldr		r0, =testMsg
//	bl printf
	
	mov		r0, r5			@ Else, return pressed buttons (r5)
	pop		{r4, r5, pc}		@ pop r4, r5 and Link Register off Stack


@ showPressed(), Checks in order and prints messages for (B, Y, SELECT, START, UP, DOWN, LEFT, RIGHT, A, X , L, R) -----------
.global showPressed
showPressed:
	push		{r4, r5, lr}   		@ push r4, r5 and Link Register onto Stack

	mov		r5, r0

	mov		r6, #0			@ r6 = loopCounter
	mov		r4, r5			@ r4 = pressed buttons

nextButton:
	cmp		r6, #16			@ if no buttons were pressed
	beq		exitPrint		@ exit

	and		r7, r4, #1		

	cmp		r7, #0			
	beq 		retPressed		@ If pressed, branch to retPressed

	add		r6, #1			@ Else, loopCounter++
	lsr		r4, #1			@ Right shift to next button

	b		nextButton

retPressed:

	mov		r1, r6			@ the button that was pressed

	cmp		r1, #0			@ check if 1st button ('B') 
	bne		button2

	ldr		r0, =bString		@ print string for B
	bl		printf			
	b		printed			

button2:
	cmp		r1, #1			@ check if 2nd button ('Y')
	bne		button3

	ldr		r0, =yString		@ print string for Y
	bl		printf
	b		printed

button3:
	cmp		r1, #2			@ check if 3rd button ('SELECT')
	bne		button4

	ldr		r0, =SelectString	@ print string for SELECT
	bl		printf
	b		printed	

button4:
	cmp		r1, #3			@ check if 4th button ('START')
	bne		button5

	ldr		r0, =exitString		@ print exit string
	bl		printf

	mov		r1, #3
	b		exitPrint		@ exit the function

button5:
	cmp		r1, #4			@ check if 5th button ('Joy-Pad UP')
	bne		button6

	ldr		r0, =jUpString		@ print the Joy-Pad UP string
	bl		printf
	b		printed

button6:
	cmp		r1, #5			@ check if 6th button ('Joy-Pad DOWN')
	bne		button7

	ldr		r0, =jDownString	@ print the Joy-Pad DOWN string
	bl		printf
	b		printed

button7:
	cmp		r1, #6			@ check if 7th button ('Joy-Pad LEFT') bit
	bne		button8

	ldr		r0, =jLeftString	@ print the joy-Pad LEFT string
	bl		printf
	b		printed

button8:
	cmp		r1, #7			@ check if 8th button ('Joy-Pad RIGHT')
	bne		button9

	ldr		r0, =jRightString	@ print the joy-Pad RIGHT string
	bl		printf
	b		printed

button9:
	cmp		r1, #8			@ check if 9th button ('A')
	bne		button10

	ldr		r0, =aString		@ print the 'A' string
	bl		printf
	b		printed

button10:
	cmp		r1, #9			@ check if 10th button ('X')
	bne		button11

	ldr		r0, =xString		@ print the 'X' string
	bl		printf
	b		printed

button11:
	cmp		r1, #10			@ check if 11th button ('L')
	bne		button12

	ldr		r0, =leftString		@ print the 'L' string
	bl		printf
	b		printed
button12:
	cmp		r1, #11			@ check if 12th button ('R')
	bne		printed

	ldr		r0, =rightString	@ print the 'R' string
	bl		printf

printed:
	ldr 	r0, =prompt		@ print the prompt 
	bl 		printf
	
exitPrint:
	pop		{r4, r5, pc}		@ pop r4, r5 and Link Register off Stack



@ Data section-------------------------------------------------------------------------------------
.section    .data

.align 2

count:
	.int -1

testMsg:
.asciz		"In SNES: %x\n"

creators:
.asciz 		"Created by: John Kim and Minh Tran and Zia Rehman\r\n\n"

prompt:
.asciz		"Please press a button...\r\n\n"

exitMessage:
.asciz		"Program is terminating...\r\n"

bString:
        .asciz  "You have pressed B\n\n\r"
yString:
        .asciz  "You have pressed Y\n\n\r"
SelectString:
        .asciz  "You have pressed Select\n\n\r"
exitString:
        .asciz  "Program is terminating\n\n\r"
jUpString:
        .asciz  "You have pressed Joy-pad UP\n\n\r"
jDownString:
        .asciz  "You have pressed Joy-pad DOWN\n\n\r"
jLeftString:
        .asciz  "You have pressed Joy-pad LEFT\n\n\r"
jRightString:
        .asciz  "You have pressed Joy-pad RIGHT\n\n\r"
aString:
        .asciz  "You have pressed A\n\n\r"
xString:
        .asciz  "You have pressed X\n\n\r"
leftString:
        .asciz  "You have pressed Left\n\n\r"
rightString:
        .asciz  "You have pressed Right\n\n\r"

.global gpioBaseAddress
gpioBaseAddress:
	.int	0
