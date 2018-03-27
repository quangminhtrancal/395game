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
int dx;
int dy;
int ang_valu=2;
int miny[10];
int gamestate;
int width_gameover=256;
int height_gameover=256;
int startthisgame=0;
int trigslow=3;
int trigbig=7;

int triggerslowball;
int triggerbigpaddle;

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

void clearBall(int x, int y);



void clearbrick(int x, int y, int lx, int ly);
void DrawPixel(int x, int y, int color);
void drawgreenbrick(int x, int y, int lx, int ly);
void drawwhitebrick(int x, int y, int lx, int ly);
void printmemory();
int convert_x(int x);
int convert_y(int y);
void checkvaluepack();


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
 void treatbrick(int nextx, int nexty, int category){
 	if (category==1) {
		clearBrick(reversex(nextx),reversey(nexty));

		// Setting to define the column of white brick which has the trigger for the value pack
		if (nextx/3==trigslow) {
			triggerslowball=1;
		}
		else if (nextx/3==trigbig) {
			triggerbigpaddle=1;
		}
	}
	else if (category==2) {
		//clearbrick(reversex(nextx),reversey(nexty),width_brick,height_brick);
		clearBrick(reversex(nextx),reversey(nexty));
		//drawwhitebrick(reversex(nextx),reversey(nexty),width_brick,height_brick);//draw white bricks
		drawBrick(reversex(nextx), reversey(nexty), 6);
	}
	else if (category==3) {
		//clearbrick(reversex(nextx),reversey(nexty),width_brick,height_brick);
		clearBrick(reversex(nextx),reversey(nexty));
		//drawgreenbrick(reversex(nextx),reversey(nexty),width_brick,height_brick);	//draw green bricks
		drawBrick(reversex(nextx), reversey(nexty), 7);
	}
 }
 int convert_xcorner(int x){
	 double a=(x-originx)/32;
	return ((int) a);
}

int convert_ycorner(int y){
	 double a=(y-originy)/32;
	return ((int) a);
}
 
 // Draw the ball movement
 void moveball(int startx, int starty){
		checkvaluepack();
		clearBall(prevballx,prevbally);
		//drawball(ballx,bally,width_ball,height_ball);
		drawBall(ballx, bally);

		printf("Speed value=%d\n",ang_valu);
		int next_xtl;
		int next_ytl;
		
		int next_xbl;
		int next_ybl;
		
		int next_xtr;
		int next_ytr;

		int next_xbr;
		int next_ybr;
		
		int ox=convert_x(ballx);
		int oy=convert_y(bally);
		
		int next_xl;
		int next_yl;
		
		int next_xr;
		int next_yr;
		
		int next_xt;
		int next_yt;
		
		int next_xb;
		int next_yb;


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
//		printf("real tlx=%d realt tly=%d next tlx=%d next tly=%d \n",a,b,next_xtl,next_ytl);

		next_xtr=convert_x(next_xtr);
		next_ytr=convert_y(next_ytr);

		next_xbl=convert_x(next_xbl);
		next_ybl=convert_y(next_ybl);

		next_xbr=convert_x(next_xbr);
		next_ybr=convert_y(next_ybr);
		
		

//	printf("real tlx=%d realt tly=%d next blx=%d next bly=%d \n",a,b,next_xbl,next_ybl);

	//	printf("ballx=%d bally=%d dx=%d dy=%d tl=%d tr=%d bl=%d br=%d\n",ballx,bally,dx,dy,gamearray[next_ytl][next_xtl],gamearray[next_ytr][next_xtr],gamearray[next_ybl][next_xbl],gamearray[next_ybr][next_xbr]);
		//printmemory();
		
		if (b >originy+height_bggame-30){

				gamestate=1;
				printf("STOP\n");
				drawgameover(originx+width_bg/2-width_gameover/2,originy+height_bg/2-height_gameover/2,width_gameover,height_gameover);
		}
		
		
		
		// CASE for change x direction -----------------------------------------------------------------------------------------
		if ((next_xtl<=0) && (a <originx)) {
//			printf("real tlx=%d realt tly=%d next tlx=%d next tly=%d \n",a,b,next_xtl,next_ytl);
			
			dx=-dx;
		}
		else if ((next_xtr>29) || (next_xbr >29)) {
			dx=-dx;
		}
	
		
		// CASE for change y direction ------------------------------------------------------------------------------------------
				// Touch the top of the game
		if((gamearray[next_ytl][next_xtl]==9) && (next_ytl==0)){
			dy=-dy;
		}
		else if((gamearray[next_ytr][next_xtr]==9) && (next_ytr==0)){
			dy=-dy;
		}
		
		// Case for change y speed for 45 degree and 60 degree -------------------------------------------------------------------
		
		
		// at the edge of the paddle
		if ((gamearray[next_ybl][next_xbl]==10))
			{
				//printf("In edge\n");
				dy=-ang_valu;
				
			}
			// at middle of the paddle
		if (gamearray[next_ybl][next_xbl]==11){
				//printf("In middle\n");
				if (startthisgame==0) {
					dy=-ang_valu;
					startthisgame=1;
				}
				else if (startthisgame==1) dy=-2*ang_valu;

		}
		
		
		// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   CASE for checking collision with brick $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
		
		if ((dx<0) && (dy<0))  // Check three points tl, t, l  ->tl,tr,bl
		{
			int tl=gamearray[next_ytl][next_xtl];
			int tr=gamearray[next_ytr][next_xtr];
			int bl=gamearray[next_yl][next_xl];
			int tlhas=0;
			int trhas=0;
			int blhas=0;
			tlhas=checkbrick(tl); //0 if no brick; 1 if white brick; 2 if green bick and 3 if red brick
			trhas=checkbrick(tr);
			blhas=checkbrick(bl);
				
			
			if ((tlhas==0)&&(trhas==0)&&(blhas>0)){ // 001 there is only brick on left
				dx=-dx;
				treatbrick(next_xbl,next_ybl,blhas);
			}
			
			else if ((tlhas==0)&&(trhas>0)&&(blhas==0)){ // 010 there is only brick at top 
				dy=-dy;
				treatbrick(next_xtr,next_ytr,trhas);
			}
			else if ((tlhas==0)&&(trhas>0)&&(blhas>0)){ // 011 there are bricks at top and left
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtr,next_ytr,trhas);
				treatbrick(next_xbl,next_ybl,blhas);
			}
			else if ((tlhas>0)&&(trhas==0)&&(blhas==0)){ // 100 there is only brick at the top left
				dy=-dy;
				treatbrick(next_xtl,next_ytl,tlhas);
			}
			else if ((tlhas>0)&&(trhas==0)&&(blhas>0)){ // 101 there are bricks on top left and left
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtl,next_ytl,tlhas);
				treatbrick(next_xbl,next_ybl,blhas);
			}
			else if ((tlhas>0)&&(trhas>0)&&(blhas==0)){ // 110 there are bricks on top left and top right
				dy=-dy;
				treatbrick(next_xtl,next_ytl,tlhas);
				treatbrick(next_xtr,next_ytr,trhas);
			}

			else if ((tlhas>0)&&(trhas>0)&&(blhas>0)){ // 111 there are bricks on top left and top and left
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtl,next_ytl,tlhas);
				treatbrick(next_xtr,next_ytr,trhas);
				treatbrick(next_xbl,next_ybl,blhas);
			}
		}
		
	
		else if ((dx>0) && (dy<0)){  // Check three points -> t-tr-r  -> tl,tr,br

			int tl=gamearray[next_ytl][next_xtl];
			int tr=gamearray[next_ytr][next_xtr];
			int br=gamearray[next_ybr][next_xbr];
			int tlhas=0;
			int trhas=0;
			int brhas=0;
			tlhas=checkbrick(tl); //0 if no brick; 1 if white brick; 2 if green bick and 3 if red brick
			trhas=checkbrick(tr);
			brhas=checkbrick(br);
		//	printf("ballx=%d bally=%d dx=%d dy=%d tl=%d tr=%d bl=%d br=%d tlhas=%d trhas=%d brhas=%d\n",ballx,bally,dx,dy,gamearray[next_ytl][next_xtl],gamearray[next_ytr][next_xtr],gamearray[next_ybl][next_xbl],gamearray[next_ybr][next_xbr],tlhas,trhas,brhas);
			
			if ((tlhas==0)&&(trhas==0)&&(brhas>0)){ // 001 there is only brick on right
				dx=-dx;
				treatbrick(next_xbr,next_ybr,brhas);
			}
			
			else if ((tlhas==0)&&(trhas>0)&&(brhas==0)){ // 010 there is only brick at top right
				dy=-dy;
				treatbrick(next_xtr,next_ytr,trhas);
			}
			else if ((tlhas==0)&&(trhas>0)&&(brhas>0)){ // 011 there are bricks at top right and bottom right
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtr,next_ytr,trhas);
				treatbrick(next_xbr,next_ybr,brhas);
			}
			else if ((tlhas>0)&&(trhas==0)&&(brhas==0)){ // 100 there is only brick at the top left
				dy=-dy;
				treatbrick(next_xtl,next_ytl,tlhas);
			}
			else if ((tlhas>0)&&(trhas==0)&&(brhas>0)){ // 101 there are bricks on top left and bottom right
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtl,next_ytl,tlhas);
				treatbrick(next_xbr,next_ybr,brhas);
			}
			else if ((tlhas>0)&&(trhas>0)&&(brhas==0)){ // 110 there are bricks on top left and top right

				dy=-dy;
				//printf("In here %d %d %d\n",tlhas,trhas,dy);
				//dx=-dx;
				treatbrick(next_xtl,next_ytl,tlhas);
				treatbrick(next_xtr,next_ytr,trhas);
			}

			else if ((tlhas>0)&&(trhas>0)&&(brhas>0)){ // 111 there are bricks on top left and top right and bottom right
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtl,next_ytl,tlhas);
				treatbrick(next_xtr,next_ytr,trhas);
				treatbrick(next_xbr,next_ybr,brhas);
			}	
		}


		else if ((dx<0) && (dy>0)){  // Check three points l,bl,b-> tl, bl, br 
			int tl=gamearray[next_ytl][next_xtl];
			int bl=gamearray[next_ybl][next_xbl];
			int br=gamearray[next_ybr][next_xbr];
			int tlhas=0;
			int blhas=0;
			int brhas=0;
			tlhas=checkbrick(tl); //0 if no brick; 1 if white brick; 2 if green bick and 3 if red brick
			blhas=checkbrick(bl);
			brhas=checkbrick(br);
			
//			printf("dx<0 dy>0 tlh=%d blh=%d brh=%d\n",tlhas,blhas,brhas);
			
			if ((tlhas==0)&&(blhas==0)&&(brhas>0)){ // 001 there is only brick on right
				dx=-dx;
				treatbrick(next_xbr,next_ybr,brhas);
			}
			
			else if ((tlhas==0)&&(blhas>0)&&(brhas==0)){ // 010 there is only brick at bottomleft
				dy=-dy;
				treatbrick(next_xbl,next_ybl,blhas);
			}
			else if ((tlhas==0)&&(blhas>0)&&(brhas>0)){ // 011 there are bricks at bottom left and bottom right
				dy=-dy;
				dx=-dx;
				treatbrick(next_xbl,next_ybl,blhas);
				treatbrick(next_xbr,next_ybr,brhas);
			}
			else if ((tlhas>0)&&(blhas==0)&&(brhas==0)){ // 100 there is only brick at the top left
				dy=-dy;
				treatbrick(next_xtl,next_ytl,tlhas);
			}
			else if ((tlhas>0)&&(blhas==0)&&(brhas>0)){ // 101 there are bricks on top left and bottom right
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtl,next_ytl,tlhas);
				treatbrick(next_xbr,next_ybr,brhas);
			}
			else if ((tlhas>0)&&(blhas>0)&&(brhas==0)){ // 110 there are bricks on top left and top right
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtl,next_ytl,tlhas);
				treatbrick(next_xbl,next_ybl,blhas);
			}

			else if ((tlhas>0)&&(blhas>0)&&(brhas>0)){ // 111 there are bricks on top left and top right and bottom left
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtl,next_ytl,tlhas);
				treatbrick(next_xbl,next_ybl,blhas);
				treatbrick(next_xbr,next_ybr,brhas);
			}	
		}
		
		else if ((dx>0) && (dy>0)){  // Check three points r, b,br ->tr, bl, br  
			int tr=gamearray[next_ytr][next_xtr];
			int bl=gamearray[next_ybl][next_xbl];
			int br=gamearray[next_ybr][next_xbr];
			int trhas=0;
			int blhas=0;
			int brhas=0;
			trhas=checkbrick(tr); //0 if no brick; 1 if white brick; 2 if green bick and 3 if red brick
			blhas=checkbrick(bl);
			brhas=checkbrick(br);
			
//			printf("dx>0 dy>0 trh=%d blh=%d brh=%d\n",trhas,blhas,brhas);
			
			if ((trhas==0)&&(blhas==0)&&(brhas>0)){ // 001 there is only brick on right
				dx=-dx;
				treatbrick(next_xbr,next_ybr,brhas);
			}
			
			else if ((trhas==0)&&(blhas>0)&&(brhas==0)){ // 010 there is only brick at bottomleft
				dy=-dy;
				treatbrick(next_xbl,next_ybl,blhas);
			}
			else if ((trhas==0)&&(blhas>0)&&(brhas>0)){ // 011 there are bricks at bottom left and bottom right
				dy=-dy;
				dx=-dx;
				treatbrick(next_xbl,next_ybl,blhas);
				treatbrick(next_xbr,next_ybr,brhas);
			}
			else if ((trhas>0)&&(blhas==0)&&(brhas==0)){ // 100 there is only brick at the top right
				dy=-dy;
				treatbrick(next_xtr,next_ytr,trhas);
			}
			else if ((trhas>0)&&(blhas==0)&&(brhas>0)){ // 101 there are bricks on top right and bottom right
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtr,next_ytr,trhas);
				treatbrick(next_xbr,next_ybr,brhas);
			}
			else if ((trhas>0)&&(blhas>0)&&(brhas==0)){ // 110 there are bricks on top right and bottom left
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtr,next_ytr,trhas);
				treatbrick(next_xbl,next_ybl,blhas);
			}

			else if ((trhas>0)&&(blhas>0)&&(brhas>0)){ // 111 there are bricks on top left and top right and bottom left
				dy=-dy;
				dx=-dx;
				treatbrick(next_xtr,next_ytr,trhas);
				treatbrick(next_xbl,next_ybl,blhas);
				treatbrick(next_xbr,next_ybr,brhas);
			}
			
		}
	

		
		delay(5);
		prevballx = ballx;
		prevbally = bally;

		ballx+=dx;
		bally+=dy;

	
 }
