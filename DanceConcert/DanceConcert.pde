ArrayList<Scene> scenes;
int current = 1; //current place in the array

BlackScreen scene0;

//change 'YourClass' to the name of your class
YourClass scene1;

void setup() {
  size(displayWidth, displayHeight);
  scenes = new ArrayList<Scene>();
  scene0 = new BlackScreen();
  scene1 = new YourClass(); //change 'YourClass' to the name of your class
  
  scenes.add(scene0);
  scenes.add(scene1);
}
void draw() {
  if (current >=scenes.size()) {
    current = 0;
  }
  scenes.get(current).run();
}

void keyPressed() {
  if (key == '0') {
    scenes.get(current).cleanup();
    current = 0;
  } else if (key == '1') {
    scenes.get(current).cleanup();
    current = 1;
  } else if (key == '2') {
    scenes.get(current).cleanup();
    current = 2;
  } else if (key == '3') {
    scenes.get(current).cleanup();
    current = 3;
  } else if (key == '4') {
    scenes.get(current).cleanup();
    current = 4;
  } else if (key == '5') {
    scenes.get(current).cleanup();
    current = 5;
  } else if (key == '6') {
    scenes.get(current).cleanup();
    current =6;
  } else if (key == '7') {
    scenes.get(current).cleanup();
    current = 7;
  } else if (key == '8') {
    scenes.get(current).cleanup();
    current = 8;
  } else if (key == '9') {
    scenes.get(current).cleanup();
    current = 9;
  } //I will make more of these for !@#$ etc. if we get more than 10 scenes
  else {
    scenes.get(current).keyPressed();
  }
}

void mouseClicked() {
  scenes.get(current).mouseClicked();
}
