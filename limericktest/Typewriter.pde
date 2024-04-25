class Typewriter {
  String value = "";
  boolean adding = false;
  String poem = "";
  int index =0;
  PVector startPos;
  PVector pos;
  int paperHeight;
  PImage typewriter;
  Typewriter() {
    startPos =  new PVector(2*width/3, height/2 - 20);
    pos = new PVector(startPos.x, startPos.y);
    paperHeight = 100;
    typewriter = loadImage("typewriter.png");
  }
  void run() {
    fill(255, 245, 216);
    noStroke();
    rectMode(CORNER);
    rect(pos.x, pos.y, 550, paperHeight);
    textAlign(LEFT);
    fill(0);
    text(makePoem(), pos.x, pos.y+20);
    image(typewriter, startPos.x - 100, startPos.y - 10);
    if (adding && millis() %3 == 0) {
      pos.x -= textWidth(value.substring(index, index+1)); // fix this
    }
  }
  String makePoem() {
    if (adding == true&& millis() %3 == 0) {
      poem = poem + value.substring(index, index+1);
      if (value.substring(index, index+1).equals("\n")) {
        pos.x = 2*width/3;
        pos.y -=20;
        paperHeight +=20;
      }
      index ++;
    }
    if (poem.equals(value)) {
      adding = false;
      if (typewriting.isPlaying()) {
        typewriting.stop();
        bell.play();
      }
    }
    return poem;
  }
  void setValue(String v) {
    value = v;
  }
  void startAdd() {
    adding = true;
    typewriting.loop();
    poem = "";
    index =0;
    pos.x = startPos.x;
    pos.y = startPos.y;
    paperHeight = 100;
  }
}
