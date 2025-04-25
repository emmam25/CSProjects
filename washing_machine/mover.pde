class Mover {
  PVector center, pos, acc;
  float theta, w; // w is angular velocity
  float m = 0.1;
  float g = 0.1;
  float size = random(15, 30);
  float t = 0;
  color c = color(random(130,255), random(130,255), 0, random(130,255));

  PVector springLoc = new PVector(random(width), random(height));
  PVector springVel = new PVector (0, 0);
  float k = random(0.1,0.3);
  Mover(float theta, float r, float centerx, float centery, float dir) {
    center = new PVector(centerx, centery);
    pos = new PVector(centerx+r*cos(theta), centery+r*sin(theta));
    this.theta = theta;
    w = 0.02*dir;
  }
  void run() {
    PVector dist = new PVector(pos.x - center.x, pos.y - center.y);
    float r = mag(dist.x, dist.y);
    theta +=w;
    theta -= m*g*sin(theta);
    pos.x = center.x+ abs(r)*cos(theta);
    pos.y = center.y+ abs(r)*sin(theta);
    colorMode(HSB);
    stroke(t,99,99);
    t++;
    if(t>360){
      t = 0;
    }
    //fill(c);
  //  circle(pos.x, pos.y, size);
   // circle(springLoc.x, springLoc.y, size);
    float x = dist(springLoc.x, springLoc.y, pos.x, pos.y);
    float f = 0;
    if (x>100) {
      f = k*(x-100);
    } else {
      f = -k*(100-x);
    }
    float a = f/m;
    //multiply by the unit vector of the spring
    PVector unit = pos.copy().sub(springLoc).div(mag(pos.copy().sub(springLoc).x, pos.copy().sub(springLoc).y));
    PVector springAcc = unit.mult(a/1000);
    springVel.add(springAcc);
    springLoc.add(springVel);
    line(springLoc.x, springLoc.y, pos.x, pos.y);
  }
}
