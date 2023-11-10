ArrayList<Firefly> fireflies = new ArrayList<Firefly>();
PImage glow;
PImage willow;
float startTime;
color imageTint = color(245,212,94);
color flyTint = color(255,240,70);

void setup() {
  size(displayWidth,displayHeight);
  glow = loadImage("light.png");
  glow.resize(10,10);
  willow = loadImage("willow.jpeg");
  willow.resize(width, height);

  for (int i =0; i<50; i++) {
    Firefly f = new Firefly (new PVector(random(width), random(height/2, height)), glow,10);
    fireflies.add(f);
  }

  startTime = millis();
   tint(imageTint);
  image(willow, 0, 0);
}

void draw() {

  for (Firefly f : fireflies) {
    f.run(flyTint);
  }
  if (startTime-millis() >500) {
    Firefly f = new Firefly (new PVector(random(width), height), glow,10);
    fireflies.add(f);
    startTime = millis();
  }
  if (fireflies.size()>100) {
    fireflies.remove(0);
  }
  
    tint(imageTint,20);
  image(willow,0,0, width, height);
}
