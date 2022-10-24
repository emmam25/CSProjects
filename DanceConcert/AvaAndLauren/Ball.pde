class Ball{
  PVector position;
  PVector velocity;
  color c;
  int lifeSpan=255;
  Ball(PVector position, color c){
    this.position = position;
    velocity = new PVector(random(-30,30), random(-30,30));
    this.c = c;
  }
  boolean isDead(){
    return lifeSpan>0;
  }
  void run(){
    position.add(velocity);
    if(position.x>width || position.x<0){
      velocity.x=-velocity.x;
    }
     if(position.y>height || position.y<0){
      velocity.y=-velocity.y;
    }
    noStroke();
    fill(c, lifeSpan);
    ellipse(position.x, position.y, width/30, width/30);
    lifeSpan-=7;
  }
  void setColor(color c){
    this.c=c;
  }
}
