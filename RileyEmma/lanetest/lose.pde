class lose extends gamestate{
  lose(){
  }
  boolean run() {
    background(255,0,0);
    text("you are dead. hooray!", width/2, height/2);
    return done;
  }
}
