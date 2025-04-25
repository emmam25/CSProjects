class Fog extends Scene {
  ArrayList<particle2> fog;
  color c;
  float time = millis();
  Fog() {
  }
  void initialize() {
    blendMode(ADD); //add
    fog = new ArrayList<particle2>();
    for (int i = 0; i<2000; i++) {
      fog.add(new particle2());
    }
    c = color(255, 255, 255);
    time = millis();
  }
  void run() {
    background(0);
    for (particle2 p : fog) {
      p.display(c);
      p.change();
    }
    if (millis()-time > 5000) {
      done = true;
    }
    float random = random(100);
    if (random<10) {
      c = color(139, 255, 157);
    } else if (random<20) {
      c = color(255, 255, 255);
    } else if (random<30) {
      c = color(255, 26, 33);
    }
  }
  void keyPressed() {
    if (key == 'g') {
      c = color(139, 255, 157);
    } else if (key == 'w') {
      c = color(255, 255, 255);
    } else if (key == 'r') {
      c = color(255, 26, 33);
    }
  }
}

class particle2 {

  particle2() {
    pos = new PVector(random(width), random(height/2, height*3/2));
  }

  void display(color c) {
    noStroke();
    //fill(#FCEBF8, (pos.y/height)*255);
    fill(c, map(pos.y, 0, height, 1, 15));
    circle(pos.x, pos.y, 100);
  }

  void change() {
    pos.x+=random(-10, 10);
    pos.y+=random(-10, 10);
  }

  PVector pos;
}
