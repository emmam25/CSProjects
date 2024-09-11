import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;

// Depth image
PImage display;
PImage factory, windows;
PImage boardroom;

// Which pixels do we care about?
int minDepth =  30;
int maxDepth = 960;

int num = 20;
Point[][] points = new Point[num][num];
int panelWidth = 2;

void setup() {
  size(displayWidth, displayHeight, P3D);

  kinect = new Kinect(this);
  kinect.initDepth();

  display = new PImage(kinect.width, kinect.height);
  factory = loadImage("factory.jpeg");
  factory.resize(display.width, display.height);
  windows = loadImage("windows.png");
  windows.resize(display.width, display.height);
  boardroom = loadImage("boardroom.png");
  boardroom.resize(display.width, display.height);
  noCursor();

  for (int i = 0; i<num; i++) {
    for (int j = 0; j<num; j++) {
      Point p = new Point(new PVector(map(i, 0, num-1, 0, width), map(j, 0, num-1, 0, height)), new PVector(0, 0), new PVector(0, 0));
      points[i][j] = p;
    }
  }
}

void draw() {
  int[] depth = kinect.getRawDepth();
  // Threshold the depth image
  display.loadPixels();
  for (int x = 0; x < kinect.width; x++) {
    for (int y = 0; y < kinect.height; y++) {


      /******* mirror or unmirror**/

      //    int offset =  x + y*kinect.width;
      int offset = kinect.width - x - 1 + y * kinect.width;

      /********/

      // Raw depth
      int rawDepth = depth[offset];
      int pix = x + y * display.width;
      if (rawDepth < maxDepth && rawDepth>minDepth) {
        display.pixels[pix] = color(0);
      } else {
        //display.pixels[pix] = color(255,255,255,50);
        display.pixels[pix] = windows.pixels[pix];
      }
    }
  }

  // Draw the thresholded image
  display.updatePixels();
  // image(display, 0, 0, width, height);

  textureMode(NORMAL);
  noStroke();

  //need to put vertices in the middle of the rectangle side
  for (int i = 0; i<num-panelWidth; i++) {
    beginShape();
    texture(display);
    //panel top
    for (int k = i; k<i+panelWidth; k++) {
      PVector posHere = points[k][0].getPos();
      vertex(posHere.x, posHere.y, map(k, 0, num-1, 0, 1), 0);
    }
    //panel right side
    for (int j = 0; j<num; j++) {
      PVector posHere = points[i+panelWidth][j].getPos();
      vertex(posHere.x, posHere.y, map(i+panelWidth, 0, num-1, 0, 1), map(j, 0, num-1, 0, 1));
    }
    //panel bottom
    for (int k = i+panelWidth-1; k>=i; k--) {
      PVector posHere = points[k][num-1].getPos();
      vertex(posHere.x, posHere.y, map(k, 0, num-1, 0, 1), 1);
    }
    //panel left side
    for (int j = num-1; j>=0; j--) {
      PVector posHere = points[i][j].getPos();
      vertex(posHere.x, posHere.y, map(i, 0, num-1, 0, 1), map(j, 0, num-1, 0, 1));
    }
    endShape();
  }

  for (int i = 0; i<num; i++) {
    for (int j = 0; j<num; j++) {
      points[i][j].run();
    }
  }
}
void keyPressed() {
  if (key == 'y') {
    yMelt();
  }
}

void yMelt() {
  for (int i = 0; i<num; i++) {
    for (int j = 0; j<num; j++) {
      float farAway = j ; //distance from the top
      float v = map(farAway, 0, num, 0, 0.005) * noise(i);
      points[i][j].setAcc(new PVector(0, v, 0));
    }
  }
}
