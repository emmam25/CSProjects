class box {
  PVector pos;
  float lerpX, lerpY;
  PVector size;
  boolean big;
  String lane;
  box (String lane) {
    lerpX = 0.01;
    lerpY = 0.01;
    size = new PVector(0, 0);
    if (lane.equals( "RIGHT")) {
      pos = new PVector(5*width/6, height/2);
      println(width);
    } else if (lane.equals("LEFT")) {
      pos = new PVector(width/6, height/2);
    } else if (lane.equals("MID")) {
      pos = new PVector(width/2, height/2);
    }
    this.lane = lane;
  }

  void run() {
    //   println(pos.x);
    rectMode(CENTER);

    rect(pos.x, pos.y, lerp(0, width/3, lerpX), lerp (0, height, lerpY));
    // rect(pos.x, pos.y, 50, 50);
    rectMode(CORNER);
    if (!big) {
      lerpX+= 0.1;
      lerpY  +=0.1;
    }

   // println(lerpX);

    if (lerpX >= 1) {
      big = true;
    }
  }
}
