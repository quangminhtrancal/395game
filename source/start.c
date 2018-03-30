
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

int return_gameinterface(int offset_color);
int return_gameinterface2(int offset_color);
int originx;
int originy;
void drawstart(int x, int y, int lx, int ly);
void drawquit(int x, int y, int lx, int ly);

/*
void drawstart(int x, int y, int lx, int ly) {

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
			color=return_gameinterface2(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}


}
*/
void drawrestart(int x, int y, int lx, int ly){
	
}
void drawrestart2(int x, int y, int lx, int ly){
	
}
void drawrexit(int x, int y, int lx, int ly){
	
}

void drawrexit2(int x, int y, int lx, int ly){
	
}

/*
void drawstartscreen(){
	int read;
	int up=1;
	int down=0;
	printf("Hi\n");

	// Drawing a restart screen
	drawstart(originx,originy, 960,640);
	int movetogame=0;
	while (movetogame==0){
		read=readSnes();
		
		// up button
		if (read==65519){
			drawstart(originx,originy, 960,640);
			up=1;
			down=0;
		}
		// down button
		if (read==65503){
			drawquit(originx,originy, 960,640);
			down=1;
			up=0;
		}
		// if A button is pressed
		if (read==65279){
			if (up==1) draw();
			else if (down==1) printf ("You quit\n");
		}
	}
}
*/ 
void showmenu(){
	
}

