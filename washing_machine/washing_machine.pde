ArrayList<Mover> movers = new ArrayList<Mover>();
void setup() {
  fullScreen();
  float r = 300;
  for (int i = 0; i<10; i++) {
    float theta = random(PI*2);
    movers.add(new Mover(theta, r, width/2, height/2, 1));
  }
  float r2 = 200;
   for (int i = 0; i<10; i++) {
    float theta = random(PI*2);
    movers.add(new Mover(theta, r2, width/2, height/2, -1));
  } 
}
void draw() {
  fill(0,10);
  rect(0,0,width,height);
  noStroke();
  for (Mover m : movers) {
    m.run();
  }
}
