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
color yellow, cream, blue;

ArrayList<Ball> balls = new ArrayList<Ball>();

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
  yellow = color(225,218,0);
  blue = color (0,193,255);
  cream = color (248, 245, 203);
}

void draw() {
  background(0);
  waveform.analyze();
  drawGradient(amp.analyze());
  if (amp.analyze()<0.1){
    stroke(blue); //waveform blue, rectangle cream
    tracker.setColor(color(yellow));
  }
  else if (0.1<amp.analyze() && amp.analyze()<0.3){
    stroke(cream); //waveform cream, rectangle yellow
     tracker.setColor(color(blue));
  }
  else if (amp.analyze()>0.3){
    stroke(yellow); //waveform yellow, rectangle blue
    tracker.setColor(color(cream));
  }
  doingTheWaveform(); 
  // Run the tracking analysis
  tracker.track();
  // Show the image
  tracker.display();
  
  for(int i =0; i<balls.size(); i++){
    balls.get(i).run();
    if(balls.get(i).isDead() == false){
      balls.remove(i);
    }
  }
}

void drawGradient(float a){
  if (a<0.1){
    fill(cream);
  }
  else if (0.1<a && a<0.3){
    fill(yellow);
  }
  else if (a>0.3){
    fill(blue);
    Ball b = new Ball(new PVector(0,0), color(255));
    balls.add(b);
    Ball b2 = new Ball(new PVector(width,0), color(255));
    balls.add(b2);
    Ball b3= new Ball(new PVector(0,height), color(255));
    balls.add(b3);
    Ball b4 = new Ball(new PVector(width,height), color(255));
    balls.add(b4);
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
  println(balls.size());
}
