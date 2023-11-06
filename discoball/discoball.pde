int n;
float r;

PVector[][] ball;

PImage light;

PVector[] lightPos;
int numLights;

float angle;

void setup() {
  size(displayWidth, displayHeight, P3D);

  n =20;
  r = 300;

  ball = new PVector[n][n];

  light = loadImage("light.png");
  numLights = 300;
  lightPos = new PVector[numLights];
  for (int i =0; i<numLights; i++) {
    lightPos[i] = new PVector(random(-100, width+100), random(-100, height+100));
  }
  angle =0;
}

void draw() {
  background(0);
  for (int i = 0; i<numLights; i++) {
    tint(random(255), random(255), random(255), 150);
    image(light, lightPos[i].x, lightPos[i].y, 150, 150);
  }

  //lights();
  // x = rsin(longitude)cos(latitude)
  //y = r sin (longitude) cos (latitude)
  //z = r cos (longitude)
  translate(width/2, height/2);
  rotateX(PI/2 +1);
  rotateZ(angle);
  angle +=0.05;
  for (int i = 0; i<n; i++) {
    float lat  = map(i, 0, n, 0, PI+PI/n + 0.01);
    for (int j = 0; j<n; j++) {
      float lon = map(j, 0, n, 0, TWO_PI+TWO_PI/n + 0.01);
      float x = r * sin (lat) * cos (lon);
      float y = r * sin(lat) * sin (lon);
      float z = r * cos(lat);
      stroke(255);
      point(x, y, z);
      ball[i][j] = new PVector (x, y, z);
    }
  }

  for (int j = 0; j<n-1; j++) {
    stroke(255);
    strokeWeight(2);
    beginShape();
    for (int i = 0; i<n-1; i++) {
    //  fill(map(noise(i, j), 0, 1, 200, 255));
      fill(random(180, 255), 121, random(180,255));
      PVector one = ball[i][j];
      PVector two = ball [i+1][j];
      PVector three = ball[i+1][j+1];
      PVector four = ball[i][j+1];
      vertex(one.x, one.y, one.z);
      vertex(two.x, two.y, two.z);
      vertex(three.x, three.y, three.z);
      vertex(four.x, four.y, four.z);
      endShape();
    }
  }
}
