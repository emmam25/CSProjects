import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
KinectManager kinectManager;
Particle particle;

void setup() {
  fullScreen();
  kinectManager = new KinectManager(this);
  particle = new Particle(new PVector(0,0));
}
void draw() {
  kinectManager.run();
  kinectManager.assignVectorField();
  particle.run();
}
