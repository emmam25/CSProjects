class Point {
  PVector pos, vel, acc;
  Point(PVector pos, PVector vel, PVector acc) {
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
  }
  PVector getPos() {
    return pos;
  }
  void run() {
    vel.add(acc);
    pos.add(vel);
  }
  void setAcc(PVector newAcc) {
    acc = newAcc;
  }
}
