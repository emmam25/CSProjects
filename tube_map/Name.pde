class Name {
  PVector pos;
  String text;
  String display = "";
  int index = 0;
  boolean on = false;
  Name(float x, float y, String text) {
    pos = new PVector(x, y);
    this.text = text;
  }
  void run() {
    text(display, pos.x, pos.y);
    if ((on) && (index<text.length())) {
      display+=text.substring(index, index+1);
      index++;
    }
  }
}
