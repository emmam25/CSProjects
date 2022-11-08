import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;

PImage img;

int minDepth =  100;
int maxDepth = 1030;

int colorScheme;

int place = 0;

Box b;

ArrayList<particle> particles = new ArrayList<particle>();

void setup() {
  fullScreen();

  kinect = new Kinect(this);
  kinect.initDepth();

  img = new PImage(kinect.width, kinect.height);

  b = new Box(255);
}

void draw() {

  int[] rawDepth = kinect.getRawDepth();
  for (int i=0; i < kinect.height; i++) {
    for (int j =0; j <kinect.width; j++) {
      int index = i*kinect.width +j;
      if (rawDepth[index] >= minDepth && rawDepth[index] <= maxDepth) {
        if (place%100==0) {
          particle p = new particle(new PVector(j, i),
            500, new PVector(random(60), 0));
          particles.add(p);
        }
      } else {
        if (colorScheme==0) {
          img.pixels[index] =color(0, 0, 0, 140);
        } else if (colorScheme==1) {
          img.pixels[index] =color(0, 0, 0, 140);
        } else {
          img.pixels[index] = color(0, 0, 255, 140);
        }
      }
    }
  }


  ArrayList<particle> particles2 = new ArrayList<particle>();
  for (int i=0; i<particles.size(); i++) {
    if (particles.get(i).isDead()==false) {
      particles2.add(particles.get(i));
    }
  }

  particles = particles2;

  for (int i=0; i<particles.size(); i++) {
    if (!((int)(particles.get(i).getPlace().y *kinect.width + particles.get(i).getPlace().x)>=img.width*img.height) && particles.get(i).getT()<=400) {
      colorMode(HSB, 400);
      int index = (int)(particles.get(i).getPlace().y *kinect.width + particles.get(i).getPlace().x);
      if (colorScheme==0) {
        img.pixels[index] = color(243, 400, particles.get(i).getT());
      } else if (colorScheme==1) {
        img.pixels[index] = color(0, 0, 400-particles.get(i).getT());
      } else {
        img.pixels[index] = color(243, 400-particles.get(i).getT(), 400);
      }

      colorMode(RGB, 255);
    }
    particles.get(i).update();
  }

  for (int i=0; i < kinect.height; i++) {
    for (int j =0; j <kinect.width; j++) {
      int index = i*kinect.width +j;
      if (rawDepth[index] >= minDepth && rawDepth[index] <= maxDepth) {
        if (colorScheme==0) {
          img.pixels[index] = color(0, 0, 255);
        } else if (colorScheme ==1) {
          img.pixels[index] = color(255);
        } else {
          img.pixels[index] = color(255);
        }
      }
    }
  }
  img.updatePixels();
  imageMode(CENTER);
  // Change(depthImg);
  image(img, width/2, height/2, width, height);
  place +=0.1;

  b.run();
}

void keyPressed() {
  if (key == 'c') {
    if (colorScheme>=2) {
      colorScheme=0;
    } else {
      colorScheme ++;
    }
  }
  if (keyCode == UP) {
    b.startIncrement();
  } else if (keyCode == DOWN) {
    b.startDecrement();
  }
}
