class KinectManager {
  int[] depth;
  PVector[] vectorArray;
  PImage depthImage, gridImage, display;

  Kinect kinect;

  int min, max;


  KinectManager(PApplet p) {
    kinect = new Kinect(p);
    kinect.initDepth();
    //holds the depth information as an RGB value (0-255)
    depthImage = createImage(kinect.width, kinect.height, RGB);
    //the image being drawn on the screen (any colors)
    display = createImage(kinect.width, kinect.height, RGB);
    min = 710;
    max = 760;
    //holds the forces on each area of the grid
    vectorArray = new PVector[(kinect.width/3) * (kinect.height/3)];
    //holds the depth information averages
    gridImage = createImage(kinect.width, kinect.height, RGB);
  }
  void run() {
    depth = kinect.getRawDepth();
    depthImage.loadPixels();
    for (int i = 0; i<depth.length; i++) {
      float value = map(depth[i], min, max, 0, 255);
      depthImage.pixels[i] = color(value);
    }

    depthImage.updatePixels();
    //assign grid values
    gridImage = new PImage (kinect.width, kinect.height);
    for (int i = 0; i<gridImage.pixels.length; i++) {
      gridImage.pixels[i] = depthImage.pixels[i];
    }
    gridImage.resize(kinect.width/3, kinect.height/3);


    image(depthImage, 0, 0, width, height);
    // image(gridImage, 0, 0, width, height);
  }

  void assignVectorField() {
    for (int i = 0; i<vectorArray.length; i++) {
      vectorArray[i] = new PVector(0, 0, 0);
    }

    for (int i = 0; i<kinect.width/3; i++) {
      for (int j = 0; j<kinect.height/3; j++) {
        float depthHere = gridImage.pixels[i + j*(kinect.width/3)];
        int iStart = max(i-1, 0);
        int iEnd = min(i+1, (kinect.width/3)-1);
        int jStart = max(j-1, 0);
        int jEnd = min(j+1, (kinect.height/3)-1);
        for (int a = iStart; a<iEnd; a++) {
          for (int b = jStart; b<jEnd; b++) {
            float depthThere = gridImage.pixels[a + b*kinect.width/3];
            if (depthThere>depthHere) { //if it's lower/closer to 255
              float force = (depthThere-depthHere)/5; //magnitude of the force
              if ((a>i) && (b>j)) {
                vectorArray[i + j*(kinect.width/3)].x += force*sin(PI/4);
                vectorArray[i + j*(kinect.width/3)].y += force*sin(PI/4);
              } else if ((a>i) && (b<i)) {
                vectorArray[i + j*(kinect.width/3)].x += force*sin(PI/4);
                vectorArray[i + j*(kinect.width/3)].y -= force*sin(PI/4);
              } else if ((a<i) && (b>j)) {
                vectorArray[i + j*(kinect.width/3)].x -= force*sin(PI/4);
                vectorArray[i + j*(kinect.width/3)].y += force*sin(PI/4);
              } else if ((a<i) && (b<j)) {
                vectorArray[i + j*(kinect.width/3)].x -= force*sin(PI/4);
                vectorArray[i + j*(kinect.width/3)].y -= force*sin(PI/4);
                //need to do this better
              } else if (a>i) {
                vectorArray[i + j*(kinect.width/3)].x += force;
              } else if (a<i) {
                vectorArray[i + j*(kinect.width/3)].x -= force;
              } else if (b>j) {
                vectorArray[i + j*(kinect.width/3)].y += force;
              } else if (b<j) {
                vectorArray[i + j*(kinect.width/3)].y -= force;
              }
            }
          }
        }
      }
    }
  }
}
