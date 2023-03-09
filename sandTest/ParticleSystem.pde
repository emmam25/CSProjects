class ParticleSystem {
  ArrayList<Particle> particles = new ArrayList<Particle>();
  int pos;
  int lifeSpan = 0;
  ParticleSystem(int pos) {
    this.pos = pos;
  }

  void run() {
    lifeSpan ++;
    if (lifeSpan<100) {
      for (int i = 0; i<10; i++) {
        Particle particle = new Particle(pos+(int)random(-10, 10) + (int)random(-10, 10) *kinectManager.display.height);
        particles.add(particle);
      }
    }
    
    for (Particle p : particles) {
      int position = p.getPos();
      if (!(position<imageGridIncrement*kinectManager.display.width ||
        position>kinectManager.display.pixels.length - imageGridIncrement*kinectManager.display.width -1)) {
        kinectManager.display.pixels[position] = color(0, 0, 255);
      //  fill(0,0,255);
      //  ellipse(position%width, position%height, 20, 20);
        int[] surroundings = new int[] {position +(int)imageGridIncrement, position -(int)imageGridIncrement,
          position +(int)imageGridIncrement*kinectManager.display.width, position - (int)imageGridIncrement*kinectManager.display.width};
        p.choosePosition(surroundings);
      }
    }
  }
}
