ArrayList<Scene> scenes = new ArrayList<Scene>();
int current =0;
void setup() {
  fullScreen();
  scenes.add(new Blank()); //0) black screen
  scenes.add(new Dolls()); // 1) space bar for creepy doll
  scenes.add(new FlyingImage()); // 2) space bar to blur marlborough
  scenes.add(new Splatter()); // 3) space bar to splatter blood
  scenes.add(new Girl()); //4) up arrow to fade in girl, down arrow to fade out
  scenes.add(new Fog()); // 5) r,g,w to change color
  scenes.add(new Climb()); // 6) climbing hands, runs by itself
  noCursor();
}
void draw() {
  scenes.get(current).run();
  if (scenes.get(current).done) {
    scenes.get(current).done = false;
    cleanup();
    background(0);
    current++;
    check();
    scenes.get(current).initialize();
  }
}
void keyPressed() {
  if (key == '0') {
    cleanup();
    background(0);
    current = 0;
    check();
    scenes.get(current).initialize();
  } else if (key == '1') {
    cleanup();
    background(0);
    current = 1;
    check();
    scenes.get(current).initialize();
  } else if (key == '2') {
    cleanup();
    background(0);
    current = 2;
    check();
    scenes.get(current).initialize();
  } else if (key == '3') {
    cleanup();
    background(0);
    current = 3;
    check();
    scenes.get(current).initialize();
  } else if (key == '4') {
    cleanup();
    background(0);
    current = 4;
    check();
    scenes.get(current).initialize();
  } else if (key == '5') {
    cleanup();
    background(0);
    current = 5;
    check();
    scenes.get(current).initialize();
  } else if (key == '6') {
    cleanup();
    background(0);
    current =6;
    check();
    scenes.get(current).initialize();
  } else if (key == '7') {
    cleanup();
    background(0);
    current = 7;
    check();
    scenes.get(current).initialize();
  } else if (key == '8') {
    cleanup();
    background(0);
    current = 8;
    check();
    scenes.get(current).initialize();
  } else if (key == '9') {
    cleanup();
    background(0);
    current = 9;
    check();
    scenes.get(current).initialize();
  } else if (key == '!') {
    cleanup();
    background(0);
    current = 10;
    check();
    scenes.get(current).initialize();
  } else if (key == '!') {
    cleanup();
    background(0);
    current = 10;
    check();
    scenes.get(current).initialize();
  } else if (key == '@') {
    cleanup();
    background(0);
    current = 0;
    check();
    scenes.get(current).initialize();
  } else if (key == '#') {
    cleanup();
    background(0);
    current = 12;
    check();
    scenes.get(current).initialize();
  } else if (key =='$') {
    cleanup();
    background(0);
    current = 13;
    check();
    scenes.get(current).initialize();
  }//I will make more of these for !@#$ etc. if we get more than 10 scenes
  else {
    scenes.get(current).keyPressed();
  }
}
void check() { //go back to blank screen if there's no scene
  if (current >=scenes.size()) {
    current = 0;
  }
}
void cleanup() { // reset everything
  background(0);
  stroke(0);
  fill(255);
  strokeWeight(1);
  noTint();
  ellipseMode(CENTER);
  rectMode(CORNER);
  imageMode(CORNER);
  strokeJoin(MITER);
  strokeCap(ROUND);
  colorMode(RGB);
  noLights();
  textMode(MODEL);
  blendMode(BLEND);
}
