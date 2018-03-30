//void checkvaluepack(){
//		if(triggerslowball==1){
//		if (receiveslowball==0){
//			sbx=originx+trigslow*96;


.global checkvaluepack
checkvaluepack:
  push	{r4-r10,lr}
  ldr r4, =triggerslowball
  ldr r5, [r4]  // r5=triggerslowball
  cmp r5, #1
  bne checkpaddle
  ldr r4, =receiveslowball
  ldr r5, [r4]  // r5=receiveslowball
  cmp r5, #0
  bgt update_angle
  ldr r4, =originx
  ldr r5, [r4]    // r5=originx
  ldr r4, =trigslow
  ldr r6, [r4]    //r6=trigslow
  mov r7, #96
  mul r6, r7      // r6=trigslow*96
  add r5, r6      // r5= originx+trigslow*96
  ldr r4, =sbx
  str r5, [r4]    // sbx=originx+trigslow*96
  //			sby=originy+3*32+increaseslow;
  //			clearslowball_symbol(sbx,sby-2,96,32);
  //			int indexx=convert_x(sbx);
  //			int indexy=convert_y(sby);
  //			int width=0;
  ldr r4, =originy
  ldr r5, [r4]    // r5=originy
  ldr r4, =increaseslow
  ldr r6, [r4]    //r6=increaseslow
  mov r7, #96
  add r6, r7      // r6=trigslow+96
  add r5, r6      // r5= originy+increaseslow+96
  ldr r4, =sby
  str r5, [r4]    // sby= originy+increaseslow+96
  
  mov r7,#2
  sub r6, r5, r7  // r6=sby-2
  ldr r4, =sbx
  ldr r5, [r4]  // r5=sbx
  mov r0,r5
  mov r1, r6
  mov r2, #96
  mov r3, #32
  bl clearslowball_symbol
  
  ldr r4, =sbx
  ldr r5, [r4]	// r5=sbx
  mov r0, r5	
  bl convert_x
  mov r5, r0	// r5=convert_x(sbx)
  ldr r4, =indexx
  str r5, [r4]	// indexx=convert_x(sbx)
  
  ldr r4, =sby
  ldr r5, [r4]	// r5=sby
  mov r0, r5	
  bl convert_y
  mov r5, r0	// r5=convert_y(sby)
  ldr r4, =indexy
  str r5, [r4]	// indexx=convert_y(sby)
  
  ldr r4, =width
  mov r5, #0
  str r5, [r4]	// width=0

//			if (triggerbigpaddle==1){
//				width=192;
//			}
//			else width=128;
	ldr r4, =triggerbigpaddle
	ldr r5, [r4]	// r5=triggerbigpaddle
	cmp r5, #1
	blt small
	ldr r4, =width
	mov r5, #192
	str r5, [r4]	// width=192
small:
	ldr r4, =width
	mov r5, #128
	str r5, [r4]	// width=128
	
//	int pl=paddlex;
//	int pr=paddlex+width;
//	int pt=paddley;
//	int pb=paddley+32;
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =pl
	str	r5, [r4]	//pl=paddlex
	ldr r4, =width
	ldr r6, [r4]	// r6=width
	add r5, r6		// r5=paddlex+width
	ldr r4, =pr
	str r5, [r4]	// pr=paddlex+width
	ldr r4, =paddley
	ldr r5, [r4]	// r5=paddley
	ldr r4, =pt
	str	r5, [r4]	//pt=paddley
	mov r6, #32
	add r5, r6		// r5=paddlex+width
	ldr r4, =pb
	str r5, [r4]	// pb=paddley+32
	
//				int vl=sbx;
//			int vr=sbx+96;
//			int vt=sby;
//			int vb=sby+32;
	ldr r4, =sbx
	ldr r5, [r4]	// r5=sbx
	ldr r4, =vl
	str	r5, [r4]	//vl=sbx
	mov r6, #96
	add r5, r6		// r5=sbx+96
	ldr r4, =vr
	str	r5, [r4]	//vr=sbx+96
	
	ldr r4, =sby
	ldr r5, [r4]	// r5=sby
	ldr r4, =vt
	str	r5, [r4]	//vt=sby
	mov r6, #32
	add r5, r6		// r5=sby+32
	ldr r4, =vb
	str	r5, [r4]	//vb=sbx+32


//			if ((pr >= vl)&&(pl <= vr)&&(pb>=vt)&&(pt<=vb)){
	ldr r0, =pr
	ldr r7, [r0]	// r7=pr
	ldr r0, =vl
	ldr r8, [r0]	// r8=vl
	cmp r7, r8
	blt donetouch
	ldr r0, =pl
	ldr r7, [r0]	// r7=pl
	ldr r0, =vr
	ldr r8, [r0]	// r8=vr
	cmp r7, r8
	bgt donetouch
	
	ldr r0, =pb
	ldr r7, [r0]	// r7=pb
	ldr r0, =vt
	ldr r8, [r0]	// r8=vt
	cmp r7, r8
	blt donetouch
	
	ldr r0, =pt
	ldr r7, [r0]	// r7=pt
	ldr r0, =vb
	ldr r8, [r0]	// r8=vb
	cmp r7, r8
	bgt donetouch
	
//							clearslowball_symbol(sbx,sby-2,96,32);
//							drawPaddle(paddlex,paddley,width,height_paddle);
//							receiveslowball=1;
	
	ldr r4, =sby
	ldr r6, [r4]		//r6=sby
	mov r7,#2
	sub r6, r7  // r6=sby-2
	ldr r4, =sbx
	ldr r5, [r4]  // r5=sbx
	mov r0,r5
	mov r1, r6
	mov r2, #96
	mov r3, #32
	bl clearslowball_symbol
	
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	mov r2, #128
	mov r3, #32
	bl drawPaddle
	ldr r4, =receiveslowball
	mov r5, #1
	str r5, [r4]	// receiveslowball=1
	b checkpaddle	

donetouch:
//			else if (gamearray[indexy][indexx]==9){
//				clearslowball_symbol(sbx,sby-2,96,32);
//			}
	ldr r4, =indexy
	ldr r5, [r4]	// r5=indexy =i
	ldr r4, =indexx
	ldr r6, [r4]	// r6=indexx =j	
	mov r8, #4
	mul r6, r8		// r6=4j
	mov r7, #120
	mul r5, r7	// r5=120*i
	add r5, r6		// r5=120*i+4j
	ldr r7, =gamearray
	ldr r8, [r7,r5]	// r8=gamearray[i][j]
	
	cmp r8, #9
	bne check2
	ldr r4, =sby
	ldr r6, [r4]		//r6=sby
	mov r7,#2
	sub r6, r7  // r6=sby-2
	ldr r4, =sbx
	ldr r5, [r4]  // r5=sbx
	mov r0,r5
	mov r1, r6
	mov r2, #96
	mov r3, #32
	bl clearslowball_symbol	
	b checkpaddle
	
check2:
//			else{
//				drawslowball_symbol(sbx,sby,96,32);
//				increaseslow+=2;
//			}
	ldr r4, =sby
	ldr r6, [r4]		//r6=sby
	ldr r4, =sbx
	ldr r5, [r4]  // r5=sbx
	mov r0,r5
	mov r1, r6
	mov r2, #96
	mov r3, #32
	bl drawslowball_symbol	
	ldr r4, =increaseslow
	ldr r5, [r4]	// r5=increaseslow
	mov r6, #2
	add r5, r6
	str r5, [r4]	// increaseslow+=2
	b checkpaddle

update_angle:
	ldr r4, =dx
	ldr r5, [r4]	// r5=dx
	ldr r4, =dy
	ldr r6, [r4]	// r6=dy
	cmp r5, r6
	bne xy_notequal
	ldr r4, =dx
	mov r5, #1
	ldr r5, [r4]	// dx=1
	ldr r4, =dy
	
	mov r5, #1
	ldr r5, [r4]	// dy=1
	
	b doneangle
xy_notequal:	

doneangle:
	ldr r4, =ang_valu
	mov r5, #1
	str r5, [r4]	//ang_valu=1
	/////////////////--------------------------------------------------------------

checkpaddle:

ldr r4, =triggerbigpaddle
  ldr r5, [r4]  // r5=triggerbigpaddle
  cmp r5, #1
  bne done
  ldr r4, =receivebpaddle
  ldr r5, [r4]  // r5=receivebpaddle
  cmp r5, #0
  bgt done
  ldr r4, =originx
  ldr r5, [r4]    // r5=originx
  ldr r4, =trigbig
  ldr r6, [r4]    //r6=trigbig
  mov r7, #96
  mul r6, r7      // r6=trigbig*96
  add r5, r6      // r5= originx+trigbig*96
  ldr r4, =bpx
  str r5, [r4]    // bpx=originx+trigbig*96

  ldr r4, =originy
  ldr r5, [r4]    // r5=originy
  ldr r4, =increasebig
  ldr r6, [r4]    //r6=increasebig
  mov r7, #96
  add r6, r7      // r6=increasebig+96
  add r5, r6      // r5= originy+increasebig+96
  ldr r4, =bpy
  str r5, [r4]    // bpy= originy+increasebig+96
  
  mov r7,#2
  sub r6, r5, r7  // r6=bpy-2
  ldr r4, =bpx
  ldr r5, [r4]  // r5=bpx
  mov r0,r5
  mov r1, r6
  mov r2, #96
  mov r3, #32
  bl clearpaddle_symbol
  
  ldr r4, =bpx
  ldr r5, [r4]	// r5=bpx
  mov r0, r5	
  bl convert_x
  mov r5, r0	// r5=convert_x(bpx)
  ldr r4, =indexx
  str r5, [r4]	// indexx=convert_x(bpx)
  
  ldr r4, =bpy
  ldr r5, [r4]	// r5=bpy
  mov r0, r5	
  bl convert_y
  mov r5, r0	// r5=convert_y(bpy)
  ldr r4, =indexy
  str r5, [r4]	// indexx=convert_y(bpy)
	
//			int pl=paddlex;
//			int pr=paddlex+128;
//			int pt=paddley;
//			int pb=paddley+32;
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =pl
	str	r5, [r4]	//pl=paddlex
	mov r6, #128
	add r5, r6		// r5=paddlex+128
	ldr r4, =pr
	str r5, [r4]	// pr=paddlex+128
	ldr r4, =paddley
	ldr r5, [r4]	// r5=paddley
	ldr r4, =pt
	str	r5, [r4]	//pt=paddley
	mov r6, #32
	add r5, r6		// r5=paddlex+width
	ldr r4, =pb
	str r5, [r4]	// pb=paddley+32
	
//				int vl=bpx;
//			int vr=bpx+96;
//			int vt=bpy;
//			int vb=bpy+32;
	ldr r4, =bpx
	ldr r5, [r4]	// r5=bpx
	ldr r4, =vl
	str	r5, [r4]	//vl=bpx
	mov r6, #96
	add r5, r6		// r5=bpx+96
	ldr r4, =vr
	str	r5, [r4]	//vr=bpx+96
	
	ldr r4, =bpy
	ldr r5, [r4]	// r5=bpy
	ldr r4, =vt
	str	r5, [r4]	//vt=bpy
	mov r6, #32
	add r5, r6		// r5=bpy+32
	ldr r4, =vb
	str	r5, [r4]	//vb=bpy+32


//			if ((pr >= vl)&&(pl <= vr)&&(pb>=vt)&&(pt<=vb)){
	ldr r0, =pr
	ldr r7, [r0]	// r7=pr
	ldr r0, =vl
	ldr r8, [r0]	// r8=vl
	cmp r7, r8
	blt donetouch1
	ldr r0, =pl
	ldr r7, [r0]	// r7=pl
	ldr r0, =vr
	ldr r8, [r0]	// r8=vr
	cmp r7, r8
	bgt donetouch1
	
	ldr r0, =pb
	ldr r7, [r0]	// r7=pb
	ldr r0, =vt
	ldr r8, [r0]	// r8=vt
	cmp r7, r8
	blt donetouch1
	
	ldr r0, =pt
	ldr r7, [r0]	// r7=pt
	ldr r0, =vb
	ldr r8, [r0]	// r8=vb
	cmp r7, r8
	bgt donetouch1
	
//							clearslowball_symbol(sbx,sby-2,96,32);
//							drawPaddle(paddlex,paddley,width,height_paddle);
//							receiveslowball=1;

//			clearpaddle_symbol(bpx,bpy-2,96,32);
//			receivebpaddle=1;
//			drawbigpaddle(paddlex,paddley,192,32);
	
	ldr r4, =bpy
	ldr r6, [r4]		//r6=bpy
	mov r7,#2
	sub r6, r7  // r6=bpy-2
	ldr r4, =bpx
	ldr r5, [r4]  // r5=bpx
	mov r0,r5
	mov r1, r6
	mov r2, #96
	mov r3, #32
	bl clearpaddle_symbol
	
	ldr r4, =paddlex
	ldr r5, [r4]	// r5=paddlex
	ldr r4, =paddley
	ldr r6, [r4]	// r6=paddley
	mov r0, r5
	mov r1, r6
	mov r2, #192
	mov r3, #32
	bl drawbigpaddle
	ldr r4, =receivebpaddle
	mov r5, #1
	str r5, [r4]	// receivebpaddle=1
	b confirmbig	

donetouch1:
//			else if (gamearray[indexy][indexx]==9){
//				clearpaddle_symbol(bpx,bpy-2,96,32);
//			}
	ldr r4, =indexy
	ldr r5, [r4]	// r5=indexy =i
	ldr r4, =indexx
	ldr r6, [r4]	// r6=indexx =j	
	mov r8, #4
	mul r6, r8		// r6=4j
	mov r7, #120
	mul r5, r7	// r5=120*i
	add r5, r6		// r5=120*i+4j
	ldr r7, =gamearray
	ldr r8, [r7,r5]	// r8=gamearray[i][j]
	
	cmp r8, #9
	bne check3
	ldr r4, =bpy
	ldr r6, [r4]		//r6=bpy
	mov r7,#2
	sub r6, r7  // r6=bpy-2
	ldr r4, =bpx
	ldr r5, [r4]  // r5=bpx
	mov r0,r5
	mov r1, r6
	mov r2, #96
	mov r3, #32
	bl clearpaddle_symbol
	b confirmbig
	
check3:
//			else{
//				drawpaddle_symbol(bpx,bpy,96,32);
//				increasebig+=2;
//			}
	ldr r4, =bpy
	ldr r6, [r4]		//r6=bpy
	ldr r4, =bpx
	ldr r5, [r4]  // r5=bpx
	mov r0,r5
	mov r1, r6
	mov r2, #96
	mov r3, #32
	bl drawpaddle_symbol	
	ldr r4, =increasebig
	ldr r5, [r4]	// r5=increasebig
	mov r6, #2
	add r5, r6
	str r5, [r4]	// increasebig+=2


confirmbig:


done:
	pop	{r4-r10,pc}
	


  .section .data

  .align 4

  indexx:	.int	0
  indexy:	.int	0
  pl:	.int	0
  pr:	.int	0
  pt:	.int	0
  pb:	.int	0
  vl:	.int	0
  vr:	.int	0
  vt:	.int	0
  vb:	.int	0
  width: .int	0
