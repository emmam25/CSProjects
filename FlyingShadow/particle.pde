class particle {
  PVector p, v;
  int t;
  particle(PVector position, int transparency, PVector velocity) {
    p = position;
    v= velocity;
    this.t =transparency;
  }
  PVector getPlace() {
    return p;
  }
  int getT() {
    return t;
  }
  boolean isDead() {
    if (p.x>=kinect.width-abs(v.x) || p.x< abs(v.x) || p.x <= 0.0) {
      return true;
    }
    if (p.y>=kinect.height-abs(v.y) || p.y < abs(v.y) || p.y <= 0.0) {
      return true;
    }
    if (t<=0) {
      return true;
    }
    return false;
  }
  void update() {
    p.add(v);
    t-=50;
  }
}
