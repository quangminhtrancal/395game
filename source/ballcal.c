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
int miny[10];
int gamestate;
int width_gameover=256;
int height_gameover=256;
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
  
  void initialize_gamearray(){
	  for (int i=0;i<20; i++){
		  for (int j=0; j<30;j++)
		  {
			  gamearray[i][j]=0;
			  if ((i==0) || (i==19)) gamearray[i][j]=9;
			  if (i==18) gamearray[18][j]=11;
		  }
	  }
	  for (int j=0; j<30;j++) gamearray[18][j]=11;
	  
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
 // Draw the ball movement
 void moveball(int startx, int starty){
	
		
		clearball(prevballx,prevbally,width_ball,height_ball);
		drawball(ballx,bally,width_ball,height_ball);
		//printmemory();

		
		//int xball_in=convert_x(ballx);
		//int yball_in=convert_y(bally);
	
		int next_xball;
		int next_yball;
		
		int next_xball2;
		int next_yball2;

		int x_topleft;
		int y_topleft;
		int x_topright;
		int y_topright;
		
		int x_bottomleft;
		int y_bottomleft;
		int x_bottomright;
		int y_bottomright;
		
		x_topleft=ballx;
		y_topleft=bally;
		x_topright=ballx+width_ball;
		y_topright=bally;
		
		x_bottomleft=ballx;
		y_bottomleft=bally+height_ball;
		x_bottomright=ballx+width_ball;
		y_bottomright=bally+height_ball;

		if(dy>0){
			next_xball=x_bottomright+dx;
			next_yball=y_bottomright+dy;
			
			next_xball2=x_bottomleft+dx;
			next_yball2=y_bottomleft+dy;
		}
		else if (dy<0){
			next_xball=x_topright+dx;
			next_yball=y_topright+dy;
			next_xball2=x_topleft+dx;
			next_yball2=y_topleft+dy;
		}


		next_xball=convert_x(next_xball);
		next_yball=convert_y(next_yball);
		
		next_xball2=convert_x(next_xball2);
		next_yball2=convert_y(next_yball2);

		if ((gamearray[next_yball2][next_xball2]>5)||(gamearray[next_yball][next_xball]>5))
		{	if ((gamearray[next_yball2][next_xball2]<9)&&(gamearray[next_yball][next_xball]<9))
				printf("value left=%d value right=%d\n",gamearray[next_yball2][next_xball2],gamearray[next_yball][next_xball]);

		}
		// Check the first point -----------------------------------------------------------------
		// next_xball is right point; next_xball2 is left point
		if ((next_xball2<=0) || (next_xball>29)) {
			//printf(" touch left side x index=%d y index=%d \n",next_xball,next_yball);
			dx=-dx;
		}
		
		if ((next_yball >17)&&(gamearray[next_yball][next_xball]==0)){
				gamestate=1;
				printf("STOP\n");
				drawgameover(originx+width_bg/2-width_gameover/2,originy+height_bg/2-height_gameover/2,width_gameover,height_gameover);
		}
		
		// only touch left point
		if((gamearray[next_yball2][next_xball2]==6)&&(gamearray[next_yball][next_xball]!=6)){
			printf("Touch brick left point\n");
			//printf("location ballx=%d bally=%d nextx=%d nexty=%d value=%d dx=%d dy=%d\n",ballx,bally,next_xball,next_yball,gamearray[next_yball][next_xball],dx,dy);
			printf("value left=%d value right=%d\n",gamearray[next_yball2][next_xball2],gamearray[next_yball][next_xball]);

			//printf(" index=%d  indey=%d\n",a,b);
			 clearbrick(reversex(next_xball2),reversey(next_yball2),width_brick,height_brick);
			 dy=-dy;
		}
		if((gamearray[next_yball2][next_xball2]==7)&&(gamearray[next_yball][next_xball]!=7)){
			clearbrick(reversex(next_xball2),reversey(next_yball2),width_brick,height_brick);
			drawwhitebrick(reversex(next_xball2),reversey(next_yball2),width_brick,height_brick);//draw white bricks
			 dy=-dy;
		}
		if((gamearray[next_yball2][next_xball2]==8)&&(gamearray[next_yball][next_xball]!=8)){
			 clearbrick(reversex(next_xball2),reversey(next_yball2),width_brick,height_brick);
			drawgreenbrick(reversex(next_xball2),reversey(next_yball2),width_brick,height_brick);	//draw green bricks
			dy=-dy;
		}
		
		// only touch right point
		
		if((gamearray[next_yball][next_xball]==6)&&(gamearray[next_yball2][next_xball2]!=6)){
			printf("Touch brick right point\n");
			//printf("location ballx=%d bally=%d nextx=%d nexty=%d value=%d dx=%d dy=%d\n",ballx,bally,next_xball,next_yball,gamearray[next_yball][next_xball],dx,dy);
			printf("value left=%d value right=%d\n",gamearray[next_yball2][next_xball2],gamearray[next_yball][next_xball]);

			//printf(" index=%d  indey=%d\n",a,b);
			 clearbrick(reversex(next_xball),reversey(next_yball),width_brick,height_brick);
			 dy=-dy;
		}
		if((gamearray[next_yball][next_xball]==7)&&(gamearray[next_yball2][next_xball2]!=7)){
			clearbrick(reversex(next_xball),reversey(next_yball),width_brick,height_brick);
			drawwhitebrick(reversex(next_xball),reversey(next_yball),width_brick,height_brick);//draw white bricks
			 dy=-dy;
		}
		if((gamearray[next_yball][next_xball]==8)&&(gamearray[next_yball2][next_xball2]!=8)){
			 clearbrick(reversex(next_xball),reversey(next_yball),width_brick,height_brick);
			drawgreenbrick(reversex(next_xball),reversey(next_yball),width_brick,height_brick);	//draw green bricks
			dy=-dy;
		}
		
		// touch both
		if((gamearray[next_yball][next_xball]==6)&&(gamearray[next_yball2][next_xball2]==6)){
			printf("Touch both points\n");
			//printf("location ballx=%d bally=%d nextx=%d nexty=%d value=%d dx=%d dy=%d\n",ballx,bally,next_xball,next_yball,gamearray[next_yball][next_xball],dx,dy);
			printf("value left=%d value right=%d\n",gamearray[next_yball2][next_xball2],gamearray[next_yball][next_xball]);
			
			clearbrick(reversex(next_xball),reversey(next_yball),width_brick,height_brick);
			clearbrick(reversex(next_xball2),reversey(next_yball2),width_brick,height_brick);
			 dy=-dy;
		}
		if((gamearray[next_yball][next_xball]==7)&&(gamearray[next_yball2][next_xball2]==7)){
						printf("Touch both points\n");
			//printf("location ballx=%d bally=%d nextx=%d nexty=%d value=%d dx=%d dy=%d\n",ballx,bally,next_xball,next_yball,gamearray[next_yball][next_xball],dx,dy);
			printf("value left=%d value right=%d\n",gamearray[next_yball2][next_xball2],gamearray[next_yball][next_xball]);

			clearbrick(reversex(next_xball),reversey(next_yball),width_brick,height_brick);
			clearbrick(reversex(next_xball2),reversey(next_yball2),width_brick,height_brick);
			drawwhitebrick(reversex(next_xball),reversey(next_yball),width_brick,height_brick);//draw white bricks
			drawwhitebrick(reversex(next_xball2),reversey(next_yball2),width_brick,height_brick);//draw white bricks
			 dy=-dy;
		}
		if((gamearray[next_yball][next_xball]==8)&&(gamearray[next_yball2][next_xball2]==8)){
						printf("Touch both points\n");
			//printf("location ballx=%d bally=%d nextx=%d nexty=%d value=%d dx=%d dy=%d\n",ballx,bally,next_xball,next_yball,gamearray[next_yball][next_xball],dx,dy);
			printf("value left=%d value right=%d\n",gamearray[next_yball2][next_xball2],gamearray[next_yball][next_xball]);
			clearbrick(reversex(next_xball),reversey(next_yball),width_brick,height_brick);
			clearbrick(reversex(next_xball2),reversey(next_yball2),width_brick,height_brick);
			drawgreenbrick(reversex(next_xball),reversey(next_yball),width_brick,height_brick);	//draw green bricks
			drawgreenbrick(reversex(next_xball2),reversey(next_yball2),width_brick,height_brick);	//draw green bricks
			dy=-dy;
		}
		
		
		
		
		// Touch the top of the game
		if((gamearray[next_yball][next_xball]==9) && (next_yball==0)){
			dy=-dy;
		}

		// at the edge of the paddle
		if (gamearray[next_yball2][next_xball2]==10)
			{
				//printf("In edge\n");
				dy=-2;
				
			}
			// at middle of the paddle
		if (gamearray[next_yball][next_xball]==11){
				//printf("In middle\n");
				dy=-4;

		}
		
		
		delay(5);
		prevballx = ballx;
		prevbally = bally;
		//clearball(ballx,bally,width_ball,height_ball);
		ballx+=dx;
		bally+=dy;
	
 }
