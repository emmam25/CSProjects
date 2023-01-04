class KinectTracker {
  Kinect kinect;
  int minDepth, maxDepth;

  int[] depth;
  PImage display;
  PApplet p;

  int ducklineY;
  int jumplineY;


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

        int depth = rawDepth[offset];
        int pix = x + y*display.width;
        if (depth > minDepth && depth < maxDepth) {

          display.pixels[pix] = color(150, 50, 50, 200);
        } else {
          display.pixels[pix] = color(0,0,0,1);
        }
      }
    }
    display.updatePixels();
    image(display, 0, 0, width, height);
    /*these lines show you which lane to be in 
    and where to jump and duck*/
    stroke(255);
    strokeWeight(6);
    line(width/3, 0, width/3, height);
    line(2*width/3, 0, 2*width/3, height);
    stroke(0, 255, 0);
    line(0, ducklineY, width, ducklineY);
    stroke(255,0,0);
    line(0,jumplineY, width, jumplineY);
  }
  
  //this function returns the lane you are in
  String lane() {
    int[] rawDepth = kinect.getRawDepth();
    int leftCount=0;
    int midCount=0;
    int rightCount=0;
    //count how many pixels are in each lane
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

    //whichever lane has the most pixels is the one you are in
    if (leftCount > midCount && leftCount > rightCount) {
      return "LEFT";
    } else if (midCount > leftCount && midCount > rightCount) {
      return "MID";
    } else if (rightCount > leftCount && rightCount > midCount) {
      return "RIGHT";
    }

    return "NONE";
  }

  //returns whether you ducked or not
  boolean ducked() {
    int[] rawDepth = kinect.getRawDepth();
    int upPixels=0;

    for (int x=0; x<kinect.width; x++) {
      for (int y = 0; y<kinect.height; y++) {
        int offset =  kinect.width- x -1 + y * kinect.width;
        if (rawDepth[offset]>minDepth && rawDepth[offset]<maxDepth) {
          if (y<=ducklineY/(width/kt.kinect.width)) {
            upPixels++;
          }
        }
      }
    }
    //if there are many pixels above the duck line you have not ducked
    return upPixels<100;
  }

  boolean jumped() {
    int[] rawDepth = kinect.getRawDepth();
    int upPixels=0;

    for (int x=0; x<kinect.width; x++) {
      for (int y = 0; y<kinect.height; y++) {
        int offset =  kinect.width- x -1 + y * kinect.width;
        if (rawDepth[offset]>minDepth && rawDepth[offset]<maxDepth) {
          if (y<=jumplineY/(width/kt.kinect.width)) {
            upPixels++;
          }
        }
      }
    }
    //if there are enough pixels above the jump line you have jumped
    return upPixels>500;
  }
}
