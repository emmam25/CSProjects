PVector pos;
float size;
float xRot, yRot, zRot;
void setup() {
  size(displayWidth, displayHeight, P3D);
  pos = new PVector(width/2, height/2, 0);
  size =100;
  imageMode(CENTER);
}
void draw() {
  background(255);
  //lights();
  pushMatrix();
  translate(pos.x, pos.y, pos.z);
  rotateX(xRot);
  rotateY(yRot);
  rotateZ(zRot);

  //side 1
  beginShape();
  fill(255, 0, 0);
  vertex(0, 0);
  vertex(size, 0);
  vertex(size, size);
  vertex(0, size);
  endShape(CLOSE);

  //side 2
  beginShape();
  fill(255, 255, 0);
  vertex(0, 0);
  vertex(0, 0, size);
  vertex(0, size, size);
  vertex(0, size, 0);
  endShape(CLOSE);

  //side 3
  beginShape();
  fill(255, 0, 255);
  vertex(0, 0);
  vertex(size, 0);
  vertex(size, 0, size);
  vertex(0, 0, size);
  endShape(CLOSE);

  //side 4
  beginShape();
  fill(0, 255, 0);
  vertex(0, size, 0);
  vertex(0, size, size);
  vertex(size, size, size);
  vertex(size, size, 0);
  endShape(CLOSE);

  //side 5
  beginShape();
  fill(0, 0, 255);
  vertex(size, 0, 0);
  vertex(size, size, 0);
  vertex(size, size, size);
  vertex(size, 0, size);
  endShape();




  popMatrix();
}

void drawRectangle(PVector position, PImage texture) {
  pushMatrix();
  translate(position.x, position.y, position.z);
  image(texture, 0, 0, 100,100);
  popMatrix();
}

void keyPressed() {
  if (keyCode == UP) {
    pos.y-=5;
  } else if (keyCode == DOWN) {
    pos.y+=5;
  } else if (keyCode == RIGHT) {
    pos.x+=5;
  } else if (keyCode == LEFT) {
    pos.x-=5;
  } else if (key == 'g') {
    size+=5;
  } else if (key == 'h') {
    size-=5;
  } else if (key == 'j') {
    xRot+=PI/6;
  } else if (key == 'k') {
    yRot +=PI/6;
  } else if (key == 'l') {
    zRot +=PI/6;
  }
}
