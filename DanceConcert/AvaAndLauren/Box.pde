class Box {
  int t;
  int tchange;
  Box(int t) {
    this.t =t;
  }
  void setT(int n) {
    t=n;
  }
  void startIncrement() {
    tchange = 255;
  }
  void startDecrement() {
    tchange = -5;
  }
  void run() {
    t += tchange;
    fill(0, 0, 0, t);
    rect(0, 0, width, height);
    if ((t>255)||(t<0)) {
      tchange=0;
    }if (t>=255){
      blank = true;
    }else {
      blank = false;
    }
    //println(t);
  }
}
