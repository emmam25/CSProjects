PGraphics buffer;
ArrayList<Circle> circles = new ArrayList<Circle>();
int circleLimit=30;


void setup() {
  size(displayWidth, displayHeight);
  buffer = createGraphics(width, height);
}
void draw() {
  background(0);
  buffer.beginDraw();
  buffer.background(0);
  for (int i = circles.size()-1; i>0; i--) {
    circles.get(i).run(buffer);
    if (circles.get(i).dead()) {
      circles.remove(i);
    }
  }
  buffer.endDraw();
  if (circles.size()<circleLimit) {
    Circle c = new Circle(new PVector(random(width-100), random(height-100)),
      random(50, 100),
    /*   random(1,2), random(-0.04, -0.005),*/
      random(3, 5), random(-0.1, -0.05),
      random(256), random(0), random(256));
    circles.add(c);
  }
  image(buffer, 0, 0);
}
