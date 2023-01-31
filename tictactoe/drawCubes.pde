void drawCubes(PGraphics thisg) {
  boolean drawingToScreen = (thisg == g);
  thisg.background(0);
  for (int i = 0; i<4; i++) {
    for (int j = 0; j<4; j++) {
      for (int k =0; k<4; k++) {
        thisg.strokeWeight(3);
        if (i == (int)selector.x && j == (int)selector.y && k == (int)selector.z) {
          thisg.fill(0, 255, 0);
        } else if (cubes[i][j][k] == 0) {
          //each cube's color corresponds to its index
          if (drawingToScreen) {
            thisg.fill(255,255,255,100);
          } else {
            thisg.noStroke();
            thisg.fill(255-i, 255-j, 255-k);
          }
        } else if (cubes[i][j][k] == 2) {
          thisg.fill(orange);
        } else if (cubes[i][j][k] == 3) {
          thisg.fill(purple);
        }

        thisg.pushMatrix();
        //I am translating like this so that the
        //central axis is the center of the cube
        thisg.translate((i-1.5)*20, (j-1.5)*20, ((k-1.5)*20));
        thisg.box(8);

        /* this displays the index of each cube to the right of it
         textSize(3);
         fill(255);
         text(i + " " + j + " " + k, 5, 0); */

        thisg.popMatrix();
      }
    }
  }
}
