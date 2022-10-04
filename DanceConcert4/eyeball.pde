class eyeball{
  color c;
  float r, x, y, xVel, yVel;
  int plusMinus;
  eyeball(color c, float r, float x, float y){
    this.c = c;
    this.x=x;
    this.y=y;
    this.r=r;
    xVel = random(-1, 1);
    yVel = random(-1, 1);
    plusMinus = int(random(4));
  }
  void run(){
  fill(255);
  ellipse(x, y, r, r);

  fill(c);
  if (plusMinus==0) {
    ellipse(x+random(2), y+random(2), r/2, r/2);
  }
  if (plusMinus==1) {
    ellipse(x-random(2), y-random(2), r/2, r/2);
  }
   if (plusMinus==2) {
    ellipse(x+random(2), y-random(2), r/2, r/2);
  }
  if (plusMinus==3) {
    ellipse(x-random(2), y+random(2), r/2, r/2);
  }
    x+=xVel;
    y+=yVel;
    if((x>width)||(x<0)){xVel=-xVel;}
    if((y>height)||(y<0)){yVel=-yVel;}
  }
}
