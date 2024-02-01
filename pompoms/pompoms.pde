ArrayList<Pom> poms = new ArrayList<Pom>();
void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  fullScreen();
  for (int i = 0; i<5; i++) {
    poms.add(new Pom(new PVector(random(width), random(height))));
  }
}
void draw() {
  background(0);
  for (Pom pom : poms) {
    pom.run();
  }
}
