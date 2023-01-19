import peasy.*;

PeasyCam cam;
int[][][] cubes = new int[4][4][4];

PVector selector = new PVector(0, 0, 0);

int turn =1;

void setup() {
  size(displayWidth, displayHeight, P3D);
  cam = new PeasyCam(this, 20, 20, 20, 200);
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
  text("It is player " + turn + "'s turn", 100,100);
}
void draw() {
  background(0);
  
  
  //TODO:
  //need to make a compass or something so you know which buttons to press
  //how do you know whose turn it is? (maybe text on the screen, change color, etc.)
  
  for (int i = 0; i<4; i++) {
    for (int j = 0; j<4; j++) {
      for (int k =0; k<4; k++) {
        if (i == (int)selector.x && j == (int)selector.y && k == (int)selector.z) {
          fill(0, 255, 0);
        } else if (cubes[i][j][k] == 0) {
          fill(255, 255, 255, 30);
        } else if (cubes[i][j][k] == 1) {
          fill(255, 0, 0);
        } else if(cubes[i][j][k] == 2){
          fill(0,0,255);
        }
        pushMatrix();
        translate(i*20, j*20, (k*20));
        box(10);
        popMatrix();
      }
    }
  }
}
void keyPressed() {
  if (key == 'k') {
    selector.x ++;
  } else if (key == 'l') {
    selector.x--;
  } else if (key == 'n') {
    selector.y ++;
  } else if (key == 'm') {
    selector.y --;
  } else if (key == 'i') {
    selector.z--;
  } else if (key == 'o') {
    selector.z++;
  } else if (key == ' ') {
    if (turn ==1) {
      cubes[(int)selector.x][(int)selector.y][(int)selector.z] = 1;
      turn =2;
    } else if (turn ==2){
       cubes[(int)selector.x][(int)selector.y][(int)selector.z] = 2;
       turn =1;
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
