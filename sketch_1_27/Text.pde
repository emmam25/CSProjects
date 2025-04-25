class Text {
  String line = "451 c Chapter Road London NW2 5NG";
  int size;
  float vel = (int)random(-4,3);
  PVector pos;
  boolean done = false;
  color c = color(255);
  Text(PVector pos) {
    this.pos = pos;
    size = 30;
    if(vel == 0){
      vel = 4;
    }
  }
  void run() {
    textSize(size);
    textAlign(CENTER);
    textFont(font);
    fill(c);
    text(line, pos.x, pos.y);
    pos.x += vel;
  }
}
