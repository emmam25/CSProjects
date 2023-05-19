PVector pos;
int size;

PGraphics side1;

float theta = -2.5;
float phi = 1.5;
float angleX = -5.5;

float thetaV, phiV, angleXV;
float xV, yV, zV;

int selected;

ArrayList<joe> points = new ArrayList<joe>();
joe v1, v2, v3, v4; //the joes are pickable points
polygon square;

Display1 display1;

PGraphics clickTracker;

void setup() {
  size(displayWidth, displayHeight, P3D);
  pos = new PVector(width/2, height/2, 0);
  size =300;
  imageMode(CENTER);

  side1 = createGraphics(size, size, P3D);

  display1 = new Display1();

  v1 = new joe (50, 50);
  points.add(v1);
  v2 = new joe (50+size, 50);
  points.add(v2);
  v3 = new joe (50+size, 50+size);
  points.add(v3);
  v4 =  new joe (50, 50+size);
  points.add(v4);

  square = new polygon(points);

  clickTracker = createGraphics(width, height, P3D);
}
void draw() {
  background(255);

  //lights();
  imageMode(CENTER);
  rectMode(CENTER);

  //draw the displays to the pgraphics objects
  ArrayList<PGraphics> one = new ArrayList<PGraphics>();
  one.add(side1);
  display1.display(one);


  fill(255, 0, 0);
  square.showShape(side1);


  for (int i = 0; i<points.size(); i++) {
    points.get(i).drawCube(clickTracker, i);
    if (selected == i) {
      points.get(i).drawCube(g, color(0, 255, 0));
    } else {
      points.get(i).drawCube(g, i);
    }
  }
}

void drawRectangle(PVector position, PImage texture) {
  /*  pushMatrix();
   translate(position.x, position.y, position.z);*/
  image(texture, 0, 0, 100, 100);
  //popMatrix();
}

void keyPressed() {
  float aV = 0.1; //velocity for angles
  float pV = 5; //velocity for position variables
  if (keyCode == UP) {
    if (selected != -1) {
      points.get(selected).pos.y-=10;
    }
  } else if (keyCode == DOWN) {
    if (selected != -1) {
      points.get(selected).pos.y+=10;
    }
  } else if (keyCode == RIGHT) {
    if (selected != -1) {
      points.get(selected).pos.x+=10;
    }
  } else if (keyCode == LEFT) {
    if (selected != -1) {
      points.get(selected).pos.x-=10;
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
