import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import processing.sound.*;

KinectTracker tracker;
Kinect kinect;

Amplitude amp;
Waveform waveform;
AudioIn in;

int songs = 1000;
color yellow, cream, blue;

float min, max;

Box b;

boolean blank = false;

ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  fullScreen();

  noCursor();

  //change to change color
  yellow = color(225, 218, 0);
  blue = color (99, 138, 240);
  cream = color (248, 245, 203);


  //change to change amplitude threshold
  min = 0.08;
  max = 0.3;



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

  b = new Box(255);
}

void draw() {
  background(0);
  waveform.analyze();
  drawGradient(amp.analyze());
  if (amp.analyze()<min) {
    stroke(blue); //waveform blue, rectangle cream
    tracker.setColor(color(yellow));
    for (Ball b : balls) {
      b.setColor(blue);
    }
  } else if (min<amp.analyze() && amp.analyze()<max) {
    stroke(cream); //waveform cream, rectangle yellow
    for (Ball b : balls) {
      b.setColor(cream);
    }
    Ball b = new Ball(new PVector(0, 0), color(255));
    balls.add(b);
    Ball b2 = new Ball(new PVector(width, 0), color(255));
    balls.add(b2);
    Ball b3= new Ball(new PVector(0, height), color(255));
    balls.add(b3);
    Ball b4 = new Ball(new PVector(width, height), color(255));
    balls.add(b4);
    tracker.setColor(color(blue));
  } else if (amp.analyze()>max) {
    stroke(yellow); //waveform yellow, rectangle blue
    tracker.setColor(color(cream));
    for (Ball b : balls) {
      b.setColor(yellow);
    }
  }
  if (!blank) {
    doingTheWaveform();
    // Run the tracking analysis
    tracker.track();
    // Show the image
    tracker.display();
  }

  b.run();

  if (blank) {
    doingTheWaveform();
  }
  for (int i =0; i<balls.size(); i++) {
    balls.get(i).run();
    if (balls.get(i).isDead() == false) {
      balls.remove(i);
    }
  }
}

void drawGradient(float a) {
  if (a<min) {
    fill(cream);
  } else if (min<a && a<max) {
    fill(yellow);
  } else if (a>max) {
    fill(blue);
  }
  noStroke();
  rect(0, 0, width/10, height);
  rect(width-(width/10), 0, width/10, height);
}
public void doingTheWaveform() {
  beginShape();
  for (int i = 0; i < songs; i++) {
    vertex(
      map(i, 0, songs, 0, width+20),
      map(waveform.data[i], -0.2, 2, 0, 500)
      );
  }
  noFill();
  endShape();
  beginShape();
  for (int i = 0; i < songs; i++) {
    vertex(
      map(i, 0, songs, 0, width+20),
      map(waveform.data[i], -0.2, 2, height-100, height-300)
      );
  }
  endShape();
}

void keyPressed() {
  if (keyCode == UP) {
    b.startIncrement();
  } else if (keyCode == DOWN) {
    b.startDecrement();
  }
}
