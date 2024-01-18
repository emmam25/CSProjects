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
        PVector endPos = new PVector(i+random(-15,15), j+random(-15,15));
        PVector startPos = new PVector(i,j);
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
  
    void switchParticles(){
    for(Particle p: particles){
      p.switchDirection();
    }
  }
}
