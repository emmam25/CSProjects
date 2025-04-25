ArrayList<Text> lines = new ArrayList<Text>();
Text t1;
PFont font;
PVector translation = new PVector(0, 0);
void setup() {
  size(1440,900);
  font = createFont("typewriter.otf", 50);
  noCursor();
}
void draw() {
  background(0);
  pushMatrix();
  translate(translation.x, translation.y);
  for (int i = 0; i<lines.size(); i++) {
    lines.get(i).run();
  }
  popMatrix();
}

void keyPressed() {
  if (key == ' ') {
    lines.clear();
  } else if (key == 'q') {
    Text newText = new Text(new PVector(random(width),(1+lines.size())*50));
    lines.add(newText);
  }
}
