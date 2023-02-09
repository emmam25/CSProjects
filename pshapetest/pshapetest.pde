import peasy.*;

PShape s;
PeasyCam camera;


void setup() {

  size(400, 400, P3D);
  s = loadShape("bot.obj");

  camera = new PeasyCam (this, 0, 0, 0, 200);
  camera.setWheelHandler(null);
  camera.setMinimumDistance(120);
  camera.setMaximumDistance(500);
}

void draw() {
  background(204);
  pushMatrix();
  shape(s, 0, 0);
  popMatrix();
}
