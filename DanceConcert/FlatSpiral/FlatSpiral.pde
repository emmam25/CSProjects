float angle, x, vx,y,vy;
ArrayList<flattriangle> triangles = new ArrayList<flattriangle>();
color c;

void setup() {
  fullScreen();
  vx=2;
  vy=2;
   background(0);
   c = color(0,0,0);
}
void draw() {
  translate(width/2, height/2);
  noStroke();
  rotate(angle);
  int n=10;
  for (int i=0; i<n; i++) {
  //  rotate(TWO_PI/n);
    c = color(random(130,255),random(130,255),random(130,255));
    flattriangle ft = new flattriangle(x, 0.0, 
                                  x+random(width/14*x/width/14),random(height/18), 
                                  x, random(width/28),c, TWO_PI/n);
    triangles.add(ft);
   ft.display();
  }
 /* for(flattriangle t: triangles){
    t.display();
  } */ 
  angle+=random(0.06);
  x+=vx;
  y+=vy;
  if ((x>width/2 || x<0)|| (y>height/2 || y<0) ) {
   // x=0;
   // y=0;
    background(0);
    angle=0;
    vx = -vx;
    vy = -vy;
  }
}
