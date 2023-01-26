import peasy.*;

PeasyCam cam;

PGraphics pg;

float[] rotations;

int[][][] cubes = new int[4][4][4];

PVector selector = new PVector(0, 0, 0);


void setup() {
  size(displayWidth, displayHeight, P3D);
  pg = createGraphics(50,50, P3D);
  cam = new PeasyCam(this, 0, 0, 0, 200);
  cam.setWheelHandler(null);
  cam.setMinimumDistance(120);
  cam.setMaximumDistance(500);
  rotations = cam.getRotations();
}

void draw() {
  background(0);
  rotations = cam.getRotations();
  pg.beginDraw();
  pg.background(100);
  pg.translate(0,0);
   drawCubes(pg);
  pg.endDraw();
  pushMatrix();
  rotateX(rotations[0]);
  rotateY(rotations[1]);
  rotateZ(rotations[2]);
  image(pg, -100, -100);
  popMatrix();

  pg.loadPixels();
  println(pg.pixels[100]);
  
  

}


void drawCubes(PGraphics thisg) {
  thisg.rotateX(rotations[0]*-1);
  thisg.rotateY(rotations[1]*-1);
  thisg.rotateZ(rotations[2]*-1);
  for (int i = 0; i<4; i++) {
    for (int j = 0; j<4; j++) {
      for (int k =0; k<4; k++) {

        if (i == (int)selector.x && j == (int)selector.y && k == (int)selector.z) {
          thisg.stroke(0,255,0);
          thisg.fill(0, 255, 0);
        } else if (cubes[i][j][k] == 0) {
          thisg.stroke(255);
          thisg.fill(255, 255, 255);
        } else if (cubes[i][j][k] == 2) {
          thisg.fill(255);
        } else if (cubes[i][j][k] == 3) {
          thisg.fill(255);
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
