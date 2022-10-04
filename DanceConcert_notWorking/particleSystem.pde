class particleSystem {
  ArrayList<Particle2> particles;
  PVector gravity;
  PVector position;
  float r, b, g, lifeSpan, lifeSpanDecrement;
  particleSystem(float x, float y, float r, float b, float g) {
    particles = new ArrayList <Particle2>();
    gravity=new PVector(0, 0.001);
    position = new PVector (x, y);
    this.r= r;
    this.b= b;
    this.g= g;
    lifeSpan=1;
  //  lifeSpanDecrement = random(10);
  }
  boolean alive() {
    //this determines whether the firework should continue to create particles.
    if (lifeSpan<0) {
      return false;
    } else {
      return true;
    }
  }
  boolean completelyDead() {
    //when there are no more fireworks, the firework is completely dead
    return(particles.size()==0);
  }
  void addParticles() {
    for (int i=0; i<65; i++) {
      PVector v= PVector.random2D();
      v.mult(3);
      Particle2 p = new Particle2(new PVector(position.x, position.y), v, r, b, g, 3);
      particles.add(p);
     /* PVector v2= new PVector(v.x*0.7, v.y*0.7);
      Particle2 f = new Particle2(new PVector(position.x, position.y), v2, r2, b2, g2, 3);
      particles.add(f); */
    }
  }
  void run() {
    //decrease the lifespan
    lifeSpan--;
    for (int i= particles.size()-1; i > -1; i--) {
      Particle2 p =particles.get(i);
      if (p.death()) {
        particles.remove(p);
      }
    }
    for (Particle2 p : particles) {

      p.applyGravity(gravity);
      p.update();
      p.display();
    }
  }
}
