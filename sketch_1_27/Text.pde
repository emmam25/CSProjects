class Text {
  String line = "451 c Chapter Road London NW2 5NG";
  float size = 50;
  float maxSize = 50;
  float minSize =30;
  float rotation = random(2*PI);
  PVector pos;
  boolean done = false;
  int shakeCounter = 0;
  Text(PVector pos) {
    this.pos = pos;
  }
  void run() {
    textFont(font);
    textSize(size);
    fill(255, map(size, minSize, maxSize, 255, 0));
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rotation);
    text(line, 0, 0);
    popMatrix();
    if (size > minSize) {
      size -=3;
    } else {
      if (done == false) {
        shakeScreen();
      }
    }
  }
  void shakeScreen() {
    float shakes = 20;
    float amp = (shakes-shakeCounter)/7;
    translation.x = random(-amp, amp);
    translation.y = random(-amp, amp);
    shakeCounter ++;
    if (shakeCounter >shakes) {
      done = true;
      translation.x = 0;
      translation.y = 0;
    }
  }
}
