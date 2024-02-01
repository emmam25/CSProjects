Image image;
float startTime = millis();
void setup() {
  size(displayWidth, displayHeight);
  image = new Image(loadImage("flower.png"));
}
void draw() {
  background(255);
  image(image.run(),0,0, width, height);
}

void keyPressed(){
  image.switchParticles();
}
