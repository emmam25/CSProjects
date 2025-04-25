class Confetti{
  ArrayList<Particle> particles = new ArrayList<Particle>();
  Confetti(){
  }
  void start(){
    loadPixels();
    for(int i = 0; i<g.width-1; i+=10){ //increment by 10 so we don't get too much confetti
      for(int j = 0; j<g.height-1; j+=10){
        int index = i+j*width;
        //if it's not black, make confetti
        if(pixels[index] != color(0,0,0)){
          Particle p = new Particle(new PVector(i,j));
          particles.add(p);
        }
      }
    }
  }
  void run(){
    for(Particle p: particles){
      p.run();
    }
  }
}
