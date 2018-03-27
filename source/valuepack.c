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

int width_paddle; 
int height_paddle; 

int convert_x(int x);
int convert_y(int y);

int convert_x(int x);
int convert_y(int y);
int gamearray[20][30];


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
	gamearray[indexy][indexx+1]=11;
	gamearray[indexy][indexx+2]=11;
	gamearray[indexy][indexx+3]=11;
	gamearray[indexy][indexx+4]=11;
	gamearray[indexy][indexx+5]=10;	
}

void clearbigpaddle(int x, int y, int lx, int ly){
	
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

int checkpaddletouch(int bx, int xy){
	
}


void checkvaluepack(){
	if(triggerslowball==1){
		if (receiveslowball==0){
			sbx=originx+trigslow*96;
			sby=originy+3*32+increaseslow;
			clearslowball_symbol(sbx,sby-2,96,32);
			int indexx=convert_x(sbx);
			int indexy=convert_y(sby);
			if ((gamearray[indexy][indexx]==10)||(gamearray[indexy][indexx]==11)){
							clearslowball_symbol(sbx,sby-2,96,32);
							drawPaddle(paddlex,paddley);
							receiveslowball=1;
			}
			else if (gamearray[indexy][indexx]==9){
				clearslowball_symbol(sbx,sby-2,96,32);
			}
			else{
				
				drawslowball_symbol(sbx,sby,96,32);
				increaseslow+=2;
			}
		}
		else if (receiveslowball==1){
			ang_valu=1;
		}

	}
	if(triggerbigpaddle==1){
	
		if (receivebpaddle==0){
			
			bpx=originx+trigbig*96;
			bpy=originy+3*32+increasebig;
			clearpaddle_symbol(bpx,bpy-2,96,32);
			int indexx=convert_x(bpx);
			int indexy=convert_y(bpy);
			
			
			
			if ((gamearray[indexy][indexx]==10)||(gamearray[indexy][indexx]==11)){
							clearpaddle_symbol(bpx,bpy-2,96,32);
							
							receivebpaddle=1;
							drawbigpaddle(paddlex,paddley,192,32);
			}
			else if (gamearray[indexy][indexx]==9){
				clearpaddle_symbol(bpx,bpy-2,96,32);
			}
			else{
				
				drawpaddle_symbol(bpx,bpy,96,32);
				increasebig+=2;
			}
			
		}
		else if (receivebpaddle==1) {
			//drawbigpaddle(paddlex,paddley,192,32);
		}
		
		
	}

}
