import org.openkinect.freenect.*;
import org.openkinect.processing.*;

KinectTracker kt = new KinectTracker(this);
PVector character;

void setup(){
  size(displayWidth, displayHeight);
  //character =  new PVector(width/2,  height/2);
}
void draw(){
  kt.display();
  fill(255);
  text(kt.lane(), 100,100);
}
