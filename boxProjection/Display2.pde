class Display2 {
  float x, y, t, z;
  Display2() {
  }
  void display(PGraphics p) {
    p.beginDraw();
    p.strokeWeight(5);
    p.stroke(noise(t+3547)*255, noise(t+34)*255, noise(t+23333)*255);
    t+=0.01;
    z+=0.3;
    x= noise(t)*p.width;
    y=noise(t+1000)*p.height;
    p.strokeWeight(noise(z)*30);
    p.point(noise(t+4000)*p.width, noise(z+6759)*p.height);
    p.endDraw();
  }
}
