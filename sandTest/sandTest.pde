import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

int[] depth;
PImage display;

Kinect kinect;

int min, max;

int time = 0;

void setup() {
  fullScreen();
  kinect = new Kinect(this);
  kinect.initDepth();
  display = createImage(kinect.width, kinect.height, RGB);
  min = 710;
  max = 760;
}
void draw() {
  depth = kinect.getRawDepth();

  display.loadPixels();
  for (int i = 0; i<depth.length; i++) {
    colorMode(HSB);
    float value = map(depth[i], min, max, 0, 179) + time;
    if(value>179){
      value = value-179;
    }
    display.pixels[i] = color(value, 200, 100);
  }
  display.updatePixels();
  image(display, 0, 0, width, height);
  fill(255);
  text("current min threshold" + min + " current max threshold" + max, 50, 100);
  
  time ++; 
  if (time>179){
    time = 0;
  }
}

void keyPressed() {
  if (keyCode == UP) {
    max+=20;
  } else if (keyCode == DOWN) {
    max-=20;
  } else if (keyCode == RIGHT) {
    min+=20;
  } else if (keyCode == LEFT) {
    min-=20;
  }
}
