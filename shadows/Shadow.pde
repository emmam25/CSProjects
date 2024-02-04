class Shadow {
  int num = 10;
  Point[][] points = new Point[num][num];
  int panelWidth = 2;
  float r = 200;
  PVector pos;
  Shadow(PVector pos) {
    for (int i = 0; i<num; i++) {
      for (int j = 0; j<num; j++) {
        Point p = new Point(new PVector(map(i, 0, num-1, -r,r), map(j, 0, num-1, -r,r)), new PVector(0, 0), new PVector(0, 0));
        points[i][j] = p;
      }
    }
    this.pos = pos;
    yMelt();
  }
  void run() {
    pushMatrix();
    translate(pos.x, pos.y);

    //need to put vertices in the middle of the rectangle side
    for (int i = 0; i<num-panelWidth; i++) {
      beginShape();
      texture(img);
      //panel top
      for (int k = i; k<i+panelWidth; k++) {
        PVector posHere = points[k][0].getPos();
        vertex(posHere.x, posHere.y, posHere.z, map(k, 0, num-1, 0, 1), 0);
      }
      //panel right side
      for (int j = 0; j<num; j++) {
        PVector posHere = points[i+panelWidth][j].getPos();
        vertex(posHere.x, posHere.y, posHere.z, map(i+panelWidth, 0, num-1, 0, 1), map(j, 0, num-1, 0, 1));
      }
      //panel bottom
      for (int k = i+panelWidth-1; k>=i; k--) {
        PVector posHere = points[k][num-1].getPos();
        vertex(posHere.x, posHere.y, posHere.z, map(k, 0, num-1, 0, 1), 1);
      }
      //panel left side
      for (int j = num-1; j>=0; j--) {
        PVector posHere = points[i][j].getPos();
        vertex(posHere.x, posHere.y, posHere.z, map(i, 0, num-1, 0, 1), map(j, 0, num-1, 0, 1));
      }
      endShape();
    }

    for (int i = 0; i<num; i++) {
      for (int j = 0; j<num; j++) {
        points[i][j].run();
      }
    }
    popMatrix();
  }
  void yMelt() {
    float t = random(1000);
    for (int i = 0; i<num; i++) {
      for (int j = 0; j<num; j++) {
        float v = map(j, 0, num, 100, 500) * noise(t);
        float newY = points[i][j].getPos().y+v;
        points[i][j].pos.y = newY;
      }
      t+=100;
    }
  }


  void zMelt() {
    /*  for (int i = 0; i<num; i++) {
     for (int j = 0; j<num; j++) {
     float farAway = abs(i-num/2) + abs(j-num/2); //distance from the center
     float v = map(farAway, 0, num, 0, -0.01)* noise(farAway);
     points[i][j].setAcc(new PVector(0, 0, v));
     }
     }*/
  }
}
