class Particle {
  PVector pos;
  PVector goalPos;
  PVector distance;
  float divisor; //how many sections you want to break the distance into
  PVector oneIncrement;
  color fillColor;
  Particle(PVector pos, PVector goalPos, color fillColor) {
    this.pos = pos;
    this.goalPos = goalPos;
    distance = new PVector(0,0);
    distance.x = goalPos.x-pos.x;
    distance.y = goalPos.y -pos.y;
    divisor = 10;
    oneIncrement = new PVector(0,0);
    oneIncrement.x = distance.x/divisor;
    oneIncrement.y = distance.y/divisor;
    this.fillColor = fillColor;
  }
  PVector getPos() {
    return pos;
  }
  color getColor() {
    return fillColor;
  }
  void getCloser() {
    if (pos.x - goalPos.x > 3 && pos.y - goalPos.y > 3) {
      pos.x += oneIncrement.x;
      pos.y += oneIncrement.y;
    }
  }
}
