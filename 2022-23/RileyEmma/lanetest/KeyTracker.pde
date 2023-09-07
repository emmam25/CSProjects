
class KeyTracker extends tracker {
  String lane = "LEFT";
  boolean jumped = false;
  boolean ducked = false;
  

  KeyTracker() {
  }

  void keyPressed() {
    println("yes");
    if (keyCode == RIGHT) {
      if (lane == "LEFT") {
        lane = "MID";
        locX = width/2;
      } else if (lane == "MID") {
        lane = "RIGHT";
        locX = 5* (width/6);
      }
    } else if (keyCode == LEFT) {
      if(lane == "RIGHT"){
        lane = "MID";
        locX = width/2;
      } else if(lane == "MID"){
        lane = "LEFT";
        locX = width/6;
      }
    } else if (keyCode == UP) {
      if (ducked) {
        ducked = false;
      } else if (!ducked && !jumped) {
        jumped = true;
      }
    } else if (keyCode == DOWN) {
      if(jumped){
        jumped = false;
      } else if  (!ducked && !jumped){
        ducked= true;
      }
    }
  }

  String lane() {
    return lane;
  }

  boolean jumped() {
    return jumped;
  }
  boolean ducked() {
    return ducked;
  }
}
