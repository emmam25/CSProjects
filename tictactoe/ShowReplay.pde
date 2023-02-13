class ShowReplay extends GameState{
  float timePassed;
  float startTime;
  int place = 0;
  ShowReplay(){}
  boolean run(){
    timePassed = millis() - startTime;
    if(timePassed >=1000){
      startTime = millis();
      place ++;
    }
    if(place >= time.size()){
      place = 0;
      done = true;
    }
    cubes = time.get(place);
    drawCubes(g, new PVector(-1,-1,-1));
    return done;
  }
  void startTimer(){
    startTime = millis();
  }
}
