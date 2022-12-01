character me;
void setup(){
  me = new character(200,200);
  size(400,400);
}
void draw(){
  background(0);
  me.run();
}
void keyPressed(){
  if(keyCode == UP){me.setVel(me.vel.x,-2);}
  else if (keyCode == DOWN){me.setVel(me.vel.x,2);}
  else if (keyCode == RIGHT){me.setVel(2,me.vel.y);}
  else if (keyCode == LEFT){me.setVel(-2,me.vel.y);}
} void keyReleased(){
  me.setVel(0,0);
}
