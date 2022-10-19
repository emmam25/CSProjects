class flattriangle{
  float one, two, three, four, five, six, rotation;
  color c, c1;
  flattriangle(float one, float two, float three, float four, float five, float six, color c, float rotation){
    this.one = one;
    this.two = two;
    this.three = three;
    this.four = four;
    this.five = five;
    this.six = six;
    this.c =c;
    this.c1=c;
    this.rotation = rotation;
  }
  
  void display(){
    rotate(rotation);
    fill(c);
    triangle(one,two,three,four,five,six);
  }
  void black(){
    c=(0);
  }
  void noBlack(){
    c = c1;
  }
}
