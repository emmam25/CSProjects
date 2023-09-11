PImage goal;
PImage current;
ArrayList<Particle> particles;
void setup() {
  size(displayWidth, displayHeight);
  goal = loadImage("GoalImage.png");
  int w = goal.width;
  int h = goal.height;
  float scale = width/w;
  goal.resize((int)(w*scale), (int)(h*scale));
  current = createImage(goal.width, goal.height, RGB);
  particles = new ArrayList<Particle>();
  for (int i = 0; i<goal.width/1; i++) {
    for (int j = 0; j<goal.height/1; j++) {
      PVector endPos = new PVector(i, j);
      PVector startPos = new PVector(50,50);
      int index = i + (j*goal.width);
      color pixelColor = goal.pixels[index];
      Particle p = new Particle(startPos, endPos, pixelColor);
      particles.add(p);
    }
  }
}
void draw() {
  for (Particle p : particles) {
    //check if out of bounds!!!
    int index = (int)( p.getPos().x + (p.getPos().y*goal.width));
    if (index >=0 && index <current.pixels.length) {
      current.pixels[index] = p.getColor();
      p.getCloser();
    }
  }
  image(current, 0, 0);
  image(goal, 0, 500);
}
