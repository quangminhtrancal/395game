#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

int return_gameinterface(int offset_color);
int return_quitgame(int offset_color);
int return_quitgame2(int offset_color);
int return_startgame(int offset_color);
int return_startgame2(int offset_color);






 void drawrestartselected(int x, int y, int lx, int ly) {

	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_restartselected(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}


}

 void drawexitselected(int x, int y, int lx, int ly) {

	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_exitselected(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}


}

 void drawquitgameinterface(int x, int y, int lx, int ly) {

	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_quitgameinterface(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}


}

 void drawyouwin(int x, int y, int lx, int ly) {

	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_youwin(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}


}




void drawstartscreen(){
	
	
	drawgameinterface(100,100,1024,704);
	delay(800);
	//drawstart(500,300,320,160);
	delay(800);
	drawrestartselected(500,300,256,256);
	delay(300);
	drawexitselected(500,300,256,256);
	delay(300);

	

	
	
	drawquitgameinterface(100,100,960,640);
	delay(300);

	drawlive(200,200,96,32);
	delay(300);
	drawscore23(400,400,96,32);
	delay(300);
	drawyouwin(700,700,256,256);
	delay(300);

	
	//drawstart2(700,300,320,160);
	//drawquit(700,500,320,160);
	//drawquit2(500,500,320,160);
}
