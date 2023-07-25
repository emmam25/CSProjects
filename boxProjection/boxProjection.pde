PVector pos;
int size;

PGraphics side1, side2, side3, side4, side5, side6;

float theta = -2.5;
float phi = 1.5;
float angleX = -5.5;

float thetaV, phiV, angleXV;
float xV, yV, zV;

int selected;

ArrayList<joe> points = new ArrayList<joe>();
joe v1, v2, v3, v4;
polygon poly1;

Display1 display1;
Display2 display2;
Display3 display3;

PGraphics clickTracker;

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

  display1 = new Display1();
  display2 = new Display2();
  display3 = new Display3();

  v1 = new joe (0, 0);
  points.add(v1);
  v2 = new joe (size, 0);
  points.add(v2);
  v3 = new joe (size, size);
  points.add(v3);
  v4 =  new joe (0, size);
  points.add(v4);

  ArrayList<joe> points1 = new ArrayList<joe>();
  points1.add(v1);
  points1.add(v2);
  points1.add(v3);
  points1.add(v4);
  poly1 = new polygon(points1); //vertices 1-4

  clickTracker = createGraphics(width, height, P3D);
}
void draw() {
  background(255);

  //lights();
  imageMode(CORNER);
  rectMode(CORNER);
  shapeMode(CORNER);

  //draw the displays to the pgraphics objects
  ArrayList<PGraphics> one = new ArrayList<PGraphics>();
  one.add(side2);
  one.add(side1);
  display1.display(one);
  ArrayList<PGraphics> two = new ArrayList<PGraphics>();
  two.add(side3);
  two.add(side4);
  display2.display(two);
  ArrayList<PGraphics> three = new ArrayList<PGraphics>();
  three.add(side5);
  three.add(side6);
  display3.display(three);

  //poly1.showShape(side1);
  pushMatrix();
  translate(pos.x, pos.y, pos.z);
  rotateZ(phi);
  rotateY(theta);
  rotateX(angleX);
  fill(255);
  
  
  box(size-1);


  //side 1
  pushMatrix();
  fill(0, 255, 0);
  translate(-size/2, -size/2, size/2);
  image(side2, 0, 0, size, size);
  popMatrix();
  
  //side 2
  pushMatrix();
  fill(0, 255, 0);
  translate(-size/2, -size/2, -size/2);
  image(side2, 0, 0, size, size);
  popMatrix();

  //side 3
  pushMatrix();
  fill(0, 0, 255);
  translate(-size/2, size/2, -size/2);
  rotateX(PI/2);
  image(side3, 0, 0, size, size);
  popMatrix();

  //side 4
  pushMatrix();
  fill(255, 255, 0);
  translate(-size/2, -size/2, -size/2);
  rotateX(PI/2);
  image(side4, 0, 0, size, size);
  popMatrix();

  //side 5
  pushMatrix();
  fill(0, 255, 255);
  translate(size/2, -size/2, size/2);
  rotateY(PI/2);
  image(side5, 0, 0, size, size);
  popMatrix();

  //side 6
  pushMatrix();
  fill(255, 0, 255);
  translate(-size/2, -size/2, size/2);
  rotateY(PI/2);
  image(side6, 0, 0, size, size);
  popMatrix();


  popMatrix();

  /*for (int i = 0; i<points.size(); i++) {
    points.get(i).drawCube(clickTracker, i);
    if (selected == i) {
      points.get(i).drawCube(g, color(0, 255, 0));
    } else {
      points.get(i).drawCube(g, i);
    }
  }
*/
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
    if (selected != -1) {
      points.get(selected).pos.y-=10;
    } else {
      yV = -pV;
    }
  } else if (keyCode == DOWN) {
    if (selected != -1) {
      points.get(selected).pos.y+=10;
    } else {
      yV = pV;
    }
  } else if (keyCode == RIGHT) {
    if (selected != -1) {
      points.get(selected).pos.x+=10;
    } else {
      xV = pV;
    }
  } else if (keyCode == LEFT) {
    if (selected != -1) {
      points.get(selected).pos.x-=10;
    } else {
      xV = -pV;
    }
  } else if (key == ',') {
    zV = pV;
  } else if (key == '.') {
    zV = -pV;
  } else if (key == 'w') {
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
  } else if (key == '4') {
    println("theta " + theta);
    println("phi " + phi);
    println("angleX " + angleX);
    println("pos " + pos);
  }
}

void keyReleased() {
  thetaV = 0;
  phiV = 0;
  angleXV =0;
  xV =0;
  yV = 0;
  zV = 0;
}

void mouseClicked() {
  boolean foundSomething = false;
  clickTracker.loadPixels();
  int index = mouseY*width + mouseX;
  for (int i = 0; i<points.size(); i++) {
    if (clickTracker.pixels[index] == color(i)) {
      selected = i;
      println(selected);
      foundSomething = true;
    }
  }
  if (!foundSomething) {
    selected = -1;
  }
}
