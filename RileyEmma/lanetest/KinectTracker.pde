class KinectTracker {
  Kinect kinect;
  int minDepth, maxDepth;
  int lane;
  int[] depth;
  PImage display;
  PApplet p;


  KinectTracker(PApplet p) {
    minDepth = 30;
    maxDepth = 850;
    kinect = new Kinect(p);
    kinect.initDepth();

    display = new PImage(kinect.width, kinect.height);
  }

  void display() {
    int[] rawDepth = kinect.getRawDepth();
    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {
        // mirroring image
        int offset = (kinect.width - x - 1) + y * kinect.width;
        // Raw depth
        int depth = rawDepth[offset];
        int pix = x + y*display.width;
        if (depth > minDepth && depth < maxDepth) {
          // A red color instead
          display.pixels[pix] = color(150, 50, 50);
        } else {
          display.pixels[pix] = color(0);
        }
      }
    }
    display.updatePixels();
    image(display, 0, 0, width, height);
    stroke(255);
    strokeWeight(6);
    line(width/3, 0, width/3, height);
    line(2*width/3, 0, 2*width/3, height);
  }

  String lane() {
    int[] rawDepth = kinect.getRawDepth();
    int leftCount=0;
    int midCount=0;
    int rightCount=0;
    for (int x=0; x<kinect.width; x++) {
      for (int y = 0; y<kinect.height; y++) {
        int offset =  kinect.width- x -1 + y * kinect.width;
        if (rawDepth[offset]>minDepth && rawDepth[offset]<maxDepth) {
          if (x<=kinect.width/3) {
            leftCount++;
          } else if ((x>kinect.width/3) && (x<=2*kinect.width/3)) {
            midCount ++;
          } else if (x>2*kinect.width/3) {
            rightCount++;
          }
        }
      }
    }


    if (leftCount > midCount && leftCount > rightCount) {
      return "LEFT";
    } else if (midCount > leftCount && midCount > rightCount) {
      return "MID";
    } else if (rightCount > leftCount && rightCount > midCount) {
      return "RIGHT";
    }

    return "NONE";
  }
}
