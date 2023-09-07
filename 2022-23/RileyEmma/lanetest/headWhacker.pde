class headWhacker extends obstacle{
  PImage trees;
  int downValue;
  headWhacker (String lane, int downValue, float lIn) {
    trees = loadImage("trees.png");
    lerpX = 0.01;
    lerpY = 0.01;
    lerpIncr = lIn;
    //needs to be set to duck line
  //  this.downValue = downValue;
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

    rectMode(CENTER);
    imageMode(CENTER);
      image(trees,pos.x, pos.y, lerp(0, width/3, lerpX), lerp (0, height, lerpY));
   // rect(pos.x, pos.y, 50, 50);
    rectMode(CORNER);
    lerpX+= lerpIncr;
    lerpY  +=lerpIncr;
    
    
    if(lerpX >= 1){
      big = true;
    }
  }
}
