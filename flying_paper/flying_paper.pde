ArrayList<Paper> papers = new ArrayList<Paper>();
PImage dollar;
PImage dollarBack, dollarFront;
void setup() {
  size(800, 800);
  dollarFront = loadImage("dollar.jpg");
  dollarBack = loadImage("dollarback.png");
}
void draw() {
  background(0);
  for (Paper p : papers) {
    p.run();
  }
}
void mouseClicked() {
  for (int i = 0; i<50; i++) {
    papers.add(new Paper(random(width/2 -10, width/2+10), height, random(-3, 3), random(-7, -2),dollarBack));
    papers.add(new Paper(random(width/2 -10, width/2+10), height, random(-3, 3), random(-7, -2),dollarFront));
  }
}
