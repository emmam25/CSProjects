class PlayGame extends GameState {
  //the index of the cube the mouse is on
  PVector selector = new PVector(0, 0, 0);

  String turn = "FIRST";

  PlayGame() {

    for (int i = 0; i<4; i++) {
      for (int j = 0; j<4; j++) {
        for (int k = 0; k<4; k++) {
          cubes [i][j][k] = 0;
        }
      }
    }
    gm = new GraphicsManager();
    
    //add the empty int array to the arraylist at the start
    time.add(cubes);
  }

  boolean run() {

    gm.run(selector);

    drawCubes(g, selector);

    displayText(turn);


    PVector hold = gm.getSelectedCube(mouseX, mouseY, cubes);
    if (hold.x!=-1) { //to avoid indexoutofbounds
      selector = hold;
    }
    return done;
  }

  void keyPressed() {
    //use '0' to refresh everything and start over
    if (key == '0') {
      for (int i=0; i<4; i++) {
        for (int j = 0; j<4; j++) {
          for (int k = 0; k<4; k++) {
            cubes[i][j][k] =0;
          }
        }
      }
      for(int i=time.size()-1; i>=0; i--){
        time.remove(i);
      }
      turn = "FIRST";
      saveMove();
    }
    
    //use 'u' to undo
    else if (key == 'u' && time.size()>1) {
      cubes = time.remove(time.size()-1);
      if(turn.equals("FIRST")){
        turn = "SECOND";
      } else {
        turn = "FIRST";
      }
    }


    //check if the cube is empty before filling it
    else if ((key == ' ') && (cubes[(int)selector.x][(int)selector.y][(int)selector.z] == 0)) {
      saveMove();
      if (turn.equals("FIRST")) {
        cubes[(int)selector.x][(int)selector.y][(int)selector.z] = 2;
        turn ="SECOND";
      } else if (turn.equals("SECOND")) {
        cubes[(int)selector.x][(int)selector.y][(int)selector.z] = 3;
        turn ="FIRST";
      }
    } else if(key == 'r'){
      done = true;
    }

    //limit the selector
    if (selector.x >3) {
      selector.x=3;
    }
    if (selector.y >3) {
      selector.y =3;
    }
    if (selector.z >3) {
      selector.z =3;
    }
    if (selector.x<0) {
      selector.x =0;
    }
    if (selector.y<0) {
      selector.y =0;
    }
    if (selector.z<0) {
      selector.z =0;
    }
  }

//saves the current cube array to the time arraylist
  void saveMove() {
    int[][][] hold = new int[4][4][4];
    for (int i =0; i<4; i++) {
      for (int j = 0; j<4; j++) {
        for (int k = 0; k<4; k++) {
          hold[i][j][k] = cubes [i][j][k];
        }
      }
    }
    time.add(hold);
  }
}
