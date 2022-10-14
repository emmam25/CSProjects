class blob{
  PVector position;
  float transparency=255;
  float increment=-3;
  float r,b,g;
  blob(PVector position, float red, float blue, float green){
    this.position = new PVector(position.x, position.y);
    r=red;
    b= blue;
    g = green;
  }
  void display(){
    fill(r,g,b, transparency);
    ellipse(position.x, position.y, width, height);
    transparency += increment;
    if((transparency <0)||(transparency>255)){
      increment = -increment;
    }
  }
}
