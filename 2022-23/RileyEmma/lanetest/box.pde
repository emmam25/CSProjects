class box extends obstacle{
  PImage train;
  box (String lane, float lIn) {
    train = loadImage("train.png");
    lerpX = 0.01;
    lerpY = 0.01;
    lerpIncr = lIn;
    size = new PVector(0, 0);
    if (lane.equals( "RIGHT")) {
      pos = new PVector(5*width/6, height/2);
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
    imageMode(CENTER);
    image(train, pos.x, pos.y, lerp(0, width/3, lerpX), lerp (0, height, lerpY));
    // rect(pos.x, pos.y, 50, 50);
    rectMode(CORNER);
    if (!big) {
      lerpX+= lerpIncr;
      lerpY  +=lerpIncr;
    }

   // println(lerpX);

    if (lerpX >= 1) {
      big = true;
    }
  }
}
