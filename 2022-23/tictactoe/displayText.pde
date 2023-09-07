void displayText(String turn) {
  fill(255);
  textSize(12);
  rotations = cam.getRotations();
  pushMatrix();
  //rotate to face the camera
  rotateX(rotations[0]);
  rotateY(rotations[1]);
  rotateZ(rotations[2]);
  translate(-50, -70, 0);
  text("It is the " + turn + " player's turn", 0, 0, 0);
  popMatrix();


  String winner = winner();
  if (winner != null) {
    pushMatrix();
    rotateX(rotations[0]);
    rotateY(rotations[1]);
    rotateZ(rotations[2]);
    translate(-100, 70, 0);
    textSize(12);
    text("The winner is the " + winner + " player!", 0, 0, 0);
    popMatrix();
  }


  pushMatrix();
  rotateX(rotations[0]);
  rotateY(rotations[1]);
  rotateZ(rotations[2]);
  translate(-130, -50, 0);
  textSize(6);
  fill(255);
  text("Welcome to 3D tic tac toe! \n" +
    "- Hold and drag the mouse \n to move the cube\n" +
    "- Hover over a cube and click\n the space bar to select it\n" +
    "-Press u to undo\n" +
    "- Get 4 in a row to win! \n -Press r to show a replay of \n your game", 0, 0, 0);
  popMatrix();
}
