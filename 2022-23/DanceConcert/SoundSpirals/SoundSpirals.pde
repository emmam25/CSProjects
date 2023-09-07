import processing.sound.*;


float angle, x, vx,y,vy, threshold;
int random;


Amplitude amp;

AudioIn in;


void setup() {
  fullScreen();
  noCursor();
  vx=3;
  vy=3;
  background(0);
  in = new AudioIn(this);
  in.start();
  amp = new Amplitude(this);
  amp.input(in);
  
 /******************************/ 
/******/  threshold = 0.2; /****/
 /*****************************/ 
  
  
}
void draw() {
  
  translate(width/2, height/2);
  noStroke();
  rotate(angle);
  int n=10;
  
  for (int i=0; i<n; i++) {
    rotate(TWO_PI/n);
  //  fill(random(0,255),random(0,255),random(0,255), random(0, 255));
     fill(random(130,255),random(130,255),random(130,255), random(0, 255));
    triangle(x, 0, x+random(100),random(50), x, random(50));
    fill(random(130,255),random(130,255),random(130,255), random(0, 255));
    triangle(50,y,50+random(50),y+random(50),50+random(50),y);
   // fill(random(0,130),random(0,130),random(0,130), random(0, 255));
    fill(random(130,255),random(130,255),random(130,255), random(0, 255));
    triangle(x,y,x+random(50),y+random(50),x+random(50),y);
  }
  
  
  angle+=0.03;
  
  x+=vx;
  y+=vy;
  
  random = (int)random(2);
  
  if(amp.analyze()>threshold){
    background(0);
    angle=0;
    
    if(random == 0){   
      x=0;
      y = random(height/2);
    }
    else{
      y=0;
      x= random(width/2);
    }
  }
  
  if (x>width || x<0) {
    x=0;
    background(0);
    angle=0;
  }
  
  if (y>height || y<0) {
    y=0;
    background(0);
    angle =0;
  }
  
}
