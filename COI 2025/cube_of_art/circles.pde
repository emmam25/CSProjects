class circles extends scene{
  ArrayList<circle> circles = new ArrayList<circle>();
  circles() {
    td = createGraphics(side, side);
    for (int x = 0; x<=width; x+=100) {
      for (int y = 0; y<=height; y+=100) {
        if (random(2) <1) {
          circles.add(new circle(x+random(-5, 5), y+random(-5, 5), 100));
        }
      }
    }
  }
  void run() {
    td.beginDraw();
    td.background(0);
    for (circle c : circles) {
      c.run(td);
    }
    td.endDraw();
  }
}

class circle {
  ArrayList<PVector> minis = new ArrayList<PVector>();
  ArrayList<PVector> colors = new ArrayList<PVector>();
  float centerx, centery, x, y, r, maxR;
  PVector c = new PVector(random(255), random(255), random(255));
  circle(float x, float y, float maxR) {
    r = 0;
    this.maxR = maxR;
    this.x = x+random(-maxR/4, maxR/4);
    this.y =y;
    centerx = x;
    centery = y;
    minis.add(new PVector(x, y, maxR));
    colors.add(new PVector(random(255), random(255), random(255)));
  }
  void run(PGraphics td) {
    if (x+r/2 > centerx + maxR/2 || x-r/2 <centerx - maxR/2) {
      minis.add(new PVector(x, y, r));
      colors.add(c);
      r = 0;
      c = new PVector(random(255), random(255), random(255));
      x+=random(-maxR/4, maxR/4);
    }
    if (minis.size() >10) {
      minis.remove(2);
      colors.remove(2);
    }
    td.noStroke();
    td.rectMode(CENTER);
    for (int i = 0; i<minis.size(); i++) {
      PVector cHere = colors.get(i);
      td.fill(cHere.x, cHere.y, cHere.z);
      PVector m = minis.get(i);
      td.rect(m.x, m.y, m.z, m.z, 20);
    }
    td.fill(c.x, c.y, c.z);
    td.rect(x, y, r,r, 20);

    r++;
  }
}
