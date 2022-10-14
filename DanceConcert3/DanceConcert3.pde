import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import processing.sound.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;
int n;
float r, b, g;

SoundFile song;
AudioIn in;
Amplitude amp;
Waveform waveform;
int songs = 100;

void setup() {
  fullScreen();
  kinect = new Kinect(this);
  tracker = new KinectTracker();
   in = new AudioIn(this, 0);
   amp = new Amplitude(this);
  amp.input(in);
  waveform = new Waveform(this, songs);
  waveform.input(in);
 // song.loop();
}

void draw() {
  background(255);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();

  //draw the raw location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  //ellipse(v1.x, v1.y, 20, 20);
}
