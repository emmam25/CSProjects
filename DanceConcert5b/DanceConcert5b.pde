import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import processing.sound.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;

SoundFile song;
Amplitude amp;
Waveform waveform;
AudioIn in;
int songs = 1000;

void setup() {
  fullScreen();
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  println(kinect.width);
  println(kinect.height);
  in = new AudioIn(this);
  in.start();
  amp = new Amplitude(this);
  amp.input(in);
  waveform = new Waveform(this, songs);
  waveform.input(in);
}

void draw() {
  background(0);
  waveform.analyze();
  drawGradient(amp.analyze());
  if (amp.analyze()<0.1){
    stroke(0,193,255); //waveform blue, rectangle cream
    tracker.setColor(color(225,218, 0));
  }
  else if (0.1<amp.analyze() && amp.analyze()<0.3){
    stroke(255,248,220); //waveform cream, rectangle yellow
     tracker.setColor(color(0,193,255));
  }
  else if (amp.analyze()>0.3){
    stroke(225,218,0); //waveform yellow, rectangle blue
    tracker.setColor(color(255,248,220));
  }
  doingTheWaveform(); 
  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();
}

void drawGradient(float a){
  if (a<0.1){
    fill(255,248,220);
  }
  else if (0.1<a && a<0.3){
    fill(225,218,0);
  }
  else if (a>0.3){
    fill(0,193,255);
  }
  noStroke();
  rect(0,0,width/10, height);
  rect(width-(width/10),0,width/10, height);
}
public void doingTheWaveform(){
  beginShape();
  for(int i = 0; i < songs; i++){
    vertex(
      map(i, 0, songs, 0, width+20),
      map(waveform.data[i], -1, 1, 0, 100)
    );
  }
  noFill();
  endShape();
  beginShape();
  for(int i = 0; i < songs; i++){
    vertex(
      map(i, 0, songs, 0, width+20),
      map(waveform.data[i], -1, 1, height-100, height)
    );
  }
  endShape();
}
