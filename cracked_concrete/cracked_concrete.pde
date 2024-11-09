ArrayList<Crack> cracks = new ArrayList<Crack>();
boolean crack = false;
PImage concrete;
void setup() {
  size(800, 800);
  Crack c = new Crack(0, 0, 20, 20, false);
  cracks.add(c);
  concrete = loadImage("concrete.jpg");
}
void draw() {
  image(concrete, 0, 0);
  for (int i = 0; i<cracks.size(); i++) {
    cracks.get(i).run();
  }
}
void keyPressed() {
  if (key == ' ') {
    for (int i = 0; i<cracks.size(); i++) {
      if (!cracks.get(i).done) {
        cracks.get(i).addCrack();
      }
    }
  } else if (key == 'n') {
    Crack c = cracks.get((int)random(cracks.size()));
    PVector p = c.points.get((int)random(c.points.size()));
    int r = (int)random(0, 3);
    cracks.add(new Crack(p.x, p.y, random(-10, 10), random(-10, 10), false));
  }
}
