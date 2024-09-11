float r = 50;
import peasy.*;
PeasyCam cam;
void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 0, 0, 0, 300);
  cam.setWheelHandler(null);
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
  for (float p = 0; p<PI+0.1; p+=0.1) {
    beginShape();
    for (float t = 0; t<2*PI+0.1; t+=0.1) {
      float z = r*cos(p);
      float x = r*sin(p)*cos(t);
      float y = r*sin(p)*sin(t);
      vertex(x, y, z);
    }
    endShape();
  }
  
    for (float t = 0; t<2*PI+0.1; t+=0.1) {
    beginShape();
    for (float p = 0; p<PI+0.1; p+=0.1) {
      float z = r*cos(p);
      float x = r*sin(p)*cos(t);
      float y = r*sin(p)*sin(t);
      vertex(x, y, z);
    }
    endShape();
  }
}
