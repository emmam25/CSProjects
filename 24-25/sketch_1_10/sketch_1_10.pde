PVector pos;
float w = 300;
float h = 300;
void setup() {
  size(1440,900);
  pos = new PVector(width/2-100, height/2-100);
}
void draw() {
  background(0);
  stroke(109, 213, 237);
  strokeWeight(10);
  noFill();
 /* beginShape();
  vertex(pos.x, pos.y);
  vertex(pos.x, pos.y+h);
  vertex(pos.x+w, pos.y+h);
  vertex(pos.x+w, pos.y);
  vertex(pos.x+w/2, pos.y-h/2);
  vertex(pos.x, pos.y);
  endShape();*/
  line(pos.x, pos.y, pos.x+w/2, pos.y-h/2);
  line(pos.x+w, pos.y, pos.x+w/2, pos.y-h/2);
  fill(109, 213, 237);
  textSize(50);
  textAlign(CENTER);
  text("41", pos.x + w/2, pos.y-h/4);
}
