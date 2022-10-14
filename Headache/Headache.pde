float angle, x, vx,y,vy;
void setup() {
  fullScreen();
  vx=1;
  vy=1;
   background(0);

}
void draw() {
  translate(width/2, height/2);
  noStroke();
  rotate(angle);
  int n=10;
  for (int i=0; i<n; i++) {
    rotate(TWO_PI/n);
    fill(random(130,255),random(130,255),random(130,255));
    triangle(x, 0, x+random(100),random(50), x, random(50));
    fill(random(130,255),random(130,255),random(130,255));
    triangle(50,y,50+random(50),y+random(50),50+random(50),y);
    fill(random(130,255),random(130,255),random(130,255));
    triangle(x,y,x+random(50),y+random(50),x+random(50),y);
  }
  angle+=random(0.06);
  x+=vx;
  y+=vy;
  if (x>width/2 || x<0) {
    x=0;
    background(0);
    angle=0;
  }
  if (y>height/2 || y<0) {
    y=0;
    background(0);
    angle =0;
  }
}
