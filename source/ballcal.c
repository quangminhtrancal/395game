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


 void drawball(int x, int y, int lx, int ly);
 void clearball(int x, int y, int lx, int ly);
  void clearbrick(int x, int y, int lx, int ly);
 // return 0 if none of the point violate; return 1 if the next point violate
 /*
 int validate_point(int x0, int y0, int xnext, int ynext){
	return 0;
}
 
 int validate_intersection(int x, int y){
 	 int x2=originx+width_bggame;
	 int x1=originx;
	 int y1=originy+height_bggame-paddlegap-height_paddle;
	 int y2=originy+brickgap;

	if(x+5<x1){
		
	}
	return -1;
 }
 int intersection(){
	 //right hand side line x=x2
	 // left hand side line x=x1
	 // bottom line y=y1
	 // top line y=y2 or ymin
	 int x2=originx+width_bggame;
	 int x1=originx;
	 int y1=originy+height_bggame-paddlegap-height_paddle;
	 int y2=originy+brickgap;
	 // the line is y=+/- tan(alpha) (x-x0) + y0; 
	 // tan(60)=1.7; tan(45)=1; tan(30)=0.58
	 // current x0=ballx; y0=bally
	 int nextx=ballx;
	 int nexty=bally;
	 nextx=nextx+1;
	 nexty=2*(nextx-ballx)+bally;
	 
	 validate_point(ballx,bally,nextx,nexty);
	 

	return -1;
 }
 
 
 // Xdirection -1:right to left; +1:left to right
 // Ydirection +1: up to down; -1: down to up
 // Limit X direction: from 500 to 1100
 // Limit Y direction from 290 to 750
 void calculationball(int curx, int cury,int Xd, int Yd, int angle){
	 int nextx=ballx;
	 int nexty=bally;
	 nextx=nextx+1;
	 nexty=2*(nextx-ballx)+bally;
	 
	 validate_point(ballx,bally,nextx,nexty);
	
 }
 * */
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
			if ((ballx-paddlex)<=width_paddle)  
			{
				dy=-dy;
			}
			else{
				gamestate=1;
				printf("STOP\n");
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
