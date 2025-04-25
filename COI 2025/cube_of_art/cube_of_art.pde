int side = 800; //size of a side
int scale = 2;
swirlies swirl;
funky_shape shape;
circles circles;
boubakiki bk;
tree tree;
ArrayList<scene> scenes = new ArrayList<scene>();
int selected = -1;

float a, aVel; //angle
int currentCube;

void setup() {
  fullScreen(P3D);
  noCursor();
  swirl =  new swirlies();
  scenes.add(swirl);
  shape = new funky_shape();
  scenes.add(shape);
  bk = new boubakiki();
  scenes.add(bk);
  circles = new circles();
  scenes.add(circles);
  background(255);
  imageMode(CENTER);
  rectMode(CENTER);
}

void draw() {
  swirl.run();
  shape.run();
  circles.run();
  bk.run();

  background(100);
  fill(255);
  pushMatrix();
  translate(width/2, height/2);
  rotateY(a);

  if (selected == -1) {
    //side 0
    pushMatrix();
    translate(0, 0, side/2/scale);
    image(swirl.td, 0, 0, side/scale, side/scale);
    popMatrix();

    //side 1
    pushMatrix();
    translate(-side/2/scale, 0, 0);
    rotateY(PI/2);
    image(shape.td, 0, 0, side/scale, side/scale);
    popMatrix();

    //side 2
    pushMatrix();
    translate(0, 0, -side/2/scale);
    image(bk.td, 0, 0, side/scale, side/scale);
    popMatrix();

    //side 3
    pushMatrix();
    translate(side/2/scale, 0, 0);
    rotateY(PI/2);
    image(circles.td, 0, 0, side/scale, side/scale);

    popMatrix();
  } else {
    background(0);
    image(scenes.get(selected).td, 0, 0, height, height);
  }
  popMatrix();
  a+=aVel;

  float s = sin(a+PI/6);
  float c = cos(a+PI/6);
  if (s>0 && c>0) {
    currentCube = 0;
  } else if (s>0 && c<0) {
    currentCube = 1;
  } else if (s<0 && c<0) {
    currentCube = 2;
  } else if (s<0 && c>0) {
    currentCube = 3;
  }

 /* fill(0);
  text(a, 50, 50);
  text(currentCube, 50, 100);*/
}


void keyPressed() {
  if (keyCode == RIGHT && selected == -1) {
    aVel = -0.1;
  } else if (keyCode == LEFT && selected == -1) {
    aVel = 0.1;
  } else if (key == ' ') {
    if (selected == -1) {
      selected = currentCube;
      a = 0;
    } else {
      a = selected *PI/2;
      selected = -1;
    }
  }
}
void keyReleased() {
  aVel = 0;
}
