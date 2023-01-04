class moveJumpLine extends gamestate{
  int jumplineY;
  boolean moving = true;
  moveJumpLine(){
  }
   boolean run() {
    kt.display();
    strokeWeight(6);
    stroke(255, 0, 0);
    line(0, jumplineY, width, jumplineY);
    return done;
  }
  
    void mouseClicked() {
    if (moving) {
      jumplineY = mouseY;
    }
  }
  void keyPressed() {
    if (key == ' ') {
      moving = false;
      kt.jumplineY = this.jumplineY;
      done = true;
    }
  }
}
