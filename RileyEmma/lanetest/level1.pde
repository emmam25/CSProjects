class level1 extends gamestate {
  box b;
  int score;
  ArrayList<box> boxes;
  level1() {
    b = new box ("RIGHT");
    boxes  = new ArrayList<box>();
    boxes.add(b);
  }
  boolean run() {
    for (int i = 0; i<boxes.size(); i++) {
      boxes.get(i).run();

      if (boxes.get(i).big && kt.lane().equals(boxes.get(i).lane)) {
        done = true;
      }
      
      if(boxes.get(i).big){
        boxes.remove(i);
        score ++;
      }
    }
    if(boxes.size()==0){
      int random = int (random(0,3));
      box b2;
      if(random ==0){      b2 = new box ("LEFT");}
      else if (random == 1){b2 = new box ("RIGHT");}
      else{b2 = new box ("MID");}
      boxes.add(b2);
      println(b2.lane);
    }
    kt.display();
    fill(255);
    text(kt.lane(), 100, 100);
    String d = str(kt.ducked());
    text("ducked:"+ d, 300, 100);
    String j = str(kt.jumped());
    text("jumped:" + j, 500, 100);
    text("score: "+ score, 700,100);
    return done;
  }
}
