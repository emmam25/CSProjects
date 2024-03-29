class KinectManager {
  int[] depth;
  float[] gridArray;
  PVector[] vectorArray;
  PImage depthImage, gridImage, display;

  Kinect kinect;

  int min, max, clickValue;


  KinectManager(PApplet p) {
    kinect = new Kinect(p);
    kinect.initDepth();
    //holds the depth information as an RGB value (0-255)
    depthImage = createImage(kinect.width, kinect.height, RGB);

    //the image being drawn on the screen (any colors)
    display = createImage(kinect.width, kinect.height, RGB);

    min = 700;
    max = 800;
    clickValue = 600;

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
    display.loadPixels();

    for (int i = 0; i<depth.length; i++) {
      colorMode(HSB);
      float value2 = map(depth[i], min, max, 0, 400);
      display.pixels[i] = color(value2, 200, 100);
      colorMode(RGB);
      if (depth[i] <clickValue) {
        display.pixels[i] = color(255, 255, 255);
      }
    }

    display.updatePixels();
    image(display, 0, 0, width, height);
  }

  void mountains() {
    display.loadPixels();

    for (int i = 0; i<depth.length; i++) {
      int value = depth[i];
      if (value <clickValue) {
        display.pixels[i] = color(255, 255, 255);
      } else if (value>min && value<min+50) {
        display.pixels[i] = color(0, 255, 0);
      } else if (value>min+50 && value<max) {
        display.pixels[i] = color(0, 0, 255);
      }
    }

    display.updatePixels();
    image(display, 0, 0, width, height);
  }

  void grayScale() {
    display.loadPixels();

    for (int i = 0; i<depth.length; i++) {
      float value = map(depth[i], min, max, 255, 0);
      display.pixels[i] = color(value);
      if (depth[i] <clickValue) {
        display.pixels[i] = color(255, 255, 255);
      }
    }

    display.updatePixels();
    image(display, 0, 0, width, height);
  }

  void allGrey() {
    display.loadPixels();

    for (int i = 0; i<depth.length; i++) {

      if (depth[i] <clickValue) {
        display.pixels[i] = color(255, 255, 255);
      } else {
        display.pixels[i] = color(100);
      }
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

  PVector findVolcano() { //finds highest average area
    PVector volcano = new PVector(-1, -1);
    float minDepth = max;
    for (int j = (int)(kinect.height/s)-5; j >= 5; j--) {
      for (int i = (int)(kinect.width/s)-5; i >= 5; i--) {
        if (gridArray[i + (j*(int)(kinect.width/s))] <= minDepth) {
          minDepth = gridArray[i + (j*(int)(kinect.width/s))];
          volcano.x = i;
          volcano.y = j;
        }
      }
    }
    return volcano;
  }

  PVector findClicker() { //finds the pointing hand
    PVector clickedPlace = new PVector(-1, -1);
    for (int j = kinect.height-1; j >= 0; j--) {
      for (int i = kinect.width-1; i >= 0; i--) {
        if (depth[i + (j*kinect.width)] <= clickValue) {
          clickedPlace.x = i;
          clickedPlace.y = j;
          return clickedPlace;
        }
      }
    }
    return clickedPlace;
  }
}
