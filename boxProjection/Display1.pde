class Display1 {

  Display1() {
  }

  void display(PGraphics p) {
    p.beginDraw();
    for (int i=0; i-10 <= p.height; i+=5) {
      for (int j=0; j-10<= p.width; j+=5) {
        p.stroke(0, i, j);
        p.ellipse(j, i, 5,5);
      }
    }
    p.endDraw();
  }
}
