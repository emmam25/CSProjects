float x, y, r;
color c1, c2, c3, c;
ArrayList<circle> circles = new ArrayList<circle>();
ArrayList<eyeball> eyeballs = new ArrayList<eyeball>();
ArrayList<square> squares = new ArrayList<square>();

void setup() {
  fullScreen();
  background(0);
  c=(0);
  c1=color(random(256), random(256), random(256));
  c2=color(random(256), random(256), random(256));
  c3=color(random(256), random(256), random(256));
  for (int i=0; i<200; i++) {
    int colorPick=int(random(1, 4));
    if (colorPick==1) {
      c=c1;
    } else if (colorPick==2) {
      c=c2;
    } else if (colorPick==3) {
      c=c3;
    }
    /* r = random(1,10);
     System.out.println(r);
     if(r<2){r=width/60;}  else{*/
    r= random(width/200, width/100);//}


    fill(c);
    noStroke();
    circle bob = new circle(c, r, random(width), random(height));
    circles.add(bob);
    eyeball joe = new eyeball(c, r, random(width), random(height));
    eyeballs.add(joe);
    eyeball joeCopy = new eyeball(c, r, random(width), random(height));
    eyeballs.add(joeCopy);
    square daisy = new square(c, r, random(width), random(height));
    squares.add(daisy);
  }
}


void draw() {
  background(0);
  for (circle c : circles) {
    c.run();
  }
  for (eyeball e : eyeballs) {
    e.run();
  }
  for (square s : squares) {
    s.run();
  }
}
