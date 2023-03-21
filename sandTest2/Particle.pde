class Particle{
  PVector pos; //position IN TERMS OF THE SCREEN
  PVector gridCoordinate; //posiiton IN TERMS OF THE GRID
  PVector vel;
  PVector acc;
  
  Particle(PVector pos){
    this.pos = pos;
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    gridCoordinate = new PVector(0,0);
  }
  
  void run(){
    //wrap around
    if(pos.x >width-100){
      pos.x = 100;
    } 
    if(pos.x <100){
      pos.x = width-100;
    } 
    if(pos.y >height-100){
      pos.y = 100;
    } 
    if (pos.y<10){
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
    fill(0, 0, 255);
    ellipse(pos.x, pos.y, 10,10);
  }
}
