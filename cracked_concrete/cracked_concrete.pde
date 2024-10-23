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
  }
}
