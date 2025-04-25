import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage canny;

ArrayList<Particle> particles = new ArrayList<Particle>();
void setup() {
  size(500, 500);
  video = new Capture(this, Capture.list()[0], 10);
  opencv = new OpenCV(this, video);

  video.start();
}
void draw() {
  background(0);
  opencv.loadImage(video);
  opencv.findCannyEdges(100, 250);
  canny = opencv.getSnapshot();
  imageMode(CENTER);
  image(canny, width/2, height/2);
  for(int i = 0; i<particles.size(); i++){
    particles.get(i).run();
    if(particles.get(i).pos.y<0){
      particles.remove(i);
    }
  }
}
void keyPressed(){
  generateParticles();
}
void captureEvent(Capture c) { // I don't know what this is but it breaks without it
  c.read();
}
void generateParticles() {
  loadPixels();
  for (int i = 0; i<g.width-1; i+=20) { //increment so we don't get too much
    for (int j = 0; j<g.height-1; j+=20) {
      int index = i+j*width;
      //if it's not black, make confetti
      if (pixels[index] != color(0, 0, 0)) {
        Particle p = new Particle(i,j);
        particles.add(p);
      }
    }
  }
}

class Particle {
  PVector pos;
  PVector vel;
  Particle(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(random(-3, 3), random(-5, -15));
  }
  void run() {
    fill(255);
    noStroke();
    circle(pos.x, pos.y, 5);
    pos.add(vel);
  }
}
