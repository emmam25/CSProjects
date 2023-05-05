PVector pos;
int size;

PGraphics side1, side2, side3, side4, side5, side6;

float theta = -2.5;
float phi = 1.5;
float angleX = -5.5;

float thetaV, phiV, angleXV;
float xV, yV, zV;

Ball ball;
Display1 display1;
Display2 display2;
Display3 display3;

void setup() {
  size(displayWidth, displayHeight, P3D);
  pos = new PVector(width/2, height/2, 0);
  size =300;
  imageMode(CENTER);

  side1 = createGraphics(size, size, P3D);
  side2 = createGraphics(size, size, P3D);
  side3 = createGraphics(size, size, P3D);
  side4 = createGraphics(size, size, P3D);
  side5 = createGraphics(size, size, P3D);
  side6 = createGraphics(size, size, P3D);
  ball = new Ball (new PVector (20, 20), new PVector (3, 2));
  display1 = new Display1();
  display2 = new Display2();
  display3 = new Display3();
}
void draw() {
  background(255);

  //lights();
  imageMode(CENTER);
  rectMode(CENTER);

  ball.display(side1);
  display1.display(side2);
  display2.display(side3);
  display3.display(side4);
  display2.display(side5);
  display1.display(side6);


  pushMatrix();
  translate(pos.x, pos.y, pos.z);
  rotateZ(phi);
  rotateY(theta);
  rotateX(angleX);
  fill(255);
  box(size-1);


  //side 1
  pushMatrix();
  translate(0, 0, size/2);
  fill(255, 0, 0);
  image(side1, 0, 0, size, size);
  popMatrix();

  //side 2
  pushMatrix();
  fill(0, 255, 0);
  translate(0, 0, -size/2);
  image(side2, 0, 0, size, size);
  popMatrix();

  //side 3
  pushMatrix();
  fill(0, 0, 255);
  translate(0, size/2, 0);
  rotateX(PI/2);
  image(side3, 0, 0, size, size);
  popMatrix();

  //side 4
  pushMatrix();
  fill(255, 255, 0);
  translate(0, -size/2, 0);
  rotateX(PI/2);
  image(side4, 0, 0, size, size);
  popMatrix();

  //side 5
  pushMatrix();
  fill(0, 255, 255);
  translate(size/2, 0, 0);
  rotateY(PI/2);
  image(side5, 0, 0, size, size);
  popMatrix();

  //side 6
  pushMatrix();
  fill(255, 0, 255);
  translate(-size/2, 0, 0);
  rotateY(PI/2);
  image(side6, 0, 0, size, size);
  popMatrix();



  popMatrix();
  
  theta +=thetaV;
  phi+=phiV;
  angleX+=angleXV;
  
  pos.x+=xV;
  pos.y+=yV;
  pos.z+=zV;
}

void drawRectangle(PVector position, PImage texture) {
  pushMatrix();
  translate(position.x, position.y, position.z);
  image(texture, 0, 0, 100, 100);
  popMatrix();
}

void keyPressed() {
  float aV = 0.1; //velocity for angles
  float pV = 5; //velocity for position variables
  if (keyCode == UP) {
    yV = -pV;
  } else if (keyCode == DOWN) {
    yV = pV;
  } else if (keyCode == RIGHT) {
    xV = pV;
  } else if (keyCode == LEFT) {
    xV = -pV;
  } else if (key == ','){
    zV = pV;
  } else if (key == '.'){
    zV = -pV;
  }else if (key == 'w') {
    thetaV = aV;
  } else if (key == 's') {
    thetaV -=aV;
  } else if (key == 'a') {
    phiV =aV;
  } else if (key == 'd') {
    phiV= -aV;
  } else if (key == 'z') {
    angleXV=aV;
  } else if (key == 'x') {
    angleXV=-aV;
  }
}

void keyReleased(){
  thetaV = 0;
  phiV = 0;
  angleXV =0;
  xV =0;
  yV = 0;
  zV = 0;
}
