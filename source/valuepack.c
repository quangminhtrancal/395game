#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>


int gamearray[20][30];
void DrawPixel(int x, int y, int color);
int return_bg(int offset_color);
int background; 
int triggerslowball=0;
int triggerbigpaddle=0;
int trigslow;
int trigbig;
int increaseslow=0;
int increasebig=0;
int receiveslowball=0;
int receivebpaddle=0;
int paddlex;
int paddley;
int originx;
int originy;
int ang_valu;
int sbx=0; // check x position of slow ball symbol
int sby=0;	// check y position of slow ball symbol

int bpx=0;	// check x position of big paddle symbol
int bpy=0;	// check y position of big paddle symbol

int convert_x(int x);
int convert_y(int y);


// slow ball symbol
void drawslowball_symbol(int x, int y, int lx, int ly){
	int offset_color=0;
	int color=0;
	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_slowball(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
	
}

void clearslowball_symbol(int x, int y, int lx, int ly){
	
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=background;
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
	
}

// big paddle symbol
void drawpaddle_symbol(int x, int y, int lx, int ly){
	int offset_color=0;
	int color=0;
	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_bigpaddle(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
	
}

void clearpaddle_symbol(int x, int y, int lx, int ly){
	
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=background;
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
	
}

// big paddle
void drawbigpaddle(int x, int y, int lx, int ly){

	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			color=return_bpaddle(offset_color);
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
		// assign memory value
	int indexx=convert_x(x);
	int indexy=convert_y(y);
	gamearray[indexy][indexx]=10;
	gamearray[indexy][indexx+1]=10;
	gamearray[indexy][indexx+2]=11;
	gamearray[indexy][indexx+3]=11;
	gamearray[indexy][indexx+4]=10;
	gamearray[indexy][indexx+5]=10;	
}

void cleabigrpaddle(int x, int y, int lx, int ly){
	
	//	te();
		
	int offset_color=0;
	int color=0;

	for (int i=0;i<ly;i++){
		for (int j=0; j<lx; j++){
			//color=background;
			color =background;
			DrawPixel(x+j,y+i,color);
			offset_color+=4;
		}
	}
		// assign memory value
	int indexx=convert_x(x);
	int indexy=convert_y(y);
	for (int i=0; i<6; i++){
		gamearray[indexy][indexx+i]=0;
	}
	
}

int checkpaddletouch(){
}


void checkvaluepack(){
	if(triggerslowball==1){
		if (receiveslowball==0){
			//sbx=
			clearslowball_symbol(originx+trigslow*96,originy+3*32+increaseslow-2,96,32);
			drawslowball_symbol(originx+trigslow*96,originy+3*32+increaseslow,96,32);
			increaseslow+=2;
		}
		else if (receiveslowball==1) {
			clearslowball_symbol(originx+trigslow*96,originy+3*32+increaseslow-2,96,32);
			ang_valu=1;
		}
	}
	if(triggerbigpaddle==1){
		
		if (receivebpaddle==0){
			clearpaddle_symbol(originx+trigslow*96,originy+3*32+increasebig-2,96,32);
			drawpaddle_symbol(originx+trigslow*96,originy+3*32+increasebig,96,32);
			increasebig+=2;
		}
		else if (receivebpaddle==1) {
			drawbigpaddle(paddlex,paddley,192,32);
		}
		
		
	}

}
