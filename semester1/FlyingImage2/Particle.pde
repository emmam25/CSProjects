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
    oneIncrement = new PVector(0, 0);
    speed = random(0.01);
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
    if(abs(distance.x)<speed){
      pos.x = goalPos.x;
      oneIncrement.x =0;
    } else if(distance.x>speed){
      oneIncrement.x = speed;
    } else if(distance.x<-speed){
      oneIncrement.x = -speed;
    }    
    
    if (abs(distance.y)<speed){
      pos.y = goalPos.y;
      oneIncrement.y =0;
    } else if(distance.y>speed){
      oneIncrement.y = speed;
    } else if(distance.y<-speed){
      oneIncrement.y = -speed;
    }

    pos.x += oneIncrement.x;
    pos.y += oneIncrement.y;
  }
    void switchDirection() {
    PVector holdGoal = new PVector(goalPos.x, goalPos.y);
    goalPos.x = startPos.x;
    goalPos.y = startPos.y;
    startPos.x = holdGoal.x;
    startPos.y = holdGoal.y;
  }
}
