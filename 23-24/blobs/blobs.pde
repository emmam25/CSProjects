PShader blur;
ArrayList<Particle> particles;
PImage ad;
PGraphics pg;
void setup() {
  size(displayWidth, displayHeight, P2D);
  smooth();
  blur = loadShader("blur.glsl");
  ad = loadImage("radithor.png");
  ad.resize(1728/3, 2304/3);
  particles = new ArrayList<Particle>();
  background(0);
  imageMode(CENTER);
  tint(232, 218, 178);
  for (int i =0; i<10; i++) {
    particles.add(new Particle(new PVector (random(width), random(height))));
  }
  pg = createGraphics(width, height, P2D);
  pg.beginDraw();
  pg.colorMode(HSB, 360, 100, 100);
  pg.endDraw();
}
void draw() {
  for (int i =0; i<particles.size(); i++) {
    if (!particles.get(i).dead) {
      particles.get(i).run(pg);
    } else {
      particles.remove(i);
      particles.add(new Particle(new PVector (random(width), random(height))));
    }
  }

  PGraphics pg2 = createGraphics(width, height);
  pg2.beginDraw();
  pg2.filter(BLUR, 6);
  pg2.imageMode(CENTER);
  pg2.image(ad, width/2+random(2), height/2);
  pg2.endDraw();
  
  image(pg2, width/2, height/2);
  image(pg, width/2, height/2);
}
