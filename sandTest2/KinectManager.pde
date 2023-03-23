class KinectManager {
  int[] depth;
  float[] gridArray;
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

    min = 700;
    max = 800;

    //holds the forces on each area of the grid
    vectorArray = new PVector[(int)((kinect.width/s) * (kinect.height/s))];

    //holds the depth information averages as color values
    gridImage = createImage(kinect.width, kinect.height, RGB);

    //holds the depth information averages
    gridArray = new float[(int)((kinect.width/s) * (kinect.height/s))];
  }
  void run() {
    depth = kinect.getRawDepth();
    depthImage.loadPixels();
    display.loadPixels();

    for (int i = 0; i<depth.length; i++) {
      float value = map(depth[i], min, max, 0, 255);
      if (depth[i]>max) {
        value = 255;
      } else if (depth[i] <min) {
        value = 0;
      }
      depthImage.pixels[i] = color(value, 0, 0);

      colorMode(HSB);
      float value2 = map(depth[i], min, max, 0, 400);
      display.pixels[i] = color(value2, 200, 100);
      colorMode(RGB);
    }

    depthImage.updatePixels();
    display.updatePixels();


    //assign grid values
    gridImage = new PImage (kinect.width, kinect.height);
    gridImage.loadPixels();
    for (int i = 0; i<gridImage.pixels.length; i++) {
      gridImage.pixels[i] = depthImage.pixels[i];
    }
    gridImage.resize((int)(kinect.width/s), (int)(kinect.height/s));
    gridImage.updatePixels();

    for (int i=0; i<(kinect.width/s)*(kinect.height/s); i++) {
      color c = color(gridImage.pixels[i]);
      gridArray[i] = map(red(c), 0, 255, min, max);
    }
  }


  void rainbow() {
    depth = kinect.getRawDepth();
    display.loadPixels();

    for (int i = 0; i<depth.length; i++) {
      colorMode(HSB);
      float value2 = map(depth[i], min, max, 0, 400);
      display.pixels[i] = color(value2, 200, 100);
      colorMode(RGB);
    }

    display.updatePixels();
    image(display, 0, 0, width, height);
  }
  void assignVectorField() {
    for (int i = 0; i<vectorArray.length; i++) {
      vectorArray[i] = new PVector(0, 0, 0);
    }

    for (int i = 0; i<gridImage.width; i++) {
      for (int j = 0; j<gridImage.height; j++) {
        int index = i+ (j * gridImage.width);
        float depthHere = gridArray[index];

        int iStart = max(i-1, 0);
        int iEnd = min(i+1, gridImage.width-1);
        int jStart = max(j-1, 0);
        int jEnd = min(j+1, gridImage.height-1);

        for (int a = iStart; a<=iEnd; a++) {
          for (int b = jStart; b<=jEnd; b++) {
            float depthThere = gridArray[a + (b*gridImage.width)];
            if (depthThere>depthHere) {
              float force = (depthThere-depthHere)/10;

              if ((a>i) && (b>j)) {
                vectorArray[index].x += force*sin(PI/4);
                vectorArray[index].y += force*sin(PI/4);
              } else if ((a>i) && (b<i)) {
                vectorArray[index].x += force*sin(PI/4);
                vectorArray[index].y -= force*sin(PI/4);
              } else if ((a<i) && (b>j)) {
                vectorArray[index].x -= force*sin(PI/4);
                vectorArray[index].y += force*sin(PI/4);
              } else if ((a<i) && (b<j)) {
                vectorArray[index].x -= force*sin(PI/4);
                vectorArray[index].y -= force*sin(PI/4);
              } else {
                vectorArray[index].x += force*(a-i);
                vectorArray[index].y += force*(b-j);
              }
            }
          }
        }
      }
    }
  }
}
