import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
KinectManager kinectManager;
ArrayList<Particle> particles;

float s; //scale factor for the grid
float gridScale;

void setup() {
  fullScreen();
  colorMode(RGB, 255);
  s=10;
  kinectManager = new KinectManager(this);
  particles = new ArrayList<Particle>();
  for (int i = 0; i<20; i++) {
    Particle particle = new Particle(new PVector((width/2)+random(-100,100), (height/2)+random(-100,100)));
    particles.add(particle);
  }
  gridScale = map(s, 0, kinectManager.kinect.width, 0, width);
  println(gridScale);
}
void draw() {
  kinectManager.run();
  kinectManager.assignVectorField();
  for (Particle particle : particles) {
    particle.run();
  }
   showVectors();
}

void showVectors() {
  //ball on the right side
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
