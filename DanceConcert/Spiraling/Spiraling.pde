float angle, x, vx,y,vy, timeInterval;
void setup() {
  fullScreen();
  vx=1;
  vy=1;
  background(0);
  timeInterval=0;
}
void draw() {
  translate(width/2, height/2);
  noStroke();
  rotate(angle);
  int n=10;
  for (int i=0; i<n; i++) {
    rotate(2*PI/n);
    
    fill(random(130,255),random(130,255),random(130,255));
    triangle(x, 0, x+random(width/144),random(width/288), x, random(width/288));
    
    fill(random(130,255),random(130,255),random(130,255));
    triangle(width/288,y,random(width/288, width/144),y+random(width/288),random(width/288, width/144),y);
    
    fill(random(130,255),random(130,255),random(130,255));
    triangle(x,y,x+random(width/288),y+random(width/288),x+random(width/288),y); 
  }
  angle+=0.03;
  x+=vx;
  y+=vy;
  if (x>width/2 || x<0) {
    vx = -vx;
    vy = -vy;
  }
  if (y>height/2 || y<0) {
    vy = -vy;
    vx = -vx;
  }
  println(timeInterval);
  if(timeInterval==2000){
    println("yes!!");
    background(0);
    x=0;
    y=0;
    vx=1;
    vy=1;
    angle =0;
    timeInterval =0;
  }
  timeInterval++;
}
