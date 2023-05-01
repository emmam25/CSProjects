class Ball {
  PVector ballPos;
  float xVel, yVel;
  Ball(PVector pos, PVector vel) {
    this.ballPos = pos;
    this.xVel = vel.x;
    this.yVel = vel.y;
  }
  void display(PGraphics p) {
    p.beginDraw();
    p.background(0,255,0);
    p.fill(0);
    p.ellipse(ballPos.x, ballPos.y, 40, 40);
    p.endDraw();
    
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
