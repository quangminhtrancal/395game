 // 
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

int originx;
int originy;

int width_bg;
int height_bg;

int startbrick_y;
int width_ball;
int height_ball;
int width_paddle;
int height_paddle;
int width_brick;
int height_brick;
int width_Vborder;
int height_Vborder;
int width_Hborder;
int height_Hborder;

int width_bggame;
int height_bggame;

int paddlegap;
int brickgap;

int paddlex;
int paddley;
int prevballx;
int prevbally;
int ballx;
int bally;
int stop=0;
int dx=2;
int dy=2;
int ang_valu=4;// for normal with 45 degree: 4-4; with 60 deg: 3-5 // for slow: with 45 deg 2-2 - with 60 deg 3-1
int miny[10];
int gamestate;
int width_gameover=256;
int height_gameover=256;
int startthisgame=0;
int trigslow=3;
int trigbig=7;

int triggerslowball;
int triggerbigpaddle;
int scores=0;
int lives=3;
int startball;

int sbx; // check x position of slow ball symbol
int sby;	// check y position of slow ball symbol

int bpx;	// check x position of big paddle symbol
int bpy;	// check y position of big paddle symbol

/* To represent the memory of the tile of the game
 =0: no element
= 10: paddle outside; 11 paddle inside
= 2 ball
= 3 value pack 1
= 4 value pack 2

= 6 brick 1 ( the easiest to break) - white brick
= 7 brick 2 ( the medium harness) - hit one time become 1 -green brick
= 8 brick 3 (the hardest) - hit one time, the level is reduced by one-- red brick
= 9 the brick boundary


* */
int gamearray[20][30];



void drawball(int x, int y, int lx, int ly);
void clearball(int x, int y, int lx, int ly);
void clearbrick(int x, int y, int lx, int ly);
void DrawPixel(int x, int y, int color);
void drawgreenbrick(int x, int y, int lx, int ly);
void drawwhitebrick(int x, int y, int lx, int ly);
void printmemory();
int convert_x(int x);
int convert_y(int y);
void checkvaluepack();
int receiveslowball;
int receivebpaddle;
void drawbigpaddle(int x, int y, int lx, int ly);
void clearbigpaddle(int x, int y, int lx, int ly);
int return_zero(int offset_color);
int return_one(int offset_color);
int return_two(int offset_color);
int return_three(int offset_color);
int return_four(int offset_color);
int return_five(int offset_color);
int return_six(int offset_color);
int return_seven(int offset_color);
int return_eight(int offset_color);
int return_nine(int offset_color);

/*
  void initialize_gamearray(){
	  for (int i=0;i<20; i++){
		  for (int j=0; j<30;j++)
		  {
			  gamearray[i][j]=0;
			  //if (i==18) gamearray[18][j]=11;
			  if ((i==0) || (i==19)) gamearray[i][j]=9;

		  }
	  }
	  
  }
  */ 
 // return 0 if none of the point violate; return 1 if the next point violate
  void drawgameover(int x, int y, int lx, int ly){
 	
 	int offset_color=0;
 	int color=0;
 
 	for (int i=0;i<ly;i++){
 		for (int j=0; j<lx; j++){
 			color=return_gameover(offset_color);
 			DrawPixel(x+j,y+i,color);
 			offset_color+=4;
 		}
 	}
 	
 }
 
 /*
int reversex(int indexx){
	int a=indexx/3;
	return (originx+a*96);
 }
int reversey(int indexy){
	 
	return (originy+indexy*32);
 }

 
 int checkbrick(int brickvalue){
	if (brickvalue==6) return 1;
	else if (brickvalue==7) return 2;
	else if (brickvalue==8) return 3;
	return 0;
 }
 
 void updatescores(){
	int count=0; // count white bricks

	for (int j=0;j<30;j=j+3){
		if (gamearray[3][j]==6){ count+=1;
		}
		if (gamearray[2][j]==7){ count+=1;
		}
		if (gamearray[1][j]==8){ count+=1;
		}
		//int total=count6+2*count7+3*count8;
		scores=30-count;
		
	}
}

 void treatbrick(int nextx, int nexty, int category){
 	if (category==1) {
		clearBrick(reversex(nextx),reversey(nexty));
		scores++;
		// Setting to define the column of white brick which has the trigger for the value pack
		if (nextx/3==trigslow) {
			triggerslowball=1;
		}
		else if (nextx/3==trigbig) {
			triggerbigpaddle=1;
		}
	}
	else if (category==2) {
		clearBrick(reversex(nextx),reversey(nexty));
		drawBrick(reversex(nextx),reversey(nexty),6);//draw white bricks
	}
	else if (category==3) {
		clearBrick(reversex(nextx),reversey(nexty));
		drawBrick(reversex(nextx),reversey(nexty),7);	//draw green bricks
	}
	
 }
 */ 
 /*
 int convert_xcorner(int x){
	 double a=(x-originx)/32;
	return ((int) a);
}

int convert_ycorner(int y){
	 double a=(y-originy)/32;
	return ((int) a);
}


int Touching(int al, int ar, int at, int ab, int bl, int br, int bt, int bb)
{
	int check=0;
	if (scores>=4) {
		//printmemory();
		//printf("scores=%d brl=%d brr=%d brt=%d brb=%d bl=%d br=%d bt=%d bb=%d ballx=%d bally=%d\n",scores,al,ar,at,ab,bl,br,bt,bb,ballx, bally);
	}
	
	if ((ar >= bl)&&(al <= br)&&(ab>=bt)&&(at<=bb)){
		printf("\n");
		printf("al=%d ar=%d at=%d ab=%d bl=%d br=%d bt=%d bb=%d dx=%d dy=%d\n",al,ar,at,ab,bl,br,bt,bb,dx,dy);
		printf("\n");
		check=1;
	}
	return check;
}

 void checkcollision_ballbrick(int bry, int brx, int brvalue)
 {
	 
	 int brl=0;
	 int brr=0;
	 int brt=0;
	 int brb=0;
	 int bl=0;
	 int br=0;
	 int bt=0;
	 int bb=0;
	 int brickx=originx+brx*32;
	 int bricky=originy+bry*32;
	brl=brickx;
	brr=brickx+96;
	brt=bricky;
	brb=bricky+32;

	 bl=ballx;
	 br=ballx+32;
	 bt=bally;
	 bb=bally+32;
//	 int checkbricktouch=Touching(brl,brr,brt,brb,bl,br,bt,bb);
	 
	 if ((brr >= bl)&&(brl <= br)&&(brb>=bt)&&(brt<=bb)){
		 
		 printf("in treat brick brx=%d bry=%d value=%d\n",brx,bry,brvalue);

		 treatbrick(brx,bry,brvalue);

		 int leftarea=br-brl;
		 int rightarea=brr-bl;
		 int toparea=bb-brt;
		 int botarea=brb-bt;
		 int ballfromleft=0;
		 int minX=rightarea;
		 int minY=botarea;
		 if (leftarea<rightarea) {
			 ballfromleft=1;
			 minX=leftarea;
		}
		 int ballfromtop=0;
		 if (toparea<botarea){
			 ballfromtop=1;
			 minY=toparea;
		}
		if (minX<minY){
			if (ballfromleft==1) 
			{
				if (dx>0) dx=-dx;
			}
			else if (ballfromleft==0)
			{
				if (dx<0) dx=-dx;
			}
		}
		else if (minX>=minY){
			if (ballfromtop==1) 
			{
				if (dy>0) dy=-dy;
			}
			else if (ballfromtop==0)
			{
				if (dy<0) dy=-dy;
			}
		}
		//printmemory();
		 
	 }
}

 void checkcollision_ballpaddle()
 {
	 int pl=0;
	 int pr=0;
	 int pt=0;
	 int pb=0;
	 int bl=0;
	 int br=0;
	 int bt=0;
	 int bb=0;
	 int plength=0;
	 int firstseg=0;
	 int midseg=0;
	 if (triggerbigpaddle==0){
		 plength=128;
		 firstseg=20;
		 midseg=64;
	 }
	 else if (triggerbigpaddle==1){
		 plength=192;
		 firstseg=28;
		 midseg=96;
	 }
	 
 		pl=paddlex;
		pr=paddlex+plength;
		pt=paddley;
		pb=paddley+32;
	 
	 bl=ballx;
	 br=ballx+32;
	 bt=bally;
	 bb=bally+32;
	 //int checkpaddletouch=Touching(pl,pr,pt,pb,bl,br,bt,bb);
	 if ((pr >= bl)&&(pl <= br)&&(pb>=bt)&&(pt<=bb)){
	 
		dy=-dy;
		//dx=-dx;

		if ((ballx+16)<(paddlex+midseg)) {
			if (dx>0) dx=-dx;
		}
		else{
			if (dx<0) dx=-dx;
		}
		
		if ((bl<(pl+firstseg))||(bl>(pl+firstseg+midseg)))  // check if collision is at the edge 45
		{

				
				//if (startthisgame==1) {
					if (dy>0) dy=ang_valu;
					else dy=-ang_valu;
					
					if (dx>0) dx=ang_valu;
					else dx=-ang_valu;

				//}
		}
		else if(((bl>(pl+firstseg))&&(bl<(pl+firstseg+midseg)))){  // check if collision is at the middle 60
							// at first get 45 degree
				if (startthisgame==0) {
					if (dy>0) dy=ang_valu;
					else dy=-ang_valu;
					startthisgame=1;
				}
				// the next one get 60 degree
				else{
					if (dy>0) dy=ang_valu+1;
					else dy=-ang_valu-1;

					if (dx>0) dx=ang_valu-1;
					else dx=-ang_valu+1;

				//delay(10); // delay to slow down at 60 degr
			}
		}
		

	 }
	 
 }

 void checkbordercollision(){
	 		

//	printf("real tlx=%d realt tly=%d next blx=%d next bly=%d \n",a,b,next_xbl,next_ybl);

	//	printf("ballx=%d bally=%d dx=%d dy=%d tl=%d tr=%d bl=%d br=%d\n",ballx,bally,dx,dy,gamearray[next_ytl][next_xtl],gamearray[next_ytr][next_xtr],gamearray[next_ybl][next_xbl],gamearray[next_ybr][next_xbr]);
		//printmemory();
		
		int next_xtl;
		int next_ytl;
		
		int next_xbl;
		int next_ybl;
		
		int next_xtr;
		int next_ytr;

		int next_xbr;
		int next_ybr;
		

		next_xtl=ballx+dx;
		next_ytl=bally+dy;

		
		next_xbl=ballx+dx;
		next_ybl=bally+width_ball+dy;
		
		next_xtr=ballx+width_ball+dx;
		next_ytr=bally+dy;
		

		next_xbr=ballx+width_ball+dx;
		next_ybr=bally+height_ball+dy;
		
		int a=next_xtl; // real x coordinate
		int b=next_ytl;  // real y coordinate
		
		

		next_xtl=convert_x(next_xtl);
		next_ytl=convert_y(next_ytl);

		next_xtr=convert_x(next_xtr);
		next_ytr=convert_y(next_ytr);

		next_xbl=convert_x(next_xbl);
		next_ybl=convert_y(next_ybl);

		next_xbr=convert_x(next_xbr);
		next_ybr=convert_y(next_ybr);
		
		if (b >originy+height_bggame-30){
				if (lives==0){
					printf("STOP\n");
//					drawnum(lives,576,originy);
					drawgameover(originx+width_bg/2-width_gameover/2,originy+height_bg/2-height_gameover/2,width_gameover,height_gameover);
					gamestate=1;
				}
				else if (lives>0) {
					lives--;
					dx=ang_valu;
					dy=-ang_valu;
					if (receivebpaddle==0){
						clearPaddle(paddlex,paddley,width_paddle,height_paddle);
						clearBall(ballx,bally,width_ball,height_ball);
						paddlex=originx+width_bggame/2-width_paddle/2;
						paddley=originy+height_bggame-paddlegap;
						ballx=originx+width_bggame/2-width_ball/2;
						bally=paddley-34;
						drawPaddle(paddlex,paddley,width_paddle,height_paddle);						//draw paddle @ start position
						drawBall(ballx,bally,width_ball,height_ball);
					}
					if (receivebpaddle==1){
						clearbigpaddle(paddlex,paddley,192,height_paddle);
						clearBall(ballx,bally,width_ball,height_ball);

						ballx=originx+width_bggame/2-width_ball/2;
						bally=paddley-34;
						//clearbigpaddle(paddlex,paddley,192,height_paddle);
						paddlex=originx+width_bggame/2-192/2;
						paddley=originy+height_bggame-paddlegap;
						drawbigpaddle(paddlex,paddley,192,height_paddle);						//draw paddle @ start position
						drawBall(ballx,bally,width_ball,height_ball);
					
					}

				}

		}
		
		// CASE for change x direction -----------------------------------------------------------------------------------------
		if ((next_xtl<=0) && (a <originx)) {
//			printf("real tlx=%d realt tly=%d next tlx=%d next tly=%d \n",a,b,next_xtl,next_ytl);
			
			dx=-dx;
		}
		//else if ((next_xtr>29) || (next_xbr >29)) {
		else if (next_xbr >29) {			
			dx=-dx;
		}
	
		
		// CASE for change y direction ------------------------------------------------------------------------------------------
				// Touch the top of the game
		if((gamearray[next_ytl][next_xtl]==9) && (next_ytl==0)){
			dy=-dy;
		}
	//	else if((gamearray[next_ytr][next_xtr]==9) && (next_ytr==0)){
//			dy=-dy;
//		}
		
 }
 */
 /*
 void draw0(int x,int y){
	int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<32; j++){
			color=return_zero(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
 }
void draw1(int x,int y){
	int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<32; j++){
			color=return_one(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
}
void draw2(int x,int y){
	int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<32; j++){
			color=return_two(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
 }
 void draw3(int x,int y){
	int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<32; j++){
			color=return_three(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
 }
  void draw4(int x,int y){
	int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<32; j++){
			color=return_four(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
 }
  void draw5(int x,int y){
	int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<32; j++){
			color=return_five(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
 }
 void draw6(int x,int y){
	int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<32; j++){
			color=return_six(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
 }
 void draw7(int x,int y){
	int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<32; j++){
			color=return_seven(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
 }
void draw8(int x,int y){
	int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<32; j++){
			color=return_eight(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
 }
  void draw9(int x,int y){
	int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<32; j++){
			color=return_nine(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
 }
void drawnum(int num,int x, int y){
	if (num==0) draw0(x,y);
	if (num==1) draw1(x,y);
	if (num==2) draw2(x,y);
	if (num==3) draw3(x,y);
	if (num==4) draw4(x,y);
	if (num==5) draw5(x,y);
	if (num==6) draw6(x,y);
	if (num==7) draw7(x,y);
	if (num==8) draw8(x,y);
	if (num==9) draw9(x,y);
}
 void drawscore(){
	int num0=scores % 10;
	int num1=scores/10;
	drawnum(num1,originx+384,originy);
	drawnum(num0,originx+416,originy);
	
 }
 void drawscorelabel(int x,int y){
	int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<96; j++){
			color=return_score(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
 }
 void drawlivelabel(int x,int y){
	 int offset_color=0;
	int color=0;
	for (int i=0;i<32;i++){
		for (int j=0; j<96; j++){
			color=return_live(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
 }
 */

 // Draw the ball movement
 /*
 void moveball(){
	 //		drawscore();
		
	//		drawnum(lives,700,originy);
	//	printf("Score %d Lives=%d\n",scores,lives);
	//	printmemory();
		//printf("Speed value=%d\n",ang_valu);
		updatescores();
		checkvaluepack();
		clearBall(prevballx,prevbally,width_ball,height_ball);
		drawBall(ballx,bally,width_ball,height_ball);
		checkcollision_ballpaddle();
		// iterate through all bricks
		for (int i=1;i<4; i++){  // i for y axis
		  for (int j=0; j<30;j=j+3) // j for x axis
		  {
			if((gamearray[i][j]>=6) &&(gamearray[i][j]<=8)){
				
				int checkedvalue=checkbrick(gamearray[i][j]);
				checkcollision_ballbrick(i,j,checkedvalue);
			}
		  }
		}
		checkbordercollision();
		delay(5);
		prevballx = ballx;
		prevbally = bally;
		ballx+=dx;
		bally+=dy;
 }
*/
