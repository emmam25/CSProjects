class tree extends scene {
  PVector[] branches = new PVector[50];
  int t = 0;
  float angle = -PI/2;
  PVector place;
  float h = 200;
  tree() {
    td = createGraphics(side, side);
    place = new PVector (0, td.height - 120);
  }
  void run() {
    td.beginDraw();
    td.line(place.x, place.y, place.x+h*cos(angle), place.y+h*sin(angle));
    td.endDraw();
    h*=0.99;
    place.x+=h*cos(angle);
    place.y+=h*sin(angle);
    angle +=PI/6;
  }
}
