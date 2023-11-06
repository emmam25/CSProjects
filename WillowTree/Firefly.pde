class Firefly{
  PVector pos;
  PImage glow;
  PVector vel;
  float t;
 
  Firefly(PVector pos, PImage glow){
    this.pos = pos;
    this.glow = glow;
    vel = new PVector(0, random(-1,0));
    t=0;
  }
  
  void run(){
    tint(255,255,0);
    image(glow, pos.x, pos.y, 10,10);
    pos.x += vel.x;
    pos.y += vel.y;
    if(pos.x>width){
      pos.x = 0;
    } if (pos.y>height){
      pos.y =0;
    } if (pos.x<0){
      pos.x = width;
    } if (pos.y <0){
      pos.y = height;
    }
    t+=0.1;
  }
}
