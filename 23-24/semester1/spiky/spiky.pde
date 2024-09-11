float angle;

void setup() {
  size(displayWidth,displayHeight);
  angle =4;
  stroke(0);
}

void draw() {
  background(0);
  pushMatrix();
  translate(0,height/2);
  for (int j = 0; j<3; j++) {
    translate(200, 0);
    scale(0.90);
    pushMatrix();
    for (int i=0; i<100; i++) {
      fill(255);
      scale(0.99);
      rotate(angle);
      fill(map(i, 0, 100, 100, 255));
      triangle(0, 0, 200, 0, 0, 200);
    }
    popMatrix();
  }
  popMatrix();
  
  pushMatrix();
  translate(width,height/2);
  for (int j = 0; j<3; j++) {
    translate(-200, 0);
    scale(0.9);
    pushMatrix();
    for (int i=0; i<100; i++) {
      fill(255);
      scale(0.99);
      rotate(angle);
      fill(map(i, 0, 100, 100, 255));
      triangle(0, 0, 200, 0, 0, 200);
    }
    popMatrix();
  }

  angle +=0.005;
  popMatrix();
}
