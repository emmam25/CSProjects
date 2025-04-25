class funky_shape extends scene{
  ArrayList<Particle> particles = new ArrayList<Particle>();
  float angle = 0;
  float time =0;
  funky_shape() {
    td = createGraphics(side, side);
  }

  void run() {
    td.beginDraw();
    td.background(0);
    if (particles.size() <10) {
      for (int i = 0; i<20; i++) {
        angle += randomGaussian();
        particles.add(new Particle(td.width/2 + 5*cos(angle), td.width/2 + 5*sin(angle), cos(angle)*5, sin(angle)*5));
      }
    }
    td.colorMode(HSB, 300, 100, 100);
    td.stroke(time, 90, 90);
    time+=0.3;
    if (time >300) {
      time = 0;
    }
    td.colorMode(RGB);
    td.strokeWeight(5);
    td.beginShape();
    td.noFill();
    for (int i = 0; i <particles.size()-1; i++) {
      particles.get(i).run();
      td.vertex(particles.get(i).pos.x, particles.get(i).pos.y);
    }
    td.vertex(particles.get(0).pos.x, particles.get(0).pos.y);
    td.endShape();
    td.endDraw();
  }
}

class Particle {
  PVector pos, vel;
  Particle(float x, float y, float vx, float vy) {
    pos = new PVector (x, y);
    vel = new PVector (vx, vy);
  }
  void run() {
    pos.add(vel);
    if (pos.x>side || pos.x<0) {
      vel.x = - vel.x;
    } else if (pos.y <0 || pos.y>side) {
      vel.y = - vel.y;
    }
  }
}
