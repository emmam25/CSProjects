/*note - the clicker (for water and ants) might not work
 unless you remove the physical volcano because it will think that
 the volcano is the clicker
 */

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
KinectManager kinectManager;
ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();
PVector clickedPlace, volcanoPlace;
ParticleSystem volcano;
PImage ant;

boolean volcanoOn = true;
boolean vectorsOn = false;
int land = 0; //what mode the land is in


float s; //scale factor for the grid
float gridScale;

void setup() {
  fullScreen();
  colorMode(RGB, 255);
  s=10;
  kinectManager = new KinectManager(this);
  clickedPlace = new PVector(0, 0);
  volcanoPlace = new PVector(0, 0);


  gridScale = map(s, 0, kinectManager.kinect.width, 0, width);
  volcano = new ParticleSystem(new PVector(0, 0), "volcano");
  systems.add(volcano);

  ant = loadImage("ant.png");
  ant.resize(40, 28);
}
void draw() {
  kinectManager.run();
  if (land == 0) {
    kinectManager.allGrey();
  } else if (land == 1) {
    kinectManager.rainbow();
  } else if (land == 2) {
    kinectManager.grayScale();
  }
  kinectManager.assignVectorField();
  if (vectorsOn) {
    showVectors();
  }
  for (ParticleSystem s : systems) {
    s.runParticles();
  }

  volcanoPlace.x =kinectManager.findVolcano().x*(width/(float)(kinectManager.kinect.width/s));
  volcanoPlace.y = kinectManager.findVolcano().y*(height/(float)(kinectManager.kinect.height/s));
  if (volcanoPlace.x != -1) {
    volcano.move(volcanoPlace);
  }
}

void mouseClicked() {
  ParticleSystem system = new ParticleSystem(new PVector(mouseX, mouseY), "water");
  systems.add(system);
}

void keyPressed() {

  if (key == ' ') {
    fill(255);
    clickedPlace.x =kinectManager.findClicker().x*(width/(float)kinectManager.kinect.width);
    clickedPlace.y = kinectManager.findClicker().y*(height/(float)kinectManager.kinect.height);
    if (clickedPlace.x != -1) {
      ParticleSystem system = new ParticleSystem(new PVector(clickedPlace.x, clickedPlace.y), "water");
      systems.add(system);
    }
  } else if (key == 'a') {
    fill(255);
    clickedPlace.x =kinectManager.findClicker().x*(width/(float)kinectManager.kinect.width);
    clickedPlace.y = kinectManager.findClicker().y*(height/(float)kinectManager.kinect.height);
    if (clickedPlace.x != -1) {
      ParticleSystem system = new ParticleSystem(new PVector(clickedPlace.x, clickedPlace.y), "ant");
      systems.add(system);
    }
  } else if (key == 'v') {
    if (volcanoOn) {
      volcanoOn = false;
      systems.remove(volcano);
    } else {
      volcanoOn = true;
      systems.add(volcano);
    }
  } else if (keyCode == RIGHT) {
    land ++;
    if (land>2) {
      land = 0;
    }
  } else if (keyCode == '/') {
    if (vectorsOn) {
      vectorsOn = false;
    } else {
      vectorsOn = true;
    }
  } else if (key == 'r') {
    systems.clear();
    volcanoOn = false;
  }
}

void showVectors() {
  for (int i = 0; i<kinectManager.gridImage.width; i++) {
    for (int j = 0; j<kinectManager.gridImage.height; j++) {
      int index = i + (j *kinectManager.gridImage.width);
      PVector here = kinectManager.vectorArray[index];
      pushMatrix();
      translate(i*gridScale, j*gridScale);
      rotate(here.heading());
      stroke(255);
      strokeWeight(1);
      line(-3, 0, 3, 0);
      circle(3, 0, 2);
      popMatrix();
    }
  }
}
