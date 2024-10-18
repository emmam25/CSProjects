ArrayList<Crack> cracks = new ArrayList<Crack>();
boolean crack = false;
void setup() {
  size(400, 400);
  Crack c = new Crack(0, 0);
  cracks.add(c);
}
void draw() {
  for (int i = 0; i<cracks.size(); i++) {
    cracks.get(i).run();
    float r = random(1000);
    if (r<2 && cracks.get(i).cracking) {
      cracks.get(i).cracking = false;
      crack = false;
      float l = cracks.get(i).l;
      for (int j =0; j<random(1, 4); j++) {
        cracks.add(new Crack(cracks.get(i).start.x + l*cracks.get(i).xInc, cracks.get(i).start.y+l*cracks.get(i).yInc));
      }
    }
  }
}
