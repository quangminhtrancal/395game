//int convert_x(int x){
//	return ((x-originx)/32);
//}
.global convert_x
convert_x:
	push {r4-r10,lr}
	mov r4, r0	// r4=40=x
	ldr r5, =originx
	ldr r6, [r5]	// r6=originx
	sub r4, r6	// r4= x-originx

	mov r5,#-1
	mov r6, #32
	mov r7, #0
loop:
	add r5, #1
	mul r7, r5, r6
	cmp r7, r4
	ble loop
	
	sub r5, #1
	mov r0, r5
	pop	{r4-r10,pc}
	
	///
.global convert_y
convert_y:
	push {r4-r10,lr}
	mov r4, r0	// r4=40=x
	ldr r5, =originy
	ldr r6, [r5]	// r6=originy
	sub r4, r6	// r4= x-originy

	mov r5,#-1
	mov r6, #32
	mov r7, #0
loop1:
	add r5, #1
	mul r7, r5, r6
	cmp r7, r4
	ble loop1

	sub r5, #1
	mov r0, r5
	pop	{r4-r10,pc}

.global checkbordercollision1
checkbordercollision1:
	push	{r4-r10,lr}


	pop	{r4-r10,pc}

.section .data

.align 4

bl:	.int	0
br:	.int	0
bt:	.int	0
bb:	.int	0
 
pl: .int	0
pr: .int	0
pt: .int	0
pb: .int	0
plength: .int	0
firstseg: .int	0
midseg: .int	0 	 
