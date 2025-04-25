PImage splatter;
ArrayList<PVector> s = new ArrayList<PVector>();
float time = millis();
class Splatter extends Scene {
  Splatter() {
    splatter = loadImage("splatter.PNG");
  }
  void initialize() {
    s.clear();
    time = millis();
  }
  void run() {
    imageMode(CENTER);
    for (PVector p : s) {
      tint(175,0,0);
      image(splatter, p.x, p.y);
    }
    if (millis()-time > 5000) {
      done = true;
    }
    float random = random(100);
    if (random<10) {
      s.add(new PVector(random(width), random(height)));
    }
  }
  void keyPressed() {
    s.add(new PVector(random(width), random(height)));//add a new splatter
  }
}
