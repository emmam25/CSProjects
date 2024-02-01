import peasy.*;
PeasyCam cam;
float r=50;
float h = 100;
PImage flowers;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 0, 0, 0, 300);
  cam.setWheelHandler(null);
  flowers = loadImage("flowers.jpg");
}
void draw() {
  background(0);
  stroke(255, 0, 0);
  line(-100, 0, 0, 100, 0, 0);
  stroke(0, 255, 0);
  line(0, -100, 0, 0, 100, 0);
  stroke(0, 0, 255);
  line(0, 0, -100, 0, 0, 100);
  noFill();
  stroke(255);
  for (float u=0; u<h+1; u+=h/5) {
    beginShape();
    for (float v = 0; v<2*PI; v+=PI/12) {
      float z = u;
      float y = r* sin(v);
      float x = r* cos(v);
      vertex(x, y, z);
    }
    endShape();
  }
  textureMode(NORMAL);
  texture(flowers);
  for (float v = 0; v<2*PI; v+=PI/12) {
    beginShape();
    for (float u=0; u<h+1; u+=h/5) {
      float z = u;
      float y = r* sin(v);
      float x = r* cos(v);
      vertex(x, y, z, map(v, 0, 2*PI, 0, 1), map(u, 0, h, 0, 1));
    }
    endShape();
  }

  //pizza
  float z = h;
  for (float v = 0; v<2*PI; v+=PI/12) {
    float y = r * sin(v);
    float x = r* cos(v);
    line(0, 0, z, x, y, z);
  }

  //swirl
  z=0;
  float rHere = r;
  beginShape();
  for (float v = 0; v<10*PI; v+=PI/12) {
    float y = rHere * sin(v);
    float x = rHere* cos(v);
    vertex(x, y, z);
    rHere-=r/120;
  }
  endShape();
}
