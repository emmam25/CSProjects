class Display{
  int requiredSides = 2;
  Display(){}
  void display(ArrayList<PGraphics> p){
    if(p.size() != requiredSides){
      return;
    }
  }
}
