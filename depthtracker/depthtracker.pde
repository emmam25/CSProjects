import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import java.util.*;
import processing.sound.*;

KinectTracker tracker;
Kinect kinect;

Amplitude amp;
AudioIn in;


float min;

ArrayList<PImage> past = new ArrayList<>();



void setup() {
  fullScreen();

  noCursor();

  in = new AudioIn(this);
  in.start();
  amp = new Amplitude(this);
  amp.input(in);

  kinect = new Kinect(this);
  tracker = new KinectTracker();
  
  min = 0.3;
}

void draw() {
  if(amp.analyze()>min){
    tracker.c = color(255,255,255);
  } else {
    tracker.c = color (255,0,0);
  }

  // Run the tracking analysis
  tracker.track();
  // Show the image

  image(tracker.display(), 0, 300);
  past.add(tracker.display());
  if (past.size()>100) {
    image(past.get(0), width-640, 300);
    past.remove(0);
  }
}
