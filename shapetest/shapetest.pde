import org.openkinect.processing.*;
PShape shape;
PImage img;

KinectTracker tracker;

PVector center = new PVector(0,0);
void setup() {
  size(400, 400, P3D);
  noStroke();
  img = loadImage("shells.jpg");
  shape = createShape();
  tracker = new KinectTracker(this);
}
void draw() {
  tracker.track();
  center = tracker.getPos();
  shape.beginShape();
  shape.texture(img);
  shape.textureMode(NORMAL);
  for (int angle = 0; angle<360; angle +=30) {
    PVector unitcircle = new PVector (cos(radians(angle)), sin(radians(angle)));
    shape.vertex(center.x+unitcircle.x*100, center.y + unitcircle.y*100, map(unitcircle.x, -1, 1, 0, 1), map (unitcircle.y, -1, 1, 0, 1));
  }
  shape.endShape();
  shape(shape,0,0);
}
