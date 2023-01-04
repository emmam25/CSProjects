class moveDuckLine extends gamestate {
  int ducklineY=0;
  boolean moving=true;

  moveDuckLine() {
  }
  boolean run() {
    kt.display();
    strokeWeight(6);
    stroke(0, 255, 0);
    line(0, ducklineY, width, ducklineY);
    return done;
  }
  void mouseClicked() {
    if (moving) {
      ducklineY = mouseY;
    }
  }
  void keyPressed() {
    //maybe these should be combined into one key press?
    if (key == 's') {
      moving = false;
      kt.ducklineY = this.ducklineY;
    } else if (key == ' ') {
      done = true;
    }
  }
}
