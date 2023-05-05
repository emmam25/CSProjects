class Ball extends Display{
  PVector ballPos;
  float xVel, yVel;
  Ball(PVector pos, PVector vel) {
    this.ballPos = pos;
    this.xVel = vel.x;
    this.yVel = vel.y;
  }
  void display(ArrayList<PGraphics> p) {
    super.display(p);
    p.get(0).beginDraw();
    p.get(0).background(0,255,0);
    p.get(0).fill(0);
    p.get(0).ellipse(ballPos.x, ballPos.y, 40, 40);
    p.get(0).endDraw();
    
    ballPos.x += xVel;
    ballPos.y += yVel;
    if (ballPos.x>=side1.width) {
      ballPos.x = side1.width;
      xVel = -xVel;
    }
    if (ballPos.y>=side1.height) {
      ballPos.y = side1.height;
      yVel = -yVel;
    }
    if (ballPos.x<=0) {
      ballPos.x =0;
      xVel = -xVel;
    }
    if (ballPos.y<=0) {
      ballPos.y =0;
      yVel = -yVel;
    }
  }
}
