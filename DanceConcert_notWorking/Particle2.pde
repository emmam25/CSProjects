class Particle2{
  PVector position, velocity, acceleration;
  float topSpeed, radius, mass;
  float angle, angleVel, angleAcc;
  float r, b, g, lifeSpan, pInx, pIny, lifeSpanDecrement;
  Particle2(PVector pIn, PVector vIn, float red, float blue, float green, float ld){
    position = new PVector(pIn.x, pIn.y);
    velocity = new PVector(vIn.x, vIn.y);
    acceleration = new PVector(0, 0);
    topSpeed = 10;
    radius = 10;
    mass = 1;
    r=red;
    b=blue;
    g=green;
    lifeSpan=255;
    lifeSpanDecrement =ld;
  }
   boolean death() {

    return (lifeSpan<0);
  }
    void display() {
   stroke(r,b,g, lifeSpan);
    fill(r,b,g,lifeSpan);
    //ellipse(position.x, position.y, 10,10);
    line(position.x,position.y,position.x+velocity.x*10, position.y+velocity.y*10);
  }


  //applyForce Function
  void applyForce(PVector force) {
    //divide force by mover mass
    PVector f = PVector.div(force, mass);
    //add the resulting vector to acceleration
    acceleration.add(f);
  }

  //applyGravity Function
  void applyGravity(PVector gravity) {
    //add the gravity vector to acceleration
    acceleration.add(gravity);
  }

  void update() {
    lifeSpan-=lifeSpanDecrement;
   /* angleAcc = acceleration.x/10;
    angleVel += angleAcc;
    angle += angleVel; */

    //add acceleration to velocity
    velocity.add(acceleration);
    //limit magnitude of velocity 
    velocity.limit(topSpeed);
    //add velocity to position
    position.add(velocity);
    //reset acceleration to zero
    acceleration.mult(0);
  }
}
