import org.openkinect.freenect.*;
import org.openkinect.processing.*;
int place=0;
ArrayList<gamestate> gs = new ArrayList<gamestate>();
moveDuckLine ml = new moveDuckLine();
level1 lvl1 = new level1();
KinectTracker kt;


void setup() {
  size(displayWidth, displayHeight);
  gs.add(ml);
  gs.add(lvl1);
  kt = new KinectTracker(this);
}
void draw() {
  background(255);
  if (gs.get(place).run()) {
    if (place==gs.size()-1) {
      exit();
    } else {
      place++;
    }
  }
}
void mouseClicked() {
  gs.get(place).mouseClicked();
}
void keyPressed() {
  gs.get(place).keyPressed();
}
