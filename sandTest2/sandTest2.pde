import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
KinectManager kinectManager;
ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();


float s; //scale factor for the grid
float gridScale;

void setup() {
  fullScreen();
  colorMode(RGB, 255);
  s=10;
  kinectManager = new KinectManager(this);


  gridScale = map(s, 0, kinectManager.kinect.width, 0, width);
  println(gridScale);
}
void draw() {
  kinectManager.run();
  kinectManager.rainbow();
  kinectManager.assignVectorField();
  showVectors();
  for(ParticleSystem s: systems){
    s.runParticles();
  }
}

void mouseClicked(){
  ParticleSystem system = new ParticleSystem(new PVector(mouseX, mouseY));
  systems.add(system);
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
