class level1 extends gamestate {
  box b;
  int score;
  ArrayList<obstacle> obstacles;
  level1() {
    b = new box ("RIGHT");
    obstacles  = new ArrayList<obstacle>();
    obstacles.add(b);
  }
  boolean run() {
    for (int i = 0; i<obstacles.size(); i++) {
      obstacles.get(i).run();
      if (obstacles.get(i).getClass() == box.class) {
        if (obstacles.get(i).big && kt.lane().equals(obstacles.get(i).lane)) {
          done = true;
        }
      } else if (obstacles.get(i).getClass() == headWhacker.class) {
        if (obstacles.get(i).big && kt.lane().equals(obstacles.get(i).lane) && !kt.ducked()) {
          done = true;
        }
      }

      if (obstacles.get(i).big) {
        obstacles.remove(i);
        score ++;
      }
    }
    if (obstacles.size()==0) {
      String filledLane = "NONE";
      for (int i=0; i<2; i++) {
        int random = int (random(0, 2));
        int random2 = int (random(0, 3));
        obstacle b2;
        if (random == 0) {
          if (random2 ==0 && filledLane !="LEFT") {
            b2 = new box ("LEFT");
            filledLane = "LEFT";
          } else if (random2 == 1 && filledLane !="RIGHT") {
            b2 = new box ("RIGHT");
            filledLane = "RIGHT";
          } else {
            b2 = new box("MID");
            if (filledLane =="MID") {
              b2.big = true;
            } else {
              filledLane = "MID";
            }
          }
        } else {
          println("yay");
          if (random2 ==0 && filledLane !="LEFT") {
            b2 = new headWhacker ("LEFT", kt.ducklineY);
            filledLane = "LEFT";
          } else if (random2 == 1 && filledLane !="RIGHT") {
            b2 = new headWhacker ("RIGHT", kt.ducklineY);
            filledLane = "RIGHT";
          } else {
            b2 = new headWhacker("MID", kt.ducklineY);

            if (filledLane =="MID") {
              b2.big = true;
            } else {
              filledLane = "MID";
            }
          }
        }

        obstacles.add(b2);
      }
    }
    kt.display();
    fill(255);
    text(kt.lane(), 100, 100);
    String d = str(kt.ducked());
    text("ducked:"+ d, 300, 100);
    String j = str(kt.jumped());
    text("jumped:" + j, 500, 100);
    text("score: "+ score, 700, 100);
    return done;
  }
}
