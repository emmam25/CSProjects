class shear {
  PVector v1, v2, v3, v4;
  PVector goal1, goal2, goal3;
  boolean shear1, shear2, shear3, show;
  PVector dir1;
  color c;
  shear(PVector v1, PVector v2, PVector v3, PVector v4, PVector goal1, PVector goal2, PVector goal3, color c) {
    this.v1 = v1;
    this.v2 = v2;
    this.v3 = v3;
    this.v4 = v4;
    this.goal1 = goal1;
    this.goal2 = goal2;
    this.goal3 = goal3;
    show = false;
    shear1 = false;
    shear2 = false;
    shear3 = false;
    this.c = c;

    PVector shearV1 = new PVector((goal1.x-v4.x), (goal1.y-v4.y));
    dir1 = shearV1.div(mag(shearV1.x, shearV1.y)).mult(2);
  }
  void run() {
    if (show) {
      stroke(c, 255);
      fill(c, 255/2);
      quad(v1.x, v1.y, v2.x, v2.y, v3.x, v3.y, v4.x, v4.y);
    }
    if (shear1 && v4.y<=goal1.y && v4.x>=goal1.x) {
      v4.add(dir1);
      v1.add(dir1);
    }
    if (shear2 && v3.x<=goal2.x && v3.y>=goal2.y) {
      PVector v = new PVector(a, -b);
      PVector dir = v.div(mag(v.x, v.y));
      v3.add(dir);
      v4.add(dir);
    }
    if (shear3 && v3.x<=goal3.x && v3.y>=goal3.y) {
      PVector v = new PVector(a, -b);
      PVector dir = v.div(mag(v.x, v.y));
      v1.add(dir);
      v2.add(dir);
      v3.add(dir);
      v4.add(dir);
    }
  }
}
