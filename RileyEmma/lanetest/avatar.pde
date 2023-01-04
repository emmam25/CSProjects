class avatar {
  PVector pos;
  String lane;

  avatar() {
    lane = "RIGHT";
    pos = new PVector(5*width/6, width/2);
  }

  void run(String newlane, boolean newducked, boolean newjumped) {
    this.lane = newlane;
    if (lane == "RIGHT") {
      pos.x = 5*width/6;
    } else  if (lane == "LEFT") {
      pos.x = width/6;
    } else if (lane == "MID"){
      pos.x = width/2;
    }
    
    if (newducked){
      pos.y = height/2 + kt.ducklineY;
    } 
    if (newjumped){
      pos.y = height/2 - kt.ducklineY;
    }
    noStroke();
    fill(0,255,0);
    ellipse(pos.x, pos.y, width/6, height);
  }
}
