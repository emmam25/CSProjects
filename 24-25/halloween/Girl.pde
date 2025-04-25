class Girl extends Scene {
  PImage girl;
  float t = 0;
  String state = "IN"; //fading in or out
  float time = millis();
  Girl() {
    girl = loadImage("girl.jpeg");
    girl.resize((int)(351*1.5), (int)(626*1.5));
  }
  void initialize() {
    t =0;
    time = millis();
  }
  void run() {
    background(0);
    imageMode(CENTER);
    tint(255, t);
    image(girl, width/2, height/2);
    if (state == "IN" && t<255) {
      t++;
    } else if (state == "OUT" && t>0) {
      t--;
    }
    if (millis()-time > 5000) {
      done = true;
    }
    float random = random(100);
    if (random<10 && (t>=200 || t<=0)) {
      if(state == "IN"){
        state = "OUT";
      } else if (state == "OUT"){
        state = "IN";
      }
    }
  }
  void keyPressed() {
    if (keyCode == UP) {
      state = "IN";
    } else if (keyCode == DOWN) {
      state = "OUT";
    }
  }
}
