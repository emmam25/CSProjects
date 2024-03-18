class Circle {
  PVector pos;
  float size;
  color c;
  float lifeSpan = 255;
  float lifeSpanMinus = random(2, 5);
  Circle(PVector pos, int size) {
    this.pos = pos;
    this.size = size;
    c = color(random(0,148), 255, random(0,70));
  }
  void run() {
    stroke(c, lifeSpan);
    noFill();
    strokeWeight(3);
    circle(pos.x, pos.y, size);
    stroke(c, lifeSpan/2);
    strokeWeight(7);
    circle(pos.x, pos.y, size+3);
    circle(pos.x, pos.y, size-3);
    strokeWeight(5);
    circle(pos.x, pos.y, size+3);
    circle(pos.x, pos.y, size-3);
    size+=2;
    lifeSpan -=lifeSpanMinus;
  }
  boolean isAlive() {
    return lifeSpan >0;
  }
}
