class Particle{
  PVector pos; //position IN TERMS OF THE SCREEN
  int gridCoordinate; //posiiton IN TERMS OF THE GRID
  PVector vel;
  PVector acc;
  Particle(PVector pos){
    this.pos = pos;
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  void run(){
    //use position to calculate grid coordinate
    gridCoordinate = (int)((pos.x/3) * (pos.y/3) * (kinectManager.kinect.width/3));
    //add to acceleration based on grid coordinate
    acc.add(kinectManager.vectorArray[gridCoordinate]);
    //add acc to vel and vel to pos
    vel.add(acc);
    pos.add(vel);
    //draw ellipse at pos
    noStroke();
    fill(0, 255, 0);
    ellipse(pos.x, pos.y, 5,5);
  }
}
