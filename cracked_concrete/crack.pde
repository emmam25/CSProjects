class Crack {
  PVector start;
  float n = random(1000);
  float l = 0; //length of crack
  boolean cracking = true;
  float angle = 0;
  float yInc = random(1,3);
  float xInc = random(1,3);
  Crack(float x, float y) {
    start = new PVector(x, y);
  }
  void run() {
    stroke(0);
    noFill();
    beginShape();
    float noff =0;
    for (float i = 0; i<l; i+=5) {    //decrease i for more spikiness
      vertex(start.x+xInc*i, start.y+yInc*i+map(noise(i+100), 0, 1, -25, 25));
      noff+=0.02;
    }
    endShape();
    if (cracking && start.x+l*xInc <width && start.y+1*yInc<height) {
      l+=0.05; //increment by less to crack slower
    }
  }
}
