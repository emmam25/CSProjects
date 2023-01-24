void drawCornerCompass() {
  rotations = cam.getRotations();
  camPosition = cam.getPosition();

  //draws the tiny axis in the corner
  pushMatrix();
  rotateX(rotations[0]);
  rotateY(rotations[1]);
  rotateZ(rotations[2]);
  pushMatrix();
  translate(-50, -50, 50);
  if (turn.equals("ORANGE")) {
    fill(orange);
  } else {
    fill(purple);
  }
  text("It is the " + turn + " player's turn", 0, 0, 0);
  popMatrix();
  translate(50, 50, 50);
  stroke(255, 0, 0);
  line(-20, 0, 0, 20, 0, 0);
  fill(255, 0, 0);
  textSize(6);
  text("l", -20, 0, 0);
  text("k", 20, 0, 0);
  stroke(0, 255, 0);
  line(0, -20, 0, 0, 20, 0);
  fill(0, 255, 0);
  text("m", 0, -20, 0);
  text("n", 0, 20, 0);
  stroke(0, 0, 255);
  line(0, 0, -20, 0, 0, 20);
  fill(0, 0, 255);
  text("i", 0, 0, 20);
  text("o", 0, 0, -20);
  stroke(0);
  popMatrix();
}
