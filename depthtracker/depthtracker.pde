import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import java.util.*;

KinectTracker tracker;
Kinect kinect;


float min, max;

Deque<PImage> past = new ArrayDeque<>();

boolean blank = false;


void setup() {
  fullScreen();

  noCursor();



  kinect = new Kinect(this);
  tracker = new KinectTracker();

}

void draw() {
  background(0);


    // Run the tracking analysis
    tracker.track();
    // Show the image
    image(tracker.display(), 30,30);

}
