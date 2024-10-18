float angle =0;
float wid = 0;
int stage = 1;
int index = 0;
String title = "WILLESDEN JUNCTION";
String onScreen = "";
void setup() {
  size(800, 800);
}
void draw() {
  background(0);
  stroke(239,55,43);
  noFill();
  strokeWeight(50);
  arc(width/2, height/2, 400, 400, 0, angle);
  
  noStroke();
  fill(31,69,162);
  rect(100, height/2 - 50, wid, 100);
  
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text(onScreen, width/2, height/2 + 18);
  if (stage == 1) {
    angle+=0.05;
  } else if (stage ==2 && wid <600){
    wid+=5;
  } else if (stage ==3 && index <title.length()){
    onScreen+= title.substring(index, index+1);
    index++;
  }
}
void keyPressed(){
  stage++;
}
