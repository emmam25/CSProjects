void drawCubes(PGraphics thisg, PVector selector) {
  boolean drawingToScreen = (thisg == g);
  thisg.background(0);
  for (int i = 0; i<4; i++) {
    for (int j = 0; j<4; j++) {
      for (int k =0; k<4; k++) {
        thisg.strokeWeight(3);
        if (i == (int)selector.x && j == (int)selector.y && k == (int)selector.z) {
          thisg.fill(0, 255, 0);
          thisg.pushMatrix();
          //I am translating like this so that the
          //central axis is the center of the cube
          thisg.translate((i-1.5)*20, (j-1.5)*20, ((k-1.5)*20));
          thisg.box(8);
          thisg.popMatrix();
        } else if (cubes[i][j][k] == 0) {
          //each cube's color corresponds to its index
          if (drawingToScreen) {
            thisg.fill(255, 255, 255, 100);
          } else {
            thisg.noStroke();
            thisg.fill(255-i, 255-j, 255-k);
          }
          thisg.pushMatrix();
          thisg.translate((i-1.5)*20, (j-1.5)*20, ((k-1.5)*20));
          thisg.box(8);
          thisg.popMatrix();
        } else if (cubes[i][j][k] == 2) {
          drawUnit(thisg, (i-1.5)*20, (j-1.5)*20, (k-1.5)*20, firstShell) ;
        } else if (cubes[i][j][k] == 3) {
          drawUnit(thisg, (i-1.5)*20, (j-1.5)*20, (k-1.5)*20, secondShell);
        }
      }
    }
  }
}

void drawUnit(PGraphics thisg, float x, float y, float z, String shell) {
  PShape s = null;
  if (shell == "cat") {
    s=cat;
  } else if (shell == "fish") {
    s = fish;
  } else if (shell == "houseplant") {
    s = houseplant;
  } else if(shell == "sodacan"){
    s = sodacan;
  }
  if(s!=null){
  thisg.pushMatrix();
  thisg.translate(x, y, z);
  thisg.shape(s, 0, 0);
  thisg.popMatrix();
    return;
  }
  
  else if (shell == "orange cube") {
    fill (orange);
  } else if(shell == "purple cube") {
    fill(purple);
  }
  thisg.pushMatrix();
  thisg.translate(x, y, z);
  thisg.box(8);
  thisg.popMatrix();
}
