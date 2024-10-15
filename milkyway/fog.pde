class Fog{
  PVector pos;
  float offset = random(50,100);
  color c = color(168,162,206,30);
  ArrayList<Particle> foggies = new ArrayList<Particle>();
  Fog(float x, float y){
    pos = new PVector(x,y);
    for (int i = 0; i<100; i++){
      float o = random(-offset, offset);
      float o2 = random(-offset, offset);
      Particle p = new Particle(pos.x + o, pos.y +o2, random(-5,5), random(50,100),c);
      foggies.add(p);
    }
  } 
  void display(){
    for(Particle f: foggies){
      f.display();
    }
  }
}
