class square {
  color c;
  float r, x, y, xVel, yVel;
  float angle;
  square(color c, float r, float x, float y) {
    this.c = c;
    this.x=x;
    this.y=y;
    this.r=r;
    xVel = random(-1, 1);
    yVel = random(-1, 1);
  }
  void run() {
    pushMatrix();
    translate(x,y);
    rotate(angle);
   fill(c);
    rect(0,0, r, r);
    popMatrix();
    x+=xVel;
    y+=yVel;
    if ((x>width)||(x<0)) {
      xVel=-xVel;
    }
    if ((y>height)||(y<0)) {
      yVel=-yVel;
    }
   angle +=0.03;
  }
}
