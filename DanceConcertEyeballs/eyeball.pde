class eyeball {
  color c;
  float r, x, y, xVel, yVel, xi, yi;
  eyeball(color c, float r, float x, float y) {
    this.c = c;
    this.x=x;
    this.y=y;
    this.r=r;
    xVel = random(-1, 1);
    yVel = random(-1, 1);
    xi=random(-2, 2);
    yi=random(-2, 2);
  }
  void run() {
    fill(255);
    ellipse(x,y, r, r);

    fill(c);
    ellipse(x+xi, y+yi, r/2, r/2);
    x+=xVel;
    y+=yVel;
    if ((x>width)||(x<0)) {
      xVel=-xVel;
    }
    if ((y>height)||(y<0)) {
      yVel=-yVel;
    }
  }
}
