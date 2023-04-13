class ParticleSystem {
  PVector pos;
  ArrayList<Particle> particles;
  boolean alive = true;
  ParticleSystem(PVector pos) {
    this.pos = pos;
    particles = new ArrayList<Particle>();
  }
  void addParticles(int n) { //n is how many particles you want
    for (int i = 0; i<n; i++) {
      Particle particle = new Particle(new PVector((pos.x)+random(-10, 10), (pos.y)+random(-10, 10)));
      particles.add(particle);
    }
  }
  void runParticles() {
    if (alive) {
      addParticles(10);
    }
    for (Particle particle : particles) {
      particle.run();
    }
    if ((particles.size()>1000)&&(mode!="volcano")) {
      alive = false;
    }
  }

  void move(PVector newPos) {
    pos = newPos;
  }
}
