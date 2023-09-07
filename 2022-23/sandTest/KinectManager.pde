class KinectManager {
  int[] depth;
  PImage display;

  Kinect kinect;

  int min, max;

  int time = 0;

  ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();
  KinectManager(PApplet p) {
    kinect = new Kinect(p);
    kinect.initDepth();
    display = createImage(kinect.width, kinect.height, RGB);
    min = 710;
    max = 760;
  }

  void drawRainbow() {
    depth = kinect.getRawDepth();

    display.loadPixels();
    for (int i = 0; i<depth.length; i++) {
      colorMode(HSB);
      float value = map(depth[i], min, max, 0, 179) + time;
      value = value%179;
      display.pixels[i] = color(value, 200, 100);
    }
    display.updatePixels();
    image(display, 0, 0, width, height);
    fill(255);
    text("current min threshold" + min + " current max threshold" + max, 50, 100);

    time ++;
  }


  void drawRiver() {
    depth = kinect.getRawDepth();
    display.loadPixels();
    for (int i = 0; i<depth.length; i++) {
      colorMode(RGB);
      //white at the top
      if (depth[i]<730) {
        display.pixels[i] = color(255);
      } else {
        display.pixels[i] = color(200);
      }
    }

    for (int i = 0; i<kinect.width; i+=imageGridIncrement) {
      for (int j =0; j<kinect.height; j++) {
        display.pixels[i + j*kinect.width] = color(0);
      }
    }
    for (int i = 0; i<kinect.height; i+=imageGridIncrement) {
      for (int k =0; k<kinect.width; k++) {
        display.pixels[k + i*kinect.width] = color(255, 0, 0);
      }
    }

    for (ParticleSystem system : systems) {
      system.run();
    }
    display.updatePixels();
    image(display, 0, 0, width, height);


    fill(255);
    text("current min threshold" + min + " current max threshold" + max, 50, 100);
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
    } else if (key == ' ') {
      systems.add(new ParticleSystem((int) random(0, display.pixels.length)));
    }
  }
}
