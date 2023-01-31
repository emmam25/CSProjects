void displayText() {
  if (turn.equals("ORANGE")) {
    fill(orange);
  } else {
    fill(purple);
  }
  textSize(12);
  rotations = cam.getRotations();
  pushMatrix();
  //rotate to face the camera
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
    textSize(12);
    text("The winner is " + winner + "!", 0, 0, 0);
    popMatrix();
  }


  pushMatrix();
  rotateX(rotations[0]);
  rotateY(rotations[1]);
  rotateZ(rotations[2]);
  translate(-170, -50, 0);
  textSize(6);
  fill(255);
  text("Welcome to 3D tic tac toe! \n" +
    "- Hold and drag the mouse to move the cube\n" +
    "- Hover over a cube and click the space \nbar to select it\n" +
    "- Get 4 in a row to win!", 0, 0, 0);
  popMatrix();
}
