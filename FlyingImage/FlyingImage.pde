//fixed time
Image image;
float startTime = millis();
void setup() {
  size(displayWidth, displayHeight);
  image = new Image(loadImage("flower.png"));
}
void draw() {
  background(255);
 /* if (image.allInPlace() && millis() -startTime>5000) {
    image.switchParticles();
    println('y');
    startTime = millis();
  }*/
  image.run();
}
