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
        PVector endPos = new PVector(i, j);
        PVector startPos = new PVector(random(goal.width), random(goal.height));
        int index = i + (j*goal.width);
        color pixelColor = goal.pixels[index];
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
        current.pixels[index] = p.getColor();
        p.getCloser();
      }
    }
    current.updatePixels();
    return current;
  }
  
  boolean allInPlace(){
    int stillMoving =0; //number of particles still moving
    for(Particle p: particles){
      if (p.oneIncrement.x != 0 || p.oneIncrement.y != 0){ //if it is still moving
         stillMoving++;
      }
    }
    return stillMoving<500;
  }
  void switchParticles(){
    for(Particle p: particles){
      p.switchDirection();
    }
  }
}
