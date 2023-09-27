class Particle {
  PVector pos;
  PVector startPos;
  PVector goalPos;
  PVector distance;
  float speed;
  PVector oneIncrement;
  color fillColor;
  Particle(PVector startPos, PVector goalPos, color fillColor) {
    this.startPos = new PVector(startPos.x, startPos.y);
    this.pos = new PVector(startPos.x, startPos.y);
    this.goalPos = new PVector(goalPos.x, goalPos.y);
    distance = new PVector(0, 0);
    distance.x = goalPos.x-pos.x;
    distance.y = goalPos.y-pos.y;
    oneIncrement = new PVector(0, 0);
    speed = random(0.5, 2);
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
    distance.x = (goalPos.x-pos.x);
    distance.y = (goalPos.y-pos.y);
    if (distance.x <speed) {
      oneIncrement.x =0;
      pos.x = goalPos.x;
    }
    if (distance.y <speed && distance.y>-speed) {
      oneIncrement.y =0;
      pos.y = goalPos.y;
    }
    if (distance.x>speed) {
      oneIncrement.x = speed;
    } else if (distance.x<-speed) {
      oneIncrement.x = -speed;
    }
    if (distance.y>speed) {
      oneIncrement.y =speed;
    } else if (distance.y<-speed) {
      oneIncrement.y = -speed;
    }
    pos.x += oneIncrement.x;
    pos.y += oneIncrement.y;
  }

  void switchDirection() {
    PVector holdGoal = goalPos;
    goalPos.x = startPos.x;
    goalPos.y= startPos.y;
    startPos.x = holdGoal.x;
    startPos.y = holdGoal.y;
    pos.x = holdGoal.x;
    pos.y = holdGoal.y;
    getCloser();
  }
}
