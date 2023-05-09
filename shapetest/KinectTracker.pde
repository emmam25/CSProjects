class KinectTracker {
  int threshold = 745;
  PVector loc;
  PVector lerpedLoc;
  int[] depth;
  PImage display;
  Kinect2 kinect2;
  
  KinectTracker(PApplet pa) {    
    kinect2 = new Kinect2(pa);
    kinect2.initDepth();
    kinect2.initDevice();
    display = createImage(kinect2.depthWidth, kinect2.depthHeight, RGB);
    loc = new PVector(0, 0);
    lerpedLoc = new PVector(0, 0);
  }

  void track() {
    depth = kinect2.getRawDepth();
    if (depth == null) return;

    float sumX = 0;
    float sumY = 0;
    float count = 0;

    for (int x = 0; x < kinect2.depthWidth; x++) {
      for (int y = 0; y < kinect2.depthHeight; y++) {
        // Mirroring the image
        int offset = kinect2.depthWidth - x - 1 + y * kinect2.depthWidth;
        int rawDepth = depth[offset];
        if (rawDepth > 0 && rawDepth < threshold) {
          sumX += x;
          sumY += y;
          count++;
        }
      }
    }
    if (count != 0) {
      loc = new PVector(sumX/count, sumY/count);
    }
    lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f);
    lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f);
  }

  PVector getLerpedPos() {
    return lerpedLoc;
  }

  PVector getPos() {
    return loc;
  }

  void display() {
    PImage img = kinect2.getDepthImage();
    if (depth == null || img == null) return;
    display.loadPixels();
    for (int x = 0; x < kinect2.depthWidth; x++) {
      for (int y = 0; y < kinect2.depthHeight; y++) {
        // mirroring image
        int offset = (kinect2.depthWidth - x - 1) + y * kinect2.depthWidth;
        int rawDepth = depth[offset];
        int pix = x + y*display.width;
        if (rawDepth > 0 && rawDepth < threshold) {
          display.pixels[pix] = color(150, 50, 50);
        } else {
          display.pixels[pix] = img.pixels[offset];
        }
      }
    }
    display.updatePixels();
    image(display, 0, 0);
  }

  int getThreshold() {
    return threshold;
  }

  void setThreshold(int t) {
    threshold =  t;
  }
}
