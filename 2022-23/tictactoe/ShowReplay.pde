class ShowReplay extends GameState {
  float timePassed;
  float startTime;
  //which move you are on in the arraylist
  int place = 0;
  ShowReplay() {
  }
  boolean run() {
    timePassed = millis() - startTime;
    //switch the move every second
    if (timePassed >=300) {
      startTime = millis();
      place ++;
      if (place >= time.size()) {
        place = 0;
        done = true;
      }
    }

    cubes = time.get(place);
    drawCubes(g, new PVector(-1, -1, -1));

    return done;
  }
  void startTimer() {
    startTime = millis();
  }
}
