//main.js
let x, w, g, g2;
function setup(){
  createCanvas(800,800);
  x= 0;
  y =800;
  g = 0;
  g2=0;
}
function draw(){
  //background(0);
  fill(0,g,0)
  ellipse(x,450,100,x);
  fill(g2,0,0);
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
    if(g==0){g = 255}
    else {g=0}
    if(g2==0){g2 = 255}
    else {g2=0}

});

onclick = (event) => {};
