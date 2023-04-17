//...it might be easier to just draw the avatar at the person's average location

class avatar {
  PVector pos;

  Gif running, ducking, current, jumping;

  avatar(PApplet p) {
    pos = new PVector(5*width/6, width/2);
    running = new Gif (p, "running.gif");
    running.play();
    current = running;
    ducking = new Gif(p, "ducking.gif");
    ducking.play();
    jumping = new Gif(p, "jumping.gif");
    jumping.play();
  }

  void run(float newX, boolean newducked, boolean newjumped) {

    pos.x = newX;

    if (newducked == true) {
      pos.y = height - (height/4);
      current = ducking;
    }
    if (newjumped == true) {
      pos.y = height/4;
      current = jumping;
    } else if (newjumped == false && newducked == false) {
      pos.y = height/2;
      current = running;
    }
    /*  noStroke();
     fill(0, 255, 0);
     ellipse(pos.x, pos.y, width/6, height);  */
    image(current, pos.x, pos.y, width/6, height/2);
  }
}
