class Paper{
  PVector pos, vel, acc;
  float angle, time, sizeUp;
  PVector size = new PVector(36,86);
  color c = color(random(200,255), random(200,255), random(200,255), random(100,255));
  float minS = random(10,40);
  float maxS = random(50,90);
  PImage dollar;
  Paper(float x, float y, float velX, float velY,PImage dollar){
    pos = new PVector(x,y);
    vel = new PVector(velX, velY);
    acc = new PVector(0,0.03);
    angle = random(PI);
    time = random(100);
    sizeUp = random(0.99, 1.01);
    this.dollar = dollar;
  }
  void run(){
    fill(c);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    image(dollar, 0,0, cos(time)*size.x, size.y);
    popMatrix();
    pos.add(vel);
    vel.add(acc);
    time+=0.04;
    angle+=0.01;
    size.x*=sizeUp;
    size.y*=sizeUp;
    if(size.x<minS || size.x>maxS){
      sizeUp = 1;
    }
  }
}
