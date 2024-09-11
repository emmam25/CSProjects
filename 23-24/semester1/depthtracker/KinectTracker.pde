class KinectTracker {

  // Depth threshold
  int threshold = 1035;

  // Raw location
  PVector loc;

  // Interpolated location
  PVector lerpedLoc;

  // Depth data
  int[] depth;

  // What we'll show the user

  color c;

  KinectTracker() {

    kinect.initDepth();
    kinect.enableMirror(true);

    // Set up the vectors
    loc = new PVector(0, 0);
    lerpedLoc = new PVector(0, 0);
    c=color(255);
  }

  void track() {
    // Get the raw depth as array of integers
    depth = kinect.getRawDepth();

    // Being overly cautious here
    if (depth == null) return;

    float sumX = 0;
    float sumY = 0;
    float count = 0;

    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {

        //    int offset =  x + y*kinect.width; // unmirrored
        int offset = kinect.width - x - 1 + y * kinect.width;
        // Grabbing the raw depth
        int rawDepth = depth[offset];

        // Testing against threshold
        if (rawDepth < threshold) {
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    // As long as we found something
    if (count != 0) {
      loc = new PVector(sumX/count, sumY/count);
    }
  }

  PVector getLerpedPos() {
    return lerpedLoc;
  }

  PVector getPos() {
    return loc;
  }

  PImage display() {
    PImage img = kinect.getDepthImage();
    PImage display = createImage(kinect.width, kinect.height, RGB);

    // Being overly cautious here
    if (depth == null || img == null) return null;

    // Going to rewrite the depth image to show which pixels are in threshold
    // A lot of this is redundant, but this is just for demonstration purposes
    display.loadPixels();
    for (int x = 0; x < kinect.width; x++) {
      for (int y = 0; y < kinect.height; y++) {

        //    int offset =  x + y*kinect.width; // unmirrored
        int offset = kinect.width - x - 1 + y * kinect.width;
        // Raw depth
        int rawDepth = depth[offset];
        int pix = x + y * display.width;
        if (rawDepth < threshold) {
          display.pixels[pix] = color(c);
        } else {
          display.pixels[pix] = color(0);
        }
      }
    }
    display.updatePixels();

    // image(display, width/2, (height/2), width, height);
    return display;
  }

  int getThreshold() {
    return threshold;
  }

  void setThreshold(int t) {
    threshold =  t;
  }
  void setColor(color c) {
    this.c = c;
  }
}
