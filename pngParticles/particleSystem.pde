class particleSystem {
  ArrayList<Particle> particles;
  PVector gravity;
  PVector position;
  float r, b, g, r2, b2, g2;
  particleSystem(float x, float y) {
    particles = new ArrayList <Particle>();
    gravity=new PVector(0, 0.1);
    position = new PVector (x, y);
    r= random(256);
    b= random(256);
    g= random(256);
    r2= random(256);
    b2= random(256);
    g2= random(256);
  }
  void run() {
    for (int i=0; i<4; i++) {
        Particle p = new Particle(new PVector(position.x, position.y), new PVector (random(-1,1), random(0,0)), r,b,g);
        particles.add(p);

    }

    for (int i= particles.size()-1; i > -1; i--) {
      Particle p =particles.get(i);
      if (p.death()) {
        particles.remove(p);
      }
    }
    for (Particle p : particles) {

      p.applyGravity(gravity);
      p.update();
      p.display();
      //p.checkEdgesBounce();
    }
  }
}
