PImage teeth;
boolean in;
float t =0;
void setup() {
  fullScreen();
  background(0);
  in = false;
  teeth = loadImage("teeth.png");
}
void draw() {
  tint(0, 255, 130, t);
  imageMode(CENTER);
  image(teeth, width/2, height/2);
  if (in) {
    t+=0.4;
  }
}
void keyPressed() {
  if (key == ' ') {
    in = true;
  }
}
