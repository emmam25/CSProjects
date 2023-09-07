import peasy.*;

GraphicsManager gm ;

int[][][] cubes = new int[4][4][4];

PVector selector = new PVector(0, 0, 0);


float[] rotations;

PeasyCam cam;


void setup() {
  size(displayWidth, displayHeight, P3D);

  cam = new PeasyCam(this, 0, 0, 0, 200);
  gm = new GraphicsManager();
  

}

void draw() {
  background(0);
  gm.run();
  
  PVector hello = gm.getSelectedCube(mouseX, mouseY);
  println(hello);
  
}
void drawCubes(PGraphics thisg) {
  thisg.background(0);
  for (int i = 0; i<4; i++) {
    for (int j = 0; j<4; j++) {
      for (int k =0; k<4; k++) {
 
        if (i == (int)selector.x && j == (int)selector.y && k == (int)selector.z) {
          thisg.fill(0, 255, 0);
        } else if (cubes[i][j][k] == 0) {
            thisg.fill(255-i,255-j,255-k);
        } else if (cubes[i][j][k] == 2) {
    //      thisg.fill(orange);
        } else if (cubes[i][j][k] == 3) {
   //       thisg.fill(purple);
        }
        
        thisg.pushMatrix();
        //I am translating like this so that the 
        //central axis is the center of the cube
        thisg.translate((i-1.5)*20, (j-1.5)*20, ((k-1.5)*20));
        thisg.box(8);
        
        //this displays the index of each cube to the right of it
     //   textSize(3);
     //   fill(255);
     //   text(i + " " + j + " " + k, 5, 0);
     
        thisg.popMatrix();
      }
    }
  }
}
