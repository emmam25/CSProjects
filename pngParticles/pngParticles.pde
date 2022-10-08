PImage light;
ArrayList <particleSystem> systems;
float gravity=10;


void setup() {
  size(600, 600); 
  systems = new ArrayList <particleSystem>();
  light = loadImage("light.png");
  imageMode(CENTER);
  light.resize(20,20);
}



void draw() {
  blendMode(ADD);
  background(0); 
  for (particleSystem s : systems) {

    s.run();
  }
}
void mouseClicked() {
  particleSystem s = new particleSystem(mouseX, mouseY);
  systems.add(s);
}
