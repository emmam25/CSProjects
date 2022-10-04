class circle{
  color c;
  float r, x, y, xVel, yVel;
  circle(color c, float r, float x, float y){
    this.c = c;
    this.x=x;
    this.y=y;
    this.r=r;
    xVel = random(-1, 1);
    yVel = random(-1, 1);
  }
  void run(){
    fill(c);
    ellipse(x,y,r,r);
    x+=xVel;
    y+=yVel;
    if((x>width)||(x<0)){xVel=-xVel;}
    if((y>height)||(y<0)){yVel=-yVel;}
  }
}
