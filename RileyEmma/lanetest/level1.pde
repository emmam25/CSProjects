class level1 extends gamestate {
  box b;
  int score;
  float lerpIncrement = 0.05;
  float lerpAcceleration = 0.0001;
  ArrayList<obstacle> obstacles;
  avatar myavatar;
  //changes how many obstacles come at a time
  int numberOfObstacles = 2;
  tracker kt;

  level1(tracker kt, PApplet p) {
    b = new box ("RIGHT", lerpIncrement);
    obstacles  = new ArrayList<obstacle>();
    obstacles.add(b);
    myavatar = new avatar (p);
    this.kt = kt;
  }


  boolean run() {
    lerpIncrement += lerpAcceleration; 
    for (int i = 0; i<obstacles.size(); i++) {
      //update and display all obstacles
      obstacles.get(i).run();

      //check boxes
      if (obstacles.get(i).getClass() == box.class) {
        if (obstacles.get(i).big && kt.lane().equals(obstacles.get(i).lane)) {
          done = true;
        }

        //check head whackers
      } else if (obstacles.get(i).getClass() == headWhacker.class) {
        if (obstacles.get(i).big && kt.lane().equals(obstacles.get(i).lane) && !kt.ducked()) {
          done = true;
        }

        //check foot whackers
      } else if (obstacles.get(i).getClass() == footWhacker.class) {
        if (obstacles.get(i).big && kt.lane().equals(obstacles.get(i).lane)) {
          done = true;
        }

        if ( kt.lane().equals(obstacles.get(i).lane) && kt.jumped()) {
          obstacles.get(i).big = true;
        }
      }
      //remove big obstacles and increase score
      if (obstacles.get(i).big) {
        obstacles.remove(i);
        score ++;
      }
    }

    //add new obstacles
    if (obstacles.size()==0) {
      //all lanes are now empty
      String filledLane = "NONE";

      //change max value of i to affect the number of obstacles generated at once
      for (int i=0; i<numberOfObstacles; i++) {
        //randmoize the positions of the obstacles

        //the first random decides the type of obstacle
        int random = int (random(0, 3));
        //the second random decides the lane
        int random2 = int (random(0, 3));

        obstacle b2;
        //create a box if random is 0
        if (random == 0) {
          /*I think this code should be rewritten-
           we could probably do this better with a while loop or something */
          if (random2 ==0 && filledLane !="LEFT") {
            b2 = new box ("LEFT", lerpIncrement);
            filledLane = "LEFT";
          } else if (random2 == 1 && filledLane !="RIGHT") {
            b2 = new box ("RIGHT", lerpIncrement);
            filledLane = "RIGHT";
          } else {
            b2 = new box("MID", lerpIncrement);
            if (filledLane =="MID") {
              b2.big = true;
            } else {
              filledLane = "MID";
            }
          }
          //creates a headWhacker if random is 1
        } else if (random ==1) {
          if (random2 ==0 && filledLane !="LEFT") {
            b2 = new headWhacker ("LEFT", kt.ducklineY, lerpIncrement);
            filledLane = "LEFT";
          } else if (random2 == 1 && filledLane !="RIGHT") {
            b2 = new headWhacker ("RIGHT", kt.ducklineY, lerpIncrement);
            filledLane = "RIGHT";
          } else {
            b2 = new headWhacker("MID", kt.ducklineY, lerpIncrement);

            if (filledLane =="MID") {
              b2.big = true;
            } else {
              filledLane = "MID";
            }
          }

          //create a foot whacker if random is 2
        } else {
          if (random2 ==0 && filledLane !="LEFT") {
            b2 = new footWhacker ("LEFT",  lerpIncrement);
            filledLane = "LEFT";
          } else if (random2 == 1 && filledLane !="RIGHT") {
            b2 = new footWhacker ("RIGHT", lerpIncrement);
            filledLane = "RIGHT";
          } else {
            b2 = new footWhacker("MID", lerpIncrement);

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

     myavatar.run(kt.lane(), kt.ducked(), kt.jumped());
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
  
  void keyPressed(){
    kt.keyPressed();
  }
}
