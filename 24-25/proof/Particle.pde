class Particle{
  PVector pos;
  PVector vel = new PVector(random(-2,2), random(5));
  float angle =random(PI);
  color c = color(random(200,255), random(200,255), random(200,255), random(100,255));
  Particle(PVector pos){
    this.pos = pos;
  }
  void run(){
    fill(c);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    rect(0,0, 5,10);
    popMatrix();
    pos.add(vel);
    angle +=0.02;
  }
}
