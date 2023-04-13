class Particle {
  PVector pos; //position IN TERMS OF THE SCREEN
  PVector gridCoordinate; //posiiton IN TERMS OF THE GRID
  PVector vel;
  PVector acc;
  color c;
  int lifeSpan = 50;

  Particle(PVector pos) {
    this.pos = pos;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    gridCoordinate = new PVector(0, 0);
    if (mode == "water") {
      c = color(0, random(100), random(100, 255));
    } else if (mode == "volcano") {
      c = color(random(100, 255), random(100), 0);
    }
  }

  void run() {
    lifeSpan --;

    //wrap around
    if (pos.x >width-100) {
      pos.x = 100;
    }
    if (pos.x <100) {
      pos.x = width-100;
    }
    if (pos.y >height-100) {
      pos.y = 100;
    }
    if (pos.y<10) {
      pos.y = height-100;
    }
    //use position to calculate grid coordinate
    gridCoordinate.x = (int)map(pos.x, 0, width, 0, kinectManager.gridImage.width);
    gridCoordinate.y = (int)map (pos.y, 0, height, 0, kinectManager.gridImage.height);

    acc = (kinectManager.vectorArray[(int)(gridCoordinate.x + (gridCoordinate.y*kinectManager.gridImage.width))]);
    //add acc to vel and vel to pos
    vel.add(acc);
    pos.add(vel);
    vel.limit(3);
    //draw ellipse at pos
    noStroke();
    if (mode == "volcano") {
      fill(c, lifeSpan*10);
    } else if (mode == "water") {
      fill(c);
    }
    if (mode == "ant") {
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(vel.heading());
      image(ant, 0, 0);
      popMatrix();
    } else {

      ellipse(pos.x, pos.y, 10, 10);
    }
  }
}
