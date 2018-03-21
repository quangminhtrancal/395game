 // 
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
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
= 1: paddle
= 2 ball
= 3 value pack 1
= 4 value pack 2

= 6 brick 1 ( the easiest to break)
= 7 brick 2 ( the medium harness) - hit one time become 1
= 8 brick 3 (the hardest) - hit one time, the level is reduced by one
= 9 the brick boundary


* */
int gamearray[20][30];



 void drawball(int x, int y, int lx, int ly);
 void clearball(int x, int y, int lx, int ly);
  void clearbrick(int x, int y, int lx, int ly);
  void DrawPixel(int x, int y, int color);
  void initialize_gamearray(){
	  for (int i=0;i<20; i++){
		  for (int j=0; j<30;j++)
		  {
			  gamearray[i][j]==0;
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
 
 // Draw the ball movement
 void moveball(int startx, int starty){
	
		
		clearball(prevballx,prevbally,width_ball,height_ball);
		drawball(ballx,bally,width_ball,height_ball);
		if ((ballx+dx>originx+width_bggame-width_ball) ||(ballx+dx<originx)){
			dx=-dx;
		}
		if (bally+dy<originy+brickgap){
			dy=-dy;
		}
		int limity=originy+height_bggame-height_ball-paddlegap;
		if (bally+dy>=limity) {
			printf("in y direction ballx=%d bally=%d, dx=%d dy=%d, lim=%d paddlex=%d paddley=%d\n",ballx,bally,dx,dy,limity,paddlex,paddley);
			if (((ballx-paddlex)<=width_paddle)  && (ballx>paddlex))
			{
				if ((ballx>paddlex+width_paddle/4) && (ballx<paddlex+width_paddle*3/4)){
					dy=4;
				}
				else {
					dy=2;
				}
				dy=-dy;
				
			}
			else{
				gamestate=1;
				printf("STOP\n");
				drawgameover(originx+width_bg/2-width_gameover/2,originy+height_bg/2-height_gameover/2,width_gameover,height_gameover);
			}
			
		}
		
		//Touch the brick
		int index=(ballx+dx-originx)/width_brick;
		//printf("ballx=%d bally=%d, dx=%d dy=%d, index=%d miny=%d\n",ballx,bally,dx,dy,index,miny[index]);
		if ((bally+dy)<miny[index]){
			printf("Touch brick");
			printf("ballx=%d bally=%d, dx=%d dy=%d, index=%d miny=%d\n",ballx,bally,dx,dy,index,miny[index]);
			dy=-dy;
			int brickx;
			int bricky;
			brickx=originx+width_brick*index;
			if (miny[index]-height_brick>=originy+brickgap) {
				miny[index]-=height_brick;
				bricky=miny[index];
			}
			clearbrick(brickx,bricky,width_brick,height_brick);
		}
		delay(5);
		prevballx = ballx;
		prevbally = bally;
		//clearball(ballx,bally,width_ball,height_ball);
		ballx+=dx;
		bally+=dy;
	
 }
