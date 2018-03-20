#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

void te();
void DrawPixel(int x, int y, int color);
int return_bg(int offset_color);
int return_ball(int offset_color);
int return_redbrick(int offset_color);
int return_bluebrick(int offset_color);
int return_greenbrick(int offset_color);
int return_border1(int offset_color);
int return_border2(int offset_color);
int return_whitebrick(int offset_color);
int return_paddle(int offset_color);
int return_upleftedge(int offset_color);
int return_uprightedge(int offset_color);
int return_bottomleftedge(int offset_color);
int return_bottomrightedge(int offset_color);
int return_gameinterface(int offset_color);
int return_quitgame(int offset_color);
int return_quitgame2(int offset_color);
int return_startgame(int offset_color);
int return_startgame2(int offset_color);



int paddlex;
int paddley;
int ballx;
int bally;
/*
// Size of ball is 20x20
void drawball(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_ball(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
	
}

void clearball(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_bg(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
	
}

// size of paddle is 80x20
void drawpaddle(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_paddle(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
	
}

void clearpaddle(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			//color=return_bg(offset_color);
			color =0x00FF00;
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
	
}


void drawredbrick(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_redbrick(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
}

void drawgreenbrick(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_greenbrick(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
}

void drawbluebrick(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_bluebrick(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
}

void drawwhitebrick(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_whitebrick(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
}

// Size of border is 100x20
void drawborderV(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_border1(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
	
}

// Size of border is 20x100
void drawborderH(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_border2(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
	
}


// Size of background is 20x20
void drawbg(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_bg(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
	
}

void draw_totalback(int startx, int starty, int lx, int ly, int increase){
	
	int startx1=startx;
	int starty1=starty;

	
	for (int j=1; j<31;j++){
		for (int i =1; i<31; i++){
			drawbg(startx1,starty1,lx,ly);
			
			startx1+=increase;
			
		}
		startx1=startx;
		
		starty1+=increase;
		
	}
}

void drawredb(int startx, int starty, int lx, int ly){
	int increase=0;
	for (int i=1; i<11;i++){
		drawredbrick(startx+increase,starty,lx,ly);
		increase+=60;
	}
}

void drawgreenb(int startx, int starty, int lx, int ly){
	int increase=0;
	for (int i=1; i<11;i++){
		drawgreenbrick(startx+increase,starty,lx,ly);
		increase+=60;
	}
}

void drawblueb(int startx, int starty, int lx, int ly){
	int increase=0;
	for (int i=1; i<11;i++){
		drawbluebrick(startx+increase,starty,lx,ly);
		increase+=lx;
	}
}

void drawwhiteb(int startx, int starty, int lx, int ly){
	int increase=0;
	for (int i=1; i<11;i++){
		drawwhitebrick(startx+increase,starty,lx,ly);
		increase+=lx;
	}
}

// Draw border Vertical
void drabdV(int startx, int starty, int lx, int ly){
	int increase=0;
	for (int i=1; i<7;i++){
		drawborderV(startx,starty+increase,lx,ly);
		increase+=ly;
	}
}

void drabdH(int startx, int starty, int lx, int ly){
	int increase=0;
	for (int i=1; i<7;i++){
		drawborderH(startx+increase,starty,lx,ly);
		increase+=lx;
	}
}

void leftmove(int speed){
	clearpaddle(paddlex,paddley,80,20);
	if (paddlex>500) {
		if (speed==0) paddlex-=1;
		if (speed==1)	paddlex-=5;
		if (speed==2)	paddlex-=10;
		if (speed==3)	paddlex-=20;
	}
	if (paddlex<500) paddlex=500;
	drawpaddle(paddlex,paddley,80,20);
}

void rightmove(int speed){
	clearpaddle(paddlex,paddley,80,20);
	if (paddlex<1020) {
		if (speed==0) paddlex+=1;
		if (speed==1)	paddlex+=5;
		if (speed==2)	paddlex+=10;
		if (speed==3)	paddlex+=20;	
	}
	if (paddlex>1020) paddlex=1020;
	drawpaddle(paddlex,paddley,80,20);
}

void drawedge1(int x, int y, int lx, int ly){
 	int offset_color=0;
 	int color=0;
 
 	for (int i=0;i<ly;i++){
 		for (int j=0; j<lx; j++){
 			color=return_upleftedge(offset_color);
 			DrawPixel(x+j,y+i,color);
 			offset_color+=4;
 		}
 	}
 	
 }
 
 
 void drawedge2(int x, int y, int lx, int ly){
 	int offset_color=0;
 	int color=0;
 	for (int i=0;i<ly;i++){
 		for (int j=0; j<lx; j++){
 			color=return_uprightedge(offset_color);
 			DrawPixel(x+j,y+i,color);
 			offset_color+=4;
 		}
 	}
 	
 }
 
 void drawedge3(int x, int y, int lx, int ly){
 	
 	int offset_color=0;
 	int color=0;
 
 	for (int i=0;i<ly;i++){
 		for (int j=0; j<lx; j++){
 			color=return_bottomleftedge(offset_color);
 			DrawPixel(x+j,y+i,color);
 			offset_color+=4;
 		}
 	}
 	
 }
 
 void drawedge4(int x, int y, int lx, int ly){
 	
 	int offset_color=0;
 	int color=0;
 
 	for (int i=0;i<ly;i++){
 		for (int j=0; j<lx; j++){
 			color=return_bottomrightedge(offset_color);
 			DrawPixel(x+j,y+i,color);
 			offset_color+=4;
 		}
 	}
 	
 }
 
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



void draw(){
	
	drawgameinterface(500,100,800,800);
	drawstart(700,300,300,300);
	//drawquit(700,500,300,300);
	drawquit2(700,500,300,300);
	//drawstart2(700,300,300,300);

	
	
	/*draw_totalback(500,200,20,20,20);

	drawredb(500,300,60,20);
	drawgreenb(500,320,60,20);
	drawwhiteb(500,340,60,20);
	drabdH(500,180,100,20);
	drabdV(480,200,20,100);
	drabdH(500,800,100,20);
	drabdV(1100,200,20,100);
	drawpaddle(760,750,80,20);
	drawball(790,730,20,20);
	
	drawedge1(480,180,20,20);
 	drawedge2(1100,180,20,20);
 	drawedge3(480,800,20,20);
 	drawedge4(1100,800,20,20);
 	*/
	/*
	paddlex=760;
	paddley=750;
	ballx=790;
	bally=730; 
	/*
	int startx=600;
	int starty=300;
	for (int i=1; i<100;i++){
		drawball(startx+i,starty,20,20);
		delay(100);
		clearball(startx+i,starty,20,20);
	}
	*/
	/*
	int button=0xFFFF;
	int check=0;
	int read=0;
	int count=0;
	int previousbutton=0;
	int speed=0;

	while(1){
		while (check==0){
			read=readSnes();
			//if (read != 65535) printf("%d\n",read);
			// left button
			if (read==65471){
				check=1;
				// speed is used to check if the button is pressed repeatedly
				speed=0;
				leftmove(speed);
				read=0xFFFF;
				speed=0;
			}
			// right button is clicked
			else if (read==65407){
				check=1;
				// speed is used to check if the button is pressed repeatedly
				speed=0;
				rightmove(speed);
				read=0xFFFF;
				speed=0;
			}
			// if B button is pressed- ball release
			else if (read==65534){
				
			}
			// If A and right move is pressed
			else if (read==65151){
				if (previousbutton==read){
					count++;
					if ((count>=10) && (count<=20)) speed=1;
					if ((count>20)&& (count<=30)) speed=2;
					if (count>30)	speed=3;
				}
				if (previousbutton!=read) {
					count=0;
				}

				rightmove(speed);
				read=0xFFFF;
				speed=0;
				previousbutton=65151;	
			}
			// If A and left move is pressed
			else if (read==65215){
				if (previousbutton==read){
					count++;
					if ((count>=10) && (count<=20)) speed=1;
					if ((count>20)&& (count<=30)) speed=2;
					if (count>30)	speed=3;
				}
				if (previousbutton!=read) {
					count=0;
				}

				leftmove(speed);
				read=0xFFFF;
				speed=0;
				previousbutton=65215;	
			}

			delay(50);
			
		}
		check=0;
	}
	
	
	//A- 65279
	//B- 65534
	//Select- 65531
	// Start-65527
	// up pad
	// down pad
	
	
}
*/
