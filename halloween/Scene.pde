abstract class Scene{
  boolean done = false;
  void initialize(){}
  void run(){}
  void keyPressed(){}
}

class Blank extends Scene{
   float time = millis();
   void initialize(){
     time = millis();
   }
    void run(){
      fill(0);
      rect(0,0,width,height);
      if(millis() - time >1000){
        done = true;
      }
    }
}
