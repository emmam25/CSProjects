ArrayList<PVector> eyes = new ArrayList<PVector>();
ArrayList<Float> angles = new ArrayList<Float>();
int n = 10;
void setup(){
  size(400,400,P3D);
  for(int i = 0; i<n; i++){
    eyes.add(new PVector(random(400), random(400), random(100)));
    angles.add(random(PI*2));
  }
}
void draw(){
  background(255);
  for(int i = 0; i<n; i++){
    pushMatrix();
    translate(eyes.get(i).x, eyes.get(i).y, eyes.get(i).z);
    rotate(angles.get(i));
    sphere(20);
    popMatrix();
    angles.set(i, angles.get(i)+0.01);
  }
}
