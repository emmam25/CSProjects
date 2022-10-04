class Particle{
  float x,y, w, angle;
  Particle(float x, float y){
    this.x = x;
    this.y = y;
    w=20;
    angle =0;
  }
  void run(){
pushMatrix();
  translate(x,y);
  rotate(angle);
  noFill();
  stroke(0,0,255);
  ellipse(0,0,w,w);
  fill(0,0,255);
  ellipse(0,-w/2, w/6, w/6);
  ellipse(0,w/2, w/6, w/6);
  ellipse(-w/2,0, w/6, w/6); 
  ellipse(w/2,0, w/6, w/6);
  pushMatrix();
  rotate(PI/4);
  ellipse(0,-w/2, w/8, w/8);
  ellipse(0,w/2, w/8, w/8);
  ellipse(-w/2,0, w/8, w/8); 
  ellipse(w/2,0, w/8, w/8);
  popMatrix();
  popMatrix();
  angle+=0.05;
  w++;
  }
  float getSize(){
    return w;
  }
}
