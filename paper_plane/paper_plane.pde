//look at physics of paper
Paper[] planes = new Paper[350];

void setup() {
  //size of sketch, initial bgcolor
  size(800, 800);
  background(0);

  for (int i = 0; i < planes.length; i++) {
    planes[i] = new Paper();
  }
}

void draw() {
  // background(0);

  fill(0, 5);
  rect(0, 0, width, height);

  for (int i = 0; i < planes.length; i++) {
    planes[i].update();  //math
    planes[i].display();  //visual
  }
}
