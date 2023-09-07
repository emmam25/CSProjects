import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;

// Depth image
PImage depthImg;

// Which pixels do we care about?
int minDepth =  30;
int maxDepth = 900;

// What is the kinect's angle
float angle;

void setup() {
  fullScreen();

  kinect = new Kinect(this);
  kinect.initDepth();
  angle = kinect.getTilt();

  // Blank image
  depthImg = new PImage(kinect.width, kinect.height);
}

void draw() {
  // Draw the raw image
  //image(kinect.getDepthImage(), 0, 0);

  // Threshold the depth image
  int[] rawDepth = kinect.getRawDepth();
  for (int i=0; i < rawDepth.length; i++) {
    if (rawDepth[i] >= minDepth && rawDepth[i] <= maxDepth) {
      depthImg.pixels[i] = color(123, 150, 156);
    } else {
      depthImg.pixels[i] = color(0, 30);
    }
  }

  // Draw the thresholded image
  depthImg.updatePixels();
  imageMode(CENTER);
  // Change(depthImg);
  image(depthImg, width/2, height/2, width, height);
}
