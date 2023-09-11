class Particle {
  PVector pos;
  PVector goalPos;
  PVector distance;
  float speed;
  PVector oneIncrement;
  color fillColor;
  Particle(PVector pos, PVector goalPos, color fillColor) {
    this.pos = pos;
    this.goalPos = goalPos;
    distance = new PVector(0, 0);
    distance.x = goalPos.x-pos.x;
    distance.y = goalPos.y-pos.y;
    oneIncrement = new PVector(0, 0);
    speed = 1;
    if (distance.x>0) {
      oneIncrement.x = speed;
    } else if (distance.x<0) {
      oneIncrement.x = -1*speed;
    }
    if (distance.y>0) {
      oneIncrement.y =speed;
    } else if (distance.y<0) {
      oneIncrement.y = -1*speed;
    }
    this.fillColor = fillColor;
  }
  PVector getPos() {
    return pos;
  }
  color getColor() {
    return fillColor;
  }
  void getCloser() {
    distance.x = (int)(goalPos.x-pos.x);
    distance.y = (int)(goalPos.y-pos.y);
    if (distance.x ==0) {
      oneIncrement.x =0;
      pos.x = goalPos.x;
    }
    if (distance.y ==0) {
      oneIncrement.y =0;
      pos.y = goalPos.y;
    }
    if (distance.x>0) {
      oneIncrement.x = 1;
    } else if (distance.x<0) {
      oneIncrement.x = -1;
    }
    if (distance.y>0) {
      oneIncrement.y =1;
    } else if (distance.y<0) {
      oneIncrement.y = -1;
    }
    pos.x += oneIncrement.x;
    pos.y += oneIncrement.y;
  }
}
