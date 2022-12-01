class character{
  PVector pos, vel;
  character(int x, int y){
    pos = new PVector(x,y);
    vel = new PVector(0,0);
  }
  void run(){
    pos.add(vel);
    ellipse(pos.x,pos.y,20,20);
    println(vel);
  }
  void setVel(float x, float y){
    vel.x = x;
    vel.y = y;
  }
}
