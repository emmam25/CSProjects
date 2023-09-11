PImage goal;
PImage current;
ArrayList<Particle> particles;
void setup() {
  size(displayWidth, displayHeight);
  goal = loadImage("GoalImage.png");
  goal.resize(444, 624);
  current = createImage(goal.width, goal.height, RGB);
  particles = new ArrayList<Particle>();
  for (int i = 0; i<goal.width; i++) {
    for (int j = 0; j<goal.height; j++) {
      PVector endPos = new PVector(i, j);
      int side = (int) random(3);
      PVector startPos = new PVector(0,0);
      int index = i + (j*goal.width);
      color pixelColor = goal.pixels[index];
      Particle p = new Particle(startPos, endPos, pixelColor);
      particles.add(p);
    }
  }
}
void draw() {
  background(255);
  current.loadPixels();
  for (Particle p : particles) {
    //check if out of bounds!!!
    int index = (int)( p.getPos().x + (p.getPos().y*goal.width));
    if (index >=0 && index <current.pixels.length) {
      current.pixels[index] = p.getColor();
      p.getCloser();
    }
  }
  current.updatePixels();
  image(current, 0, 0);
}
