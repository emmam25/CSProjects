class Particle {
  int pos;
  Particle(int pos) {
    this.pos = pos;
  }
  int getPos() {
    return pos;
  }
  void choosePosition(int[] possiblePositions) {
    float mostDepth = kinectManager.depth[pos];
    int lowestPos = pos;
    for (int i = 0; i<possiblePositions.length; i++) {
      ArrayList<Integer> thesePlaces = new ArrayList<Integer>();
      for (int j = 0; j<imageGridIncrement; j++) {
        thesePlaces.add(possiblePositions[i] +j);
        thesePlaces.add(possiblePositions[i] + j*kinectManager.kinect.width);
      }
      float depthHere = findAverage(thesePlaces);
      if (depthHere > mostDepth) {
        mostDepth = depthHere;
        lowestPos = possiblePositions[i];
      }
    }
    pos = lowestPos;
  }

  float findAverage(ArrayList<Integer> places) {
    float sum =0;
    for (int i : places) {
      if (i<kinectManager.depth.length) {
        sum+= kinectManager.depth[i];
      }
    }
    return sum/places.size();
  }
}
