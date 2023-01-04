
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
      } else if (lane == "MID") {
        lane = "RIGHT";
      }
    } else if (keyCode == LEFT) {
      if(lane == "RIGHT"){
        lane = "MID";
      } else if(lane == "MID"){
        lane = "LEFT";
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
