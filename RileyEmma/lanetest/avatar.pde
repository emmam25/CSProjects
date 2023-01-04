class avatar {
  PVector pos;
  String lane;

  avatar() {
    lane = "RIGHT";
    pos = new PVector(5*width/6, width/2);
  }

  void run(String lane, boolean ducked, boolean jumped) {
    this.lane = lane;
    if (lane == "RIGHT") {
      pos.x = 5*width/6;
    } else  if (lane == "LEFT") {
      pos.x = width/6;
    } else if (lane == "MID"){
      pos.x = width/2;
    }
    
    if (ducked){
      pos.y = height/2 + kt.ducklineY;
    } 
    if (jumped){
      pos.y = height/2 - kt.ducklineY;
    }
    noStroke();
    fill(0,255,0);
    ellipse(pos.x, pos.y, width/6, height);
  }
}
