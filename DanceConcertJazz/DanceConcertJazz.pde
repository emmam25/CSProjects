PImage dancer1;
ArrayList<Pixel> points = new ArrayList<Pixel>();
void setup(){
 fullScreen();
 dancer1 = loadImage("Dancer2.png");
  dancer1.loadPixels();
// dancer1.updatePixels();
  int i=0;
   /*println(dancer1.width);
      println(dancer1.height);
     println(dancer1.pixels.length); */
  for(int y=0; y<dancer1.height; y++){
    for(int x=0; x<dancer1.width; x++){
      if (dancer1.pixels[i] != color(255,153,27)){
        Pixel p = new Pixel(0,0,x,y, dancer1.pixels[i]);
        points.add(p); 
      }
      i++;
    }
  }
}
void draw(){
  for(int i =0; i< points.size(); i++){
    points.get(i).display();
  }
}
