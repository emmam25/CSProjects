import peasy.*;
PeasyCam cam;
float m = 2;
float r = 50;
float n1 = 20;
float n2 = 10;
float n3 = 10;
float a = 1;
float b = 1;
float spacing = 0.05;
PImage img;
void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 0, 0, 0, 300);
  cam.setWheelHandler(null);
  img = loadImage("glowy.png");
}
void draw() {
  background(0);
/*  stroke(255, 0, 0);
  line(-100, 0, 0, 100, 0, 0);
  stroke(0, 255, 0);
  line(0, -100, 0, 0, 100, 0);
  stroke(0, 0, 255);
  line(0, 0, -100, 0, 0, 100);*/
  fill(0, 255, 0);
  noStroke();
  textureMode(NORMAL);

  beginShape(TRIANGLE_FAN);
  texture(img);
  for (float p = 0; p<PI+0.1; p+=spacing) {
    float r1 = getR(m, p, n1, n2, n3, a, b);
    for (float t = 0; t<2*PI+0.1; t+=spacing) {
      float r2 = getR(m, t, n1, n2, n3, a, b);
      float z = r*r2*sin(p);
      float x = r*r1*cos(t) * r2 *cos(p);
      float y = r*r1*sin(t) * r2*cos(p);
      vertex(x, y, z, map(x, -r*r1*r2, r*r1*r2, 0, 1), map(y, -r*r1*r2, r*r1*r2, 0, 1));
    }
  }
  endShape();
  /*beginShape(TRIANGLE_FAN);
   for (float t = 0; t<2*PI+0.1; t+=spacing) {
   float r1 = getR(m, t, n1, n2, n3, a, b);
   for (float p = 0; p<PI+0.1; p+=spacing) {
   float r2 = getR(m, p, n1, n2, n3, a, b);
   float z = r*r2*sin(p);
   float x = r*r1*cos(t) * r2 *cos(p);
   float y = r*r1*sin(t) * r2*cos(p);
   vertex(x, y, z);
   }
   }
   endShape();*/
  m+=0.01;
  a = map(sin(m), -1, 1, 1, 2); //bigger a is bigger shape
}
//Where r and phi are polar coordinates (radius,angle).
//n1, n2, n3, and m are real numbers. a and b are real numbers excluding zero.

float getR(float m, float angle, float n1, float n2, float n3, float a, float b) {
  //steps in the equation
  float one = abs((1/a)*cos(m*angle/4));
  float two = abs((1/b)*sin(m*angle/4));
  float three = pow(one, n2) + pow(two, n3);
  float r = pow(three, -1/n1);
  return r;
}
