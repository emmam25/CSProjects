ArrayList<Particle> particles;
PImage ad;
void setup() {
  fullScreen();
  ad = loadImage("radithor.png");
  ad.resize(1728/3, 2304/3);
  particles = new ArrayList<Particle>();
  background(0);
  imageMode(CENTER);
  tint(232,218,178);
  image(ad, width/2, height/2);
  for (int i =0; i<10; i++) {
    particles.add(new Particle(new PVector (random(width), random(height))));
  }
}
void draw() {
  for (int i =0; i<particles.size(); i++) {
    if (!particles.get(i).dead) {
      particles.get(i).run();
    } else {
      particles.remove(i);
      particles.add(new Particle(new PVector (random(width), random(height))));
    }
  }
}
