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
  void run(PGraphics pg) {
    lifeSpan +=deathVelocity;
    deathVelocity += deathAcc;
    pg.strokeWeight(10);
    pg.stroke(r, b, g, lifeSpan-50);
    pg.fill(r, b, g, lifeSpan);
    pg.circle(pos.x, pos.y, size);
    pos.x+=velocity.x;
    pos.y +=velocity.y;
    
    if(pos.x>pg.width || pos.x<0){
      velocity.x = -velocity.x;
    } 
    if(pos.y >pg.height || pos.y<0){
      velocity.y = -velocity.y;
    }
  }
  boolean dead() {
    return lifeSpan <=0;
  }
}
