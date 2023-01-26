void drawCenterAxis() {
  //draw the big axis
  stroke(255, 0, 0);
  line(-50, 0, 0, 50, 0, 0);
  fill(255, 0, 0);
  text("k", 50, 0, 0);
  text("l", -50, 0, 0);
  stroke(0, 255, 0);
  line(0, -50, 0, 0, 50, 0);
  fill(0, 255, 0);
  text("n", 0, 50, 0);
  text("m", 0, -50, 0);
  stroke(0, 0, 255);
  line(0, 0, -50, 0, 0, 50);
  fill(0, 0, 255);
  text("i", 0, 0, 50);
  text("o", 0, 0, -50);
  stroke(0);
}
