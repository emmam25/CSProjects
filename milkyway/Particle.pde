class Particle {
  PVector pos;
  color c;
  float size;
  float transparency = random(255);
  float tInc = random(-10, 10);
  Particle(float x, float y, float z, float size, color c) {
    pos = new PVector(x, y,z);
    this.size = size;
    this.c = c;
  }
  void display() {
    fill(c, transparency);
    noStroke();
    pushMatrix();
    translate(0,0,pos.z);
    circle(pos.x, pos.y, size);
    popMatrix();
  }
  void twinkle() {
    transparency +=tInc;
    if (transparency > 255 || transparency <0) {
      tInc = -tInc;
    }
  }
}
