class level1 extends gamestate {
  level1() {
    
  }
  boolean run() {
    kt.display();
    fill(255);
    text(kt.lane(), 100, 100);
    String d = str(kt.ducked());
    text(d, 300,100);
    return done;
  }
}
