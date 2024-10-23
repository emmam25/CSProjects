// equation of a spiral - assign in rectangular coordinates
//<rcosthetha, rsintheta>
//increment r
import peasy.PeasyCam;


PeasyCam cam;


float r = 10;
float rInc =1;
float offset = 20;
ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Fog> fogs = new ArrayList<Fog>();
float angle = 0;

color middle = color(255, 255, 255);
color outer = color(136, 120, 242);

void setup() {
  size(1440,900, P3D);
  cam = new PeasyCam(this, 400);
  float maxTheta = PI*10;
  for (float theta = 0; theta <maxTheta; theta+=0.1) {
    float x = r*cos(theta);
    float y = r*sin(theta);
    for (int i = 0; i<r/offset; i++) {
      color c = lerpColor(middle, outer, map(theta, 0, maxTheta, 0, 1)+random(-0.1, 0.1));
      Particle p = new Particle(x + random(-r/offset, r/offset), y + random(-r/offset, r/offset), random(-5,5),random(1, 10), c);
      particles.add(p);
    }
    r+=rInc;
    if (maxTheta - theta <PI) {
      rInc -=0.1;
    }
  }
  for (int i = 0; i<200; i++) { // some random particles
    color c = lerpColor(middle, outer, random(0, 1));
    Particle p = new Particle(random(-r, r), random(-r, r), random(-5,5), random(1, 10), c);
    particles.add(p);
  }

  //make fog
  for (int f = 0; f <random(4, 8); f++) {
    Fog fog = new Fog(random(-r, r), random(-r, r));
    fogs.add(fog);
  }
}

void draw() {
  background(0);
  pushMatrix();
//  translate(width/2, height/2);

  pushMatrix();
  rotate(angle);
  for (Particle p : particles) {
    p.display();
    p.twinkle();
  }
  popMatrix();
  pushMatrix();
  rotate(-angle);
  for (Fog f : fogs) {
    f.display();
  }
  popMatrix();
  angle+=0.001;
  popMatrix();
}
