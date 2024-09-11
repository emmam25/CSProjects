PImage img;
ArrayList<Shadow> shadows = new ArrayList<Shadow>();
void setup() {
  size(displayWidth, displayHeight, P3D);
  img = loadImage("shadowguy.png");
  for(int i = 0; i<5; i++){
    Shadow s = new Shadow(new PVector (random(width), random(height)));
    shadows.add(s);
  }
}
void draw() {
  background(255);
  noStroke();
  textureMode(NORMAL);
  for(Shadow s: shadows){
    s.run();
  }
}
