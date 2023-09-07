class ParticleSystem {
  PVector pos;
  ArrayList<Particle> particles;
  boolean alive = true;
  String mode;
  ParticleSystem(PVector pos, String mode) {
    this.pos = pos;
    particles = new ArrayList<Particle>();
    this.mode = mode;
  }
  void addParticles(int n, int m, String mode) { //n is how many particles you want, m is how far apart they are
    for (int i = 0; i<n; i++) {
      Particle particle = new Particle(new PVector((pos.x)+random(-m, m), (pos.y)+random(-m, m)), mode);
      particles.add(particle);
    }
  }
  void runParticles() {
    if (alive) {
      if (mode == "volcano") {
        addParticles(50, 50, mode);
      } else if(mode == "water"){
        addParticles(10, 10, mode);
      } else if(mode == "ant"){
        addParticles(1, 50, mode);
      }
    }
    for (Particle particle : particles) {
      particle.run();
    }
    if ((particles.size()>1000)&&(mode!="volcano")) {
      alive = false;
    }
    if (mode == "volcano") {
      for (int i = 0; i<particles.size(); i++) {
        if (particles.get(i).lifeSpan<0) {
          particles.remove(i);
        }
      }
    }
  }

  void move(PVector newPos) {
    pos = newPos;
  }
}
