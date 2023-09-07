let b;

function setup() {
  createCanvas(400, 400);

  b = new Box(200,200, 0,0,0.03, 0);

}

function draw() {
  background(0);

  b.display();
}

class Box{

  constructor(x,y, xVel, yVel, xAcc, yAcc){
    this.x =x;
    this.y =y;
    this.xVel = xVel;
    this.yVel = yVel;
    this.xAcc = xAcc;
    this.yAcc = yAcc;
  }

  display(){
    fill(255);
    rect(this.x, this.y, 20,20);
    this.x += this.xVel;
    this.y += this.yVel;
    this.xVel += this.xAcc;
    this.yVel+= this.yAcc;
  }
}
