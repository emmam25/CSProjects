class headWhacker extends obstacle{
  PVector pos;
  float lerpX, lerpY;
  PVector size;
  int downValue;
  headWhacker (String lane, int downValue) {
    lerpX = 0.01;
    lerpY = 0.01;
    //needs to be set to duck line
    this.downValue = downValue;
    size = new PVector(0, 0);
    if (lane.equals("RIGHT")) {
      pos = new PVector(5*width/6, downValue-height/9);
    } else if (lane.equals("LEFT")) {
      pos = new PVector(width/6,  downValue-height/9);
    } else if (lane.equals("MID")) {
      pos = new PVector(width/2,  downValue-height/9);
    }
    this.lane = lane;
  }

  void run() {

    rectMode(CENTER);
      rect(pos.x, pos.y, lerp(0, width/3, lerpX), lerp (0, height/9, lerpY));
   // rect(pos.x, pos.y, 50, 50);
    rectMode(CORNER);
    lerpX+= 0.1;
    lerpY  +=0.1;
    
    
    if(lerpX >= 1){
      big = true;
    }
  }
}
