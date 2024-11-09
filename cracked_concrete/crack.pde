class Crack {
  ArrayList<PVector> points = new ArrayList<PVector>();
  float n = random(1000);
  PVector vel;
  boolean done = false;
  boolean zigzag;

  Crack(float x, float y, float velx, float vely, boolean zigzag) {
    points.add(new PVector(x, y));
    vel = new PVector(velx, vely);
    this.zigzag = zigzag;
  }
  void run() {
    float nThick =0;
    for (int i =0; i<points.size()-1; i++) {
      PVector p = points.get(i);
      PVector p2 = points.get(i+1);
      strokeWeight(map(pow(noise(nThick), 2), 0, 1, 0, 7));
      stroke(50);
      line(p.x, p.y, p2.x, p2.y);
      nThick+=0.05;
    }
  }
  void addCrack() {
    float newX = points.get(points.size()-1).x+ map(noise(n), 0, 1, 0, vel.x);
    float newY= points.get(points.size()-1).y+ map(noise(n+1000), 0, 1, 0, vel.y);
    PVector p = new PVector(newX, newY);
    n+=5;
    if (p.x<0 || p.x>width||p.y<0||p.y>height) {
      done = true;
    }
    points.add(p);
    if (zigzag) {
      changeDirection();
    }
  }
  void changeDirection() {
    float random = random (10);
    if (random<1) {
      vel.x = -vel.x;
    } else if (random>9) {
      vel.y = - vel.y;
    }
  }
}
