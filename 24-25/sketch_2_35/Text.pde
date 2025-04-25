class Text {
  String line;
  int size;
  float rotation;
  float vel = random(-4, 3) + 1;
  PVector pos;
  boolean done = false;
  int shakeCounter = 0;
  int fontNumber;
  color c = color(random(200, 255), random(200, 255), random(200, 255));
  Text(PVector pos, String line) {
    this.pos = pos;
    fontNumber = (int)random(fonts.size());
    size = (int)random(30, 100);
    int random = (int)(random(3));
    if (random == 0) {
      rotation = 0;
    } else if (random == 1) {
      rotation = PI/2;
    } else if (random == 2) {
      rotation = -PI/2;
    }
    this.line = line;
  }
  void run() {
    textFont(fonts.get(fontNumber));
    textSize(size);
    fill(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rotation);
    text(line, 0, 0);
    popMatrix();
    if (rotation % PI ==0) {
      pos.x += vel;
    } else {
      pos.y +=vel;
    }
  }
}
