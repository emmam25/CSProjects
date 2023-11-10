class Firefly{
  PVector pos;
  PImage glow;
  PVector vel;
  float t;
  float tVel;
  float noiseVal, noiseValPlus;
  int size;
 
  Firefly(PVector pos, PImage glow, int size){
    this.pos = pos;
    this.glow = glow;
    vel = new PVector(0.5, random(-0.5,0));
    t=(int)random(100);
    tVel=random(10);
    noiseVal =random(1000);
    noiseValPlus = random(0.001,0.01);
    this.size = size;
  }
  
  void run(color flyTint){
    tint(flyTint,t);
    image(glow, pos.x, pos.y, size,size);
    tint(0);
    image(glow, pos.x, pos.y, size/2,size/2);
    pos.x += sin(noiseVal) *vel.x;
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
    t+=tVel;
    if(t>255 || t<-100){
      tVel = -tVel;
    }
    noiseVal+=noiseValPlus;
  }
}
