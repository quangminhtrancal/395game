#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

int return_gameinterface(int offset_color);
int return_quitgame(int offset_color);
int return_quitgame2(int offset_color);
int return_startgame(int offset_color);
int return_startgame2(int offset_color);






void drawgameinterface(int x, int y, int lx, int ly) {

	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_gameinterface(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}


}

 void drawquit(int x, int y, int lx, int ly) {

	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_quitgame(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}


}

 void drawquit2(int x, int y, int lx, int ly) {

	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_quitgame2(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}


}

 void drawstart(int x, int y, int lx, int ly) {

	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_startgame(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}


}

 void drawstart2(int x, int y, int lx, int ly) {

	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_startgame2(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}


}




void drawstartscreen(){
	
	
	drawgameinterface(100,100,1024,704);
	drawstart(500,300,320,160);
	drawstart2(700,300,320,160);
	//drawquit(700,500,320,160);
	//drawquit2(500,500,320,160);
}
