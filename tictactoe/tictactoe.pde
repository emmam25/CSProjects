import peasy.*;

PeasyCam cam;
int[][][] cubes = new int[4][4][4];

float[] rotations;

PVector selector = new PVector(0, 0, 0);

String turn = "ORANGE";

color purple = color(160, 0, 255);
color orange = color(255, 160, 0);



GraphicsManager gm;

void setup() {
  size(displayWidth, displayHeight, P3D);
  cam = new PeasyCam(this, 0, 0, 0, 200);
  cam.setWheelHandler(null);
  cam.setMinimumDistance(120);
  cam.setMaximumDistance(500);

  for (int i = 0; i<4; i++) {
    for (int j = 0; j<4; j++) {
      for (int k = 0; k<4; k++) {
        cubes [i][j][k] = 0;
      }
    }
  }
  gm = new GraphicsManager();
}


void draw() {
  
  gm.run();
  

  drawCubes(g);

  displayText();


  PVector hold = gm.getSelectedCube(mouseX, mouseY);
  if (hold.x!=-1) { //to avoid indexoutofbounds
    selector = hold;
  }
}


void keyPressed() {
  //use '0' to refresh the cube and start over
  if (key == '0') {
    for (int i=0; i<4; i++) {
      for (int j = 0; j<4; j++) {
        for (int k = 0; k<4; k++) {
          cubes[i][j][k] =0;
        }
      }
    }
  }
  
  //check if the cube is empty before filling it
  else if ((key == ' ') && (cubes[(int)selector.x][(int)selector.y][(int)selector.z] == 0)) {
    if (turn.equals("ORANGE")) {
      cubes[(int)selector.x][(int)selector.y][(int)selector.z] = 2;
      turn ="PURPLE";
    } else if (turn.equals("PURPLE")) {
      cubes[(int)selector.x][(int)selector.y][(int)selector.z] = 3;
      turn ="ORANGE";
    }
  }
  //limit the selector
  if (selector.x >3) {
    selector.x=3;
  }
  if (selector.y >3) {
    selector.y =3;
  }
  if (selector.z >3) {
    selector.z =3;
  }
  if (selector.x<0) {
    selector.x =0;
  }
  if (selector.y<0) {
    selector.y =0;
  }
  if (selector.z<0) {
    selector.z =0;
  }
}
