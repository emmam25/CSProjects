class Display3 extends Display {
  int[] cells;

  int cellSize;

  int generation;
  int [] ruleSet = {0, 1, 0, 1, 1, 0, 1, 0};
  Display3() {
    cellSize = 10;
    generation = 0;

    cells = new int[size/cellSize];
    cells[cells.length/2]=1;
  }

  void display(ArrayList<PGraphics> p) {
    super.display(p);
    p.get(1).beginDraw();
    p.get(1).background(100, 70, 70);
    p.get(1).endDraw();
    
    p.get(0).beginDraw();

    for (int i =0; i <cells.length; i++) {
      if (cells[i] == 1) {
        p.get(0).fill(0);
      } else {
        p.get(0).fill (255);
      }
      p.get(0).rect(i*cellSize, generation *cellSize, cellSize, cellSize);
    }
    int [] nextGen = new int [p.get(0).width/cellSize];
    for (int i = 1; i <cells.length-1; i++) {
      int state = newState(cells [i-1], cells [i], cells [i+1]);
      nextGen[i] = state;
    }

    cells = nextGen;
    generation ++;

    if (generation >p.get(0).height/cellSize) {
      for (int i=0; i <ruleSet.length; i++) {
        ruleSet[i] = int(random(2));
      }
      for (int i =0; i <cells.length; i ++) {
        cells[i] = 0;
        cells [cells.length/2] =1;
        generation = 0;
      }
    }
    p.get(0).endDraw();
  }

  //function to apply rule set to the neighborhood
  int newState(int l, int c, int r) {
    if ((l == 1)&& (c == 1) && (r == 1)) {
      return ruleSet[0];
    } else if ((l == 1)&& (c == 1) && (r == 0)) {
      return ruleSet[1];
    } else if ((l == 1)&& (c == 0) && (r == 1)) {
      return ruleSet[2];
    } else if ((l == 1)&& (c == 0) && (r == 0)) {
      return ruleSet[3];
    } else if ((l == 0)&& (c == 1) && (r == 1)) {
      return ruleSet[4];
    } else if ((l == 0)&& (c == 1) && (r == 0)) {
      return ruleSet[5];
    } else if ((l == 0)&& (c == 0) && (r == 1)) {
      return ruleSet[6];
    } else {
      return ruleSet[7];
    }
  }
}
