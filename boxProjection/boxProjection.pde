import peasy.*;

//wasd <>

PVector pos;
int size;

PGraphics side1, side2, side3, side4;

float theta, phi;

Ball ball;


void setup() {
  size(displayWidth, displayHeight, P3D);
  pos = new PVector(width/2, height/2, 0);
  size =300;
  imageMode(CENTER);

  side1 = createGraphics(size, size, P3D);
  side2 = createGraphics(size,size,P3D);
  ball = new Ball (new PVector (20,20), new PVector (3,2));
}
void draw() {
  background(255);

  //lights();
  imageMode(CENTER);
  rectMode(CENTER);


  ball.display(side1);
  ball.display(side2);

 

  pushMatrix();
  translate(pos.x, pos.y, pos.z);
  rotateZ(phi);
  rotateY(theta);


  //side 1
  pushMatrix();
  translate(0,0,size/2);
  fill(255, 0, 0);
  image(side1, 0, 0, size, size);
  popMatrix();

  //side 2
  pushMatrix();
  fill(0, 255, 0);
  translate(0,0,-size/2);
  image(side2, 0, 0, size, size);
  popMatrix();

  //side 3
  pushMatrix();
  fill(0, 0, 255);
  translate(0,size/2, 0);
  rotateX(PI/2);
  rect(0, 0, size, size);
  popMatrix();

  //side 4
  pushMatrix();
  fill(255, 255, 0);
  translate(0, -size/2, 0);
  rotateX(PI/2);
  rect(0, 0, size, size);
  popMatrix();

  //side 5
  pushMatrix();
  fill(0, 255, 255);
  translate(size/2, 0,0);
  rotateY(PI/2);
  rect(0, 0, size, size);
  popMatrix();

  //side 6
  pushMatrix();
  fill(255, 0, 255);
  translate(-size/2, 0,0);
  rotateY(PI/2);
  rect(0, 0, size, size);
  popMatrix();



  popMatrix();
}

void drawRectangle(PVector position, PImage texture) {
  pushMatrix();
  translate(position.x, position.y, position.z);
  image(texture, 0, 0, 100, 100);
  popMatrix();
}

void keyPressed() {
  if (keyCode == UP) {
    
  } else if (keyCode == DOWN) {
    pos.y+=10;
  } else if (keyCode == RIGHT) {
    pos.x+=10;
  } else if (keyCode == LEFT) {
    pos.x-=10;
  } else if (key == 'w') {
    theta +=0.5;
  } else if (key == 's') {
    theta -=0.5;
  } else if (key == 'a'){
    phi +=0.5;
  } else if (key == 'd'){
    phi -=0.5;
  }
}
