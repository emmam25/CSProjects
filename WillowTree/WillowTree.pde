ArrayList<Firefly> fireflies = new ArrayList<Firefly>();
PImage glow;
void setup(){
  size(400,400);
  glow = loadImage("light.png");
  for(int i =0; i<100; i++){
    Firefly f = new Firefly (new PVector(random(width), height), glow);
    fireflies.add(f);
  }
}

void draw(){
  background(0);
  for(Firefly f: fireflies){
    f.run();
  }
}
