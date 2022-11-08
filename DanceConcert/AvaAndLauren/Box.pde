class Box{
  int t;
  int tchange;
  Box(int t){
    this.t =t;
  }
  void setT(int n){
    t=n;
  }
  void startIncrement(){
     tchange = 3;
  }
  void startDecrement(){
     tchange = -3;
  }
  void run(){
    t += tchange;
    fill(0,0,0,t);
    rect(0,0,width,height);
    if((t>255)||(t<0)){
      tchange=0;
    }
  }
}
