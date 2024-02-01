int num = 10;
Point[][] points = new Point[num][num];
int panelWidth = 2;
PImage img;
void setup() {
  size(800, 800, P3D);
  img = loadImage("shadowman.jpg");
  for (int i = 0; i<num; i++) {
    for (int j = 0; j<num; j++) {
      Point p = new Point(new PVector(map(i, 0, num-1, -200, 200), map(j, 0, num-1, -200, 200)), new PVector(0, 0), new PVector(0, 0));
      points[i][j] = p;
    }
  }
    yMelt();
}
void draw() {
  background(img.pixels[0]);
  noStroke();
  textureMode(NORMAL);
  translate(width/2, height/2);

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

void yMelt() {
  for (int i = 0; i<num; i++) {
    for (int j = 0; j<num; j++) {
      float v = map(j, 0, num, 0, 500) * noise(i);
      float newY = points[i][j].getPos().y+v;
      points[i][j].pos.y = newY;
    }
  }
}
