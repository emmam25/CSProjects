class Pixel{
  PVector first, last, position, velocity;
  color c;
  Pixel(int xf, int yf, int xl, int yl, color c){
    first = new PVector (xf,yf);
    last = new PVector(xl,yl); 
    position = new PVector (xf, yf);
    this.c =c;
    velocity = new PVector(0,0);
  }
  void display(){
    fill(c);
    point(position.x, position.y);
    position.add(velocity);
  }
}
