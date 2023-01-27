void displayText() {
  if (turn.equals("ORANGE")) {
    fill(orange);
  } else {
    fill(purple);
  }
  textSize(12);
  rotations = cam.getRotations();
  pushMatrix();
  rotateX(rotations[0]);
  rotateY(rotations[1]);
  rotateZ(rotations[2]);
  translate(-100, -100, 0);
  text("It is the " + turn + " player's turn", 0, 0, 0);
  popMatrix();

  String winner = winner();
  if (winner != null) {
    if (winner.equals("ORANGE")) {
      fill(orange);
    } else if (winner.equals("PURPLE")) {
      fill(purple);
    }
    pushMatrix();
    rotateX(rotations[0]);
    rotateY(rotations[1]);
    rotateZ(rotations[2]);
    translate(-100, 100, 0);
    text("The winner is " + winner + "!", 0, 0, 0);
    popMatrix();
  }
}
