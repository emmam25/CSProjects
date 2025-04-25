class boubakiki extends scene {
  float plus =random(100);
  boubakiki() {
    td = createGraphics(side, side);
  }
  void run() {
    td.beginDraw();
    td.background(0);
    td.beginShape();
    td.fill(#F5EE6D);
    td.noStroke();
    float t = 0;
    for (float angle = 0; angle <= PI*4; angle +=PI/30) {
      float r = map(noise(t, plus), 0, 1, 0, 300);
      float x = td.width/4 + r*cos(angle);
      float y = td.height/4 + r*sin(angle);

      td.curveVertex(x, y); //consider changing to bezier
      t+=0.1;
    }
    td.endShape();
    td.stroke(0);
    td.noFill();
    td.arc(td.width/4 -20, td.height/4 - 10, 10, 10, PI, 2*PI);
    td.arc(td.width/4 +20, td.height/4 - 10, 10, 10, PI, 2*PI);
    td.arc(td.width/4, td.height/4 +20, 40, 40, 0, PI);

    td.beginShape();
    td.fill(#D9B8FC);
    t = 1000;
    boolean spike = true;
    for (float angle = 0; angle < PI*2; angle +=0.2) {
      float r=100;
      if (spike) {
        r = map(pow(noise(t, plus), 2), 0, 1, 100, 500);
        spike = false;
      } else {
        spike = true;
      }
      float x = td.width*3/4 + r*cos(angle);
      float y = td.height*3/4 + r*sin(angle);

      td.vertex(x, y);
      t+=0.05;
    }
    td.endShape();
    td.stroke(0);
    td.fill(0);
    td.circle(td.width*3/4 -20, td.height*3/4 - 10, 10);
    td.circle(td.width*3/4 +20, td.height*3/4 - 10, 10);
    td.noFill();
    td.arc(td.width*3/4, td.height*3/4 +20, 40, 40, 0, PI);
    td.endDraw();
    plus+=0.01;
  }
}
