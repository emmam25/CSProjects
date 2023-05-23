class Display2 extends Display {
  float x, y, t, z;
  Display2() {
  }
  void display(ArrayList<PGraphics> p) {
    super.display(p);
    p.get(0).beginDraw();
    p.get(0).strokeWeight(5);
    p.get(0).stroke(noise(t+3547)*255, noise(t+34)*255, noise(t+23333)*255);
    t+=0.01;
    z+=0.3;
    x= noise(t)*p.get(0).width;
    y=noise(t+1000)*p.get(0).height;
    p.get(0).strokeWeight(noise(z)*30);
    p.get(0).point(noise(t+4000)*p.get(0).width, noise(z+6759)*p.get(0).height);
    p.get(0).endDraw();
    
   /* p.get(1).beginDraw();
    p.get(1).background(24,100,80);
    p.get(1).endDraw();*/
  }
}
