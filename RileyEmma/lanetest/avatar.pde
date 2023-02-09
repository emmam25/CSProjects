class avatar {
  PVector pos;
  float vel = width/15;
  //how far off the center of the lane the avatar can be
  float safeZone = width/60;
  ArrayList<PImage> costumes = new ArrayList<PImage>();
  int frame;

  Gif running;

  avatar(PApplet p) {
    pos = new PVector(5*width/6, width/2);
    running = new Gif (p, "running.gif");
    running.play();
  //  ducking = new Gif(p, "ducking.gif");
  }

  void run(String newlane, boolean newducked, boolean newjumped) {
    if (newlane == "RIGHT") {
      if (pos.x > (5*width/6)+safeZone) {
        pos.x-=vel;
      } else if (pos.x<(5*width/6)-safeZone) {
        pos.x+=vel;
      }
    } else  if (newlane == "LEFT") {
      if (pos.x>(width/6) + safeZone) {
        pos.x-=vel;
      } else if (pos.x<(width/6) - safeZone) {
        pos.x+=vel;
      }
    } else if (newlane == "MID") {
      if (pos.x>(width/2) + safeZone) {
        pos.x-=vel;
      } else if (pos.x<(width/2) - safeZone){
        pos.x += vel;
      }
    }

    if (newducked) {
      pos.y = height/2 + kt.ducklineY;
    } else if (newjumped) {
      pos.y = height/2 - kt.ducklineY;
    } else {
      pos.y = height/2;
    }
  /*  noStroke();
    fill(0, 255, 0);
    ellipse(pos.x, pos.y, width/6, height);  */
    image(running, pos.x, pos.y, width/6, height/2);

    frame ++;
    if (frame>costumes.size()) {
      frame =0;
    }
  }
}
