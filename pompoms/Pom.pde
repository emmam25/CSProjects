class Pom {
  float r = 0;
  float maxR = 100; //biggest
  float minR = 10; //smallest
  float t=random(2*PI);
  PVector pos;
  Pom(PVector pos) {
    this.pos = pos;
  }
  void run() {
    pushMatrix();
    translate(pos.x, pos.y);
    for (float j =0; j<2*PI; j+=0.1) {
      pushMatrix();
      rotate(j);
      for (float i =r; i>0; i--) {
        stroke(126, map(i, 0, r, 0,90), 99);
        strokeWeight(4);
        point(0,i);
      }
      popMatrix();
    }
    popMatrix();
    r= map(sin(t), -1, 1, minR, maxR);
    t+=0.1; // how fast it grows outward
  }
}
