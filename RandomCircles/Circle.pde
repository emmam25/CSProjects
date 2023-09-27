class Circle {
  PVector pos;
  float size;
  float lifeSpan, deathVelocity, deathAcc;
  float r, b, g;
  PVector velocity;
  Circle(PVector pos, float size, float deathVelocity, float deathAcc, float r, float b, float g) {
    this.pos = pos;
    this.size = size;
    lifeSpan = 1;
    this.deathVelocity = deathVelocity;
    this.deathAcc = deathAcc;
    this.r=r;
    this.b=b;
    this.g=g;
    velocity = new PVector(random(-5, 5), random(-5, 5));
  }
  void run() {
    lifeSpan +=deathVelocity;
    deathVelocity += deathAcc;
    strokeWeight(10);
    stroke(r, b, g, lifeSpan-50);
    fill(r, b, g, lifeSpan);
    circle(pos.x, pos.y, size);
  }
  void move() {
    pos.x+=velocity.x;
    pos.y +=velocity.y;
  }
  boolean dead() {
    return lifeSpan <=0;
  }
}
