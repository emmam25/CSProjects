class Dolls extends Scene {
  PImage doll1, doll2;
  int doll =0;
  float time = 0;
  Dolls() {
  }
  void initialize() {
    doll1 = loadImage("doll1.jpeg");
    doll2 = loadImage("doll2.jpeg");
    doll2.resize(doll1.width, doll1.height);
    int w = doll1.width;
    int h = doll1.height;
    time = millis();
  }
  void run() {
    background(0);
    if (doll%2 == 0) {
      image(doll1, 0, 0);
    } else {
      image(doll2, 0, 0);
    }
    if(millis()-time > 5000){
      done = true;
    }
    float random = random(100);
    if (random<1){
      doll++;
    }
  }
  void keyPressed() {
    //switch the image
    doll++;
  }
}
