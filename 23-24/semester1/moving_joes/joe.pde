//class for a pickable point
class joe {
  PVector pos; //holds x y and z position

  joe(float x, float y) {
    this.pos = new PVector(x, y);
  }

  PVector getPos() {
    return pos;
  }
  float getX() {
    return pos.x;
  }
  float getY() {
    return pos.y;
  }
  void setPos(PVector newPos) {
    pos = newPos;
  }
  void drawCube(PGraphics buffer, int c) {
    buffer.beginDraw();
    buffer.pushMatrix();
    buffer.fill(c);
    buffer.noStroke();
    buffer.translate(pos.x, pos.y);
    buffer.box(10);
    buffer.popMatrix();
    buffer.endDraw();
  }
}
