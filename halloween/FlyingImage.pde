class FlyingImage extends Scene {
  float time = millis();
  Image image;
  FlyingImage() {
  }
  void initialize() {
    image = new Image(loadImage("marlborough.jpeg"));
    time = millis();
  }
  void run() {
    tint(255, 0, 0);
    image(image.run(), 0, 0, width, height);
    if (millis() - time >5000) {
      done = true;
    }
    float random = random(100);
    if (random<10) {
      image.switchParticles();
    }
  }
  void cleanup() {
  }
  void keyPressed() {
    if (key == ' ') {
      image.switchParticles();
    }
  }
  void mouseClicked() {
  }
}
class Image {
  PImage goal;
  PImage current;
  ArrayList<Particle> particles;
  Image(PImage goal) {
    this.goal = goal;

    current = createImage(goal.width, goal.height, RGB);
    particles = new ArrayList<Particle>();
    for (int i = 0; i<goal.width; i++) {
      for (int j = 0; j<goal.height; j++) {
        PVector endPos = new PVector(i+random(-15, 15), j+random(-15, 15));
        PVector startPos = new PVector(i, j);
        int index = i + (j*goal.width);
        color pixelColor = goal.pixels[index];
        //make a particle for each pixel in the image
        Particle p = new Particle(startPos, endPos, pixelColor);
        particles.add(p);
      }
    }
  }

  PImage run() {
    current.loadPixels();
    for (Particle p : particles) {
      //check if out of bounds!!!
      int index = (int)( p.getPos().x + (p.getPos().y*goal.width));
      if (index >=0 && index <current.pixels.length) {
        //color the new image based on where the particles have flown
        current.pixels[index] = p.getColor();
        p.getCloser();
      }
    }
    current.updatePixels();
    return current;
  }

  void switchParticles() {
    for (Particle p : particles) {
      p.switchDirection();
    }
  }
}

//each particle holds its position and color, and moves
class Particle {
  PVector pos;
  PVector startPos;
  PVector goalPos;
  PVector distance;
  float speed;
  PVector oneIncrement;
  color fillColor;
  Particle(PVector startPos, PVector goalPos, color fillColor) {
    this.startPos = new PVector(startPos.x, startPos.y);
    this.pos = new PVector(startPos.x, startPos.y);
    this.goalPos = new PVector(goalPos.x, goalPos.y);
    distance = new PVector(0, 0);
    oneIncrement = new PVector(0, 0);
    speed = random(0.01);
    this.fillColor = fillColor;
  }
  PVector getPos() {
    return pos;
  }
  color getColor() {
    return fillColor;
  }
  void getCloser() {
    distance.x = (goalPos.x-pos.x);
    distance.y = (goalPos.y-pos.y);
    //if you're close enough, just jump there
    if (abs(distance.x)<speed) {
      pos.x = goalPos.x;
      oneIncrement.x =0;
    } else if (distance.x>speed) {
      oneIncrement.x = speed;
    } else if (distance.x<-speed) {
      oneIncrement.x = -speed;
    }

    if (abs(distance.y)<speed) {
      pos.y = goalPos.y;
      oneIncrement.y =0;
    } else if (distance.y>speed) {
      oneIncrement.y = speed;
    } else if (distance.y<-speed) {
      oneIncrement.y = -speed;
    }

    pos.x += oneIncrement.x;
    pos.y += oneIncrement.y;
  }
  void switchDirection() {
    PVector holdGoal = new PVector(goalPos.x, goalPos.y);
    goalPos.x = startPos.x;
    goalPos.y = startPos.y;
    startPos.x = holdGoal.x;
    startPos.y = holdGoal.y;
  }
}
