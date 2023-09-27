
ArrayList<Circle> circles = new ArrayList<Circle>();
int circleLimit=300;


void setup() {
  size(displayWidth, displayHeight);
}
void draw() {
  background(0);
  for (int i = circles.size()-1; i>0; i--) {
    circles.get(i).run();
    circles.get(i).move();
    if (circles.get(i).dead()) {
      circles.remove(i);
    }
  }
  if (circles.size()<circleLimit) {
    Circle c = new Circle(new PVector(random(width-100), random(height-100)),
      random(50, 100),
    /*   random(1,2), random(-0.04, -0.005),*/
      random(3, 5), random(-0.1, -0.05),
      random(256), random(0), random(256));
    circles.add(c);
  }
}
