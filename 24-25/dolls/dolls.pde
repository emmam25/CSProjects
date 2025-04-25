PImage doll1, doll2;
int doll =0;
void setup() {
  size(1440,900);
  doll1 = loadImage("doll1.jpeg");
  doll2 = loadImage("doll2.jpeg");
  doll2.resize(doll1.width, doll1.height);
  int w = doll1.width;
  int h = doll1.height;
  print(w + " " + h);
}
void draw() {
  background(0);
  if (doll%2 == 0) {
    image(doll1, 0, 0);
  } else {
    image(doll2, 0, 0);
  }
}
void keyPressed() {
  doll++;
}
