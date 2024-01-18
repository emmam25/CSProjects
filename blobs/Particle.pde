class Particle {
  PVector pos;
  float t;
  float v;
  ArrayList<PVector> pastPos;
  boolean dead;
  float limit;
  Particle(PVector pos) {
    this.pos = pos;
    t = random(100);
    v=1;
    pastPos = new ArrayList<PVector>();
    dead = false;
    limit = random(400,1200);
  }

  void run() {
    fill(map(noise(t/3), 0,1,0,150), map(noise(t/3), 0,1,120,255), 0);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    circle(0,0,map(noise(t+200),0,1,0,50));
    popMatrix();
    pos.x+=map(noise(t), 0, 1, -v, v);
    pos.y+=map(noise(t+100), 0, 1, -v, v);
    pastPos.add(pos);
    t+=0.01;
    if (pastPos.size()>limit) {
      dead = true;
    }
  }
}
