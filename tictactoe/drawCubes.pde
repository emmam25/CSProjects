void drawCubes() {
  for (int i = 0; i<4; i++) {
    for (int j = 0; j<4; j++) {
      for (int k =0; k<4; k++) {
 
        if (i == (int)selector.x && j == (int)selector.y && k == (int)selector.z) {
          fill(0, 255, 0, 100);
        } else if (cubes[i][j][k] == 0) {
          fill(255, 255, 255, 30);
        } else if (cubes[i][j][k] == 2) {
          fill(orange);
        } else if (cubes[i][j][k] == 3) {
          fill(purple);
        }
        
        pushMatrix();
        //I am translating like this so that the 
        //central axis is the center of the cube
        translate((i-1.5)*20, (j-1.5)*20, ((k-1.5)*20));
        box(8);
        
        //this displays the index of each cube to the right of it
     //   textSize(3);
     //   fill(255);
     //   text(i + " " + j + " " + k, 5, 0);
     
        popMatrix();
      }
    }
  }
}
