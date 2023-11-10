float angle;
PImage light;

void setup() {
  size(displayWidth, displayHeight, P3D);

  angle =0;
  light = loadImage("light.png");
  light.resize(10,10);

  smooth();
}

void draw() {
  translate(width/2, height/2);
  background(0);
  noStroke();

  float x = width;
  float d = 200;
  int num = 100;
  
   for (float a = 0; a < 360; a += 22.5) {
    rotate(radians(a));
    pushMatrix();
    for (int i = 0; i < num; i++) {
      scale(0.95);
      rotate(radians(angle));
      tint(map(i,0,num,180,255), 121, map(a,0,360,180,255));
      image(light, x, 0, d, d);
    }
    popMatrix();
    
    pushMatrix();
    for(int i = 0; i < num; i++) {
      scale(0.92);
      rotate(-radians(angle));
      image(light, x, 0, d, d);
    }
    popMatrix();
  }
  angle += 0.009;

}
