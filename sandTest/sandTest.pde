import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;
KinectManager kinectManager;


float screenGridIncrement;
float imageGridIncrement;


void setup() {
  fullScreen();
  kinectManager = new KinectManager(this);
  screenGridIncrement = 15;
  imageGridIncrement = screenGridIncrement * kinectManager.kinect.width/width;
}
void draw() {
  kinectManager.drawRiver();
  for(int i = 0; i<width; i+=screenGridIncrement){
    stroke(0,255,0);
    line(i, 0, i, height);
    line(0, i, width, i);
  }
}

void keyPressed(){
  kinectManager.keyPressed();
}
