import peasy.*;

PeasyCam cam;
int[][][] cubes = new int[4][4][4];

float[] rotations;
float[] camPosition;
PVector selector = new PVector(0, 0, 0);

String turn = "ORANGE";

color purple = color(160, 0, 255);
color orange = color(255, 160, 0);


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
  fill(255);
}


void draw() {
  background(0);

  drawCornerCompass();

  drawCube();

  drawCenterAxis();
  
 // println(winner());
  
  
  
}


void keyPressed() {
  if(key == '0'){
    for(int i=0; i<4; i++){
      for(int j = 0; j<4; j++){
        for(int k = 0; k<4; k++){
          cubes[i][j][k] =0;
        }
      }
    }
  }else if (key == 'k') {
    selector.x ++;
  } else if (key == 'l') {
    selector.x--;
  } else if (key == 'n') {
    selector.y ++;
  } else if (key == 'm') {
    selector.y --;
  } else if (key == 'i') {
    selector.z++;
  } else if (key == 'o') {
    selector.z--;
    //check if the cube is empty before filling it
  } else if ((key == ' ')&&(cubes[(int)selector.x][(int)selector.y][(int)selector.z] == 0)) {
    if (turn.equals("ORANGE")) {
      cubes[(int)selector.x][(int)selector.y][(int)selector.z] = 2;
     // turn ="PURPLE";
    } else if (turn.equals("PURPLE")) {
      cubes[(int)selector.x][(int)selector.y][(int)selector.z] = 3;
      turn ="ORANGE";
    }
  }
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
