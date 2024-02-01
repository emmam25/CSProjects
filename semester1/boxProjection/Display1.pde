class Display1 extends Display {
  Display1() {
  }

  void display(ArrayList<PGraphics> p) {
    super.display(p);
    p.get(0).beginDraw();
    for (int i=0; i-10 <= p.get(0).height; i+=5) {
      for (int j=0; j-10<= p.get(0).width; j+=5) {
        p.get(0).stroke(0, i, j);
        p.get(0).ellipse(j, i, 5,5);
      }
    }
    p.get(0).endDraw();
    
    p.get(1).beginDraw();
    p.get(1).background(78, 180, 10);
    p.get(1).endDraw();
  }
}
