class Climb extends Scene {
  ArrayList<PVector> hands = new ArrayList<PVector>(); //where each hand is
  float t = 0;
  PImage handR, handL; // left and right hands
  Climb() {
    handR = loadImage("handR.PNG");
    handL = loadImage("handL.PNG");
    handR.resize(100, 100);
    handL.resize(100, 100);
    for (int i =0; i<5; i++) {
      hands.add(new PVector(width/2+100+random(-20, 20), height- i*height/5));
      hands.add(new PVector(width/2-100+random(-20, 20), height - i*height/5 - height/10));
    }
  }
  void initialize(){
    t = 0;
  }
  void run() {
    background(0);
    imageMode(CENTER);
    for (int i = 0; i<hands.size(); i++) {
      //if it is time to display that hand
      if (t-i*255>0) {
        tint(255, t-i*255); //fade in
        //every other hand is left
        if (i%2 ==0) {
          image(handR, hands.get(i).x, hands.get(i).y);
        } else {
          image(handL, hands.get(i).x, hands.get(i).y);
        }
      }
    }
    t+=4; //to make it go faster, increment t by more
    if(t-hands.size()*255>0){
      done = true;
    }
  }
}
