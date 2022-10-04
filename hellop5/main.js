//main.js
let x, w, g, g2, z, z2;
function setup(){
  createCanvas(800,800);
  x= 0;
  y =800;
  g = 0;
  g2=0;
  z=255;
  z2=255;
}
function draw(){
  //background(0);
  noStroke();
  fill(x/2,g,z)
  ellipse(x,450,100,x);
  fill(g2,y/2,z2);
  ellipse(y, 450,100,y);
  x+=5;
  y-=5;
  if(x>900){
    x=-100;
  }
  if(y<-100){
    y=900;
  }
}
addEventListener('click', (event) => {
    if(g==0){g = 255; z=0}
    else {g=0; z=255}
    if(g2==0){g2 = 255; z2=0}
    else {g2=0; z2=255}

});

onclick = (event) => {};
