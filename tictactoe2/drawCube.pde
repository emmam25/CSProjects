void drawCube() {
  for (int i = 0; i<4; i++) {
    for (int j = 0; j<4; j++) {
      for (int k =0; k<4; k++) {
        if (mouseX>((i-1.5)*20)-4 && mouseX<(i-1.5)*20+4 && mouseY>((j-1.5)*20)-4 && mouseY<(j-1.5)*20+4) {
          fill(0, 255, 0, 100);
        } else if (cubes[i][j][k] == 0) {
          fill(255, 255, 255, 30);
        } else if (cubes[i][j][k] == 2) {
          fill(orange);
        } else if (cubes[i][j][k] == 3) {
          fill(purple);
        }
        pushMatrix();
        translate((i-1.5)*20, (j-1.5)*20, ((k-1.5)*20));
        box(8);
     //   textSize(3);
     //   fill(255);
     //   text(i + " " + j + " " + k, 5, 0);
        popMatrix();
      }
    }
  }
}
