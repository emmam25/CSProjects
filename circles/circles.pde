ArrayList<Circle> circles = new ArrayList<Circle>();
void setup() {
  size(800, 800);
}
void draw() {
  background(0);
  smooth();
  noCursor();
  for (int i = 0; i<circles.size(); i++) {
    if (circles.get(i).isAlive()) {
      circles.get(i).run();
    } else {
      circles.remove(i);
    }
  }
}
void keyPressed() {
  for (int j = 0; j<15; j++) {
    float w = random(width);
    float h = random(height);
    for (int i =0; i<random(10); i++) {
      Circle c = new Circle(new PVector(w, h), i*-10);
      circles.add(c);
    }
  }
}
