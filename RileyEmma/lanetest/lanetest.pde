import org.openkinect.freenect.*;
import org.openkinect.processing.*;

int place=0; //variable for which gamestate you are on
ArrayList<gamestate> gs = new ArrayList<gamestate>();

moveDuckLine md;
moveJumpLine mj;
level1 lvl1;
lose lost;
KinectTracker kt;


void setup() {
  size(displayWidth, displayHeight);
  md = new moveDuckLine();
  gs.add(md);
  mj = new moveJumpLine();
  gs.add(mj);
  lvl1 = new level1();
  gs.add(lvl1);
  lost = new lose();
  gs.add(lost);
  kt = new KinectTracker(this);
}
void draw() {
  background(0);
  //if the previous gamestate is done, move to the next one
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
