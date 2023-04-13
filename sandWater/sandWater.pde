import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
KinectManager kinectManager;
ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();
PVector clickedPlace, volcanoPlace;
ParticleSystem volcano;


float s; //scale factor for the grid
float gridScale;
String mode = "water";

void setup() {
  fullScreen();
  colorMode(RGB, 255);
  s=10;
  kinectManager = new KinectManager(this);
  clickedPlace = new PVector(0, 0);
  volcanoPlace = new PVector(0, 0);


  gridScale = map(s, 0, kinectManager.kinect.width, 0, width);
  if (mode == "volcano") {
    volcano = new ParticleSystem(new PVector(0, 0));
    systems.add(volcano);
  }
}
void draw() {
  kinectManager.run();
  // kinectManager.mountains();
  //kinectManager.rainbow();
  //kinectManager.grayScale();
  kinectManager.allGrey();
  kinectManager.assignVectorField();
  showVectors();
  for (ParticleSystem s : systems) {
    s.runParticles();
  }

  if (mode == "volcano") {
    volcanoPlace.x =kinectManager.findVolcano().x*(width/(float)(kinectManager.kinect.width/s));
    volcanoPlace.y = kinectManager.findVolcano().y*(height/(float)(kinectManager.kinect.height/s));
    if (volcanoPlace.x != -1) {
      volcano.move(volcanoPlace);
    }
  }
}

void mouseClicked() {
  ParticleSystem system = new ParticleSystem(new PVector(mouseX, mouseY));
  systems.add(system);
}

void keyPressed() {
  if (mode == "water") {
    if (key == ' ') {
      fill(255);
      clickedPlace.x =kinectManager.findClicker().x*(width/(float)kinectManager.kinect.width);
      clickedPlace.y = kinectManager.findClicker().y*(height/(float)kinectManager.kinect.height);
      if (clickedPlace.x != -1) {
        ParticleSystem system = new ParticleSystem(new PVector(clickedPlace.x, clickedPlace.y));
        systems.add(system);
      }
    }
  }
  if (key == 'r') {
    systems.clear();
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
