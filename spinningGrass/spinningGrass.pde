PVector center;
float r, angle, time;
int numCircles = 6; 

float xPoint, yPoint;

PVector vel = new PVector(random(5), random(5));

void setup() {
  size(displayWidth, displayHeight);
  angle =0;
  center = new PVector(width/2, height/2);
  r=0;
  time =0;
  fill(random(255), random(255), random(255), 25);
  background(255);
}

void draw() {
  pushMatrix();
  translate(center.x, center.y);
  rotate(angle);

  for (int i =0; i<numCircles; i++) {
    pushMatrix();
    rotate((TWO_PI/numCircles) *i);
    pushMatrix();
    translate(r, r);

    float radius = 10;
    float lastx = 0;
    float lasty = 0;
    float radiusNoise =random(10);
    float colorNoise = random(20);
    for (float a = 0; a <= random(PI*2, PI*5); a += 0.01) {
      radius +=0.05; 
      radiusNoise +=0.05; // how wacky the spiral is
      colorNoise -=0.5;
      float thisRadius = radius + (noise(radiusNoise)*200) -100;
      xPoint = (thisRadius * cos(a));
      yPoint = (thisRadius * sin(a));
      //pastel(radiusNoise, colorNoise);
      redAndBlack(radiusNoise, colorNoise);
      point (xPoint, yPoint);
      if (lastx !=0) {
        line(lastx, lasty, xPoint, yPoint);
      }
      lastx =xPoint;
      lasty = yPoint;
    }
    popMatrix();

    popMatrix();
  }

  popMatrix();

  angle+=0.05; //(how fast it is turning)
  time+=0.01; // (how fast it is moving outward)
  r = abs(sin(time))*400;
}

void pastel(float radiusNoise, float colorNoise) {
  //melodie
  stroke(noise(radiusNoise)*405 + 100, noise(radiusNoise) * 400, noise(colorNoise)*405);
}

void redAndBlack(float radiusNoise, float colorNoise) {
  stroke(noise(radiusNoise)*255 -100, noise(colorNoise)*255 );
  if (radiusNoise<5) {
    stroke(255, 0, 0, noise(colorNoise) *255 );
  }
}


void keyPressed(){
  background(255);
  angle = 0;
  r = 0;
  time =0;
}
