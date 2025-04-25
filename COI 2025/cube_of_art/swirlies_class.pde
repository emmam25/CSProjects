class swirlies extends scene{
  PGraphics pg;
  ArrayList<particle1> particles = new ArrayList<particle1>();
  int num = 12;
  float t = random(1000);

  float lineCount = 0; // how many lines we've drawn

  color one = color(random(255), random(255), random(255));
  color two = color(random(255), random(255), random(255));

  float time = millis();
  swirlies() {
    pg = createGraphics(side/4, side/4);
    td = createGraphics(side, side);
    pg.beginDraw();
    pg.background(255, 0);
    pg.endDraw();
  }
  void run() {
    td.beginDraw();

    td.background(0);
    td.pushMatrix();

    for (int i = 0; i<particles.size(); i++) {
      particle1 p = particles.get(i);
      if (p.pos.x>width || p.pos.x<0 || p.pos.y>height || p.pos.y<0) {
        particles.remove(i);
      }
      pg.beginDraw();
      p.run(pg, t);
      pg.endDraw();
    }
    if (millis() - time > 1000) {
      PVector place = new PVector(random(pg.width), random(pg.height));
      color c = lerpColor(one, two, random(1));
      color c2 = lerpColor(one, two, random(1));
      for (int i = 0; i<random(1, 100); i++) {
        PVector pos = new PVector (place.x, place.y);
        PVector vel = new PVector(0, 0);
        PVector acc = new PVector (0, 0);
        particles.add(new particle1(pos, vel, acc, c, c2));
      }
      time = millis();
      lineCount ++;
    }

    for (float theta = 0; theta <=PI*2; theta+=PI*2/num) {
      td.pushMatrix();
      td.translate(td.width/2, td.height/2);
      td.rotate(theta);
      td.image(pg, 0,0);
      td.popMatrix();
    }
    td.popMatrix();
    if(lineCount > random(10,25)){
      reset();
    }
    td.endDraw();
  }
  void reset() {
    particles.clear();
    pg.beginDraw();
    pg.clear();
    pg.background(0, 0);
    pg.endDraw();
    td.fill(0);
    td.noStroke();
    td.rect(0, 0, width, height);
    t = random(1000);
    num = (int) random(6, 20);
    one = color (random(255), random(255), random(255));
    two = color(random(255), random(255), random(255));
    lineCount = 0;
  }
}

class particle1 {
  PVector pos, vel, acc;
  color c1, c2;
  float life = 0;
  particle1(PVector pos, PVector vel, PVector acc, color c1, color c2) {
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
    this.c1 = c1;
    this.c2 = c2;
  }
  void run(PGraphics pg, float t) {
    float angle = map(noise(pos.x/100, pos.y/100, t), 0, 1, 0, PI*4);
    acc.x = cos(angle);
    acc.y = sin(angle);
    pos.x +=random(-1, 1);
    pos.y +=random(-1, 1);
    pos.add(vel);
    vel.add(acc);
    vel.limit(1);
    pg.noStroke();
    pg.fill(lerpColor(c1, c2, life), 100);
    pg.circle(pos.x, pos.y, 2);
    life +=0.03;
  }
}
