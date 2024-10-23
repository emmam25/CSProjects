//for exponents : https://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts
Confetti confetti;
color col = color(109, 213, 237);
String nSq = "n" + '\u00B2';
String nFour = "n" + '\u2074';
PVector pos = new PVector(200, 400);
float a = 150;
float b = 200;
float c = 250;

String text1 = "Show that a triangle with sides  " + nSq + "+ 1, " + nSq + "- 1, and 2n is right-angled.";
String onScreen1 = "";
int index1 = 0;

float t2 = 0;

String text3 = "a\u00B2 + b\u00B2 = c\u00B2";
String onScreen3 = "";
int index3 = 0;

float t4_a, t4_b;

float t5=0;

float nX =  1440;

float t7=0;

float t8 = 0;

String text9 = nFour +"+2"+ nSq + "+1";
float t9 =0;

float t10 =0;

float t11 = 0;

shear aS, bS;

int stage = 0;
void setup() {
  size(1440, 900);
  confetti = new Confetti();
  PVector av1 = new PVector(pos.x-a, pos.y);
  PVector av2 = new PVector(pos.x, pos.y);
  PVector av3 = new PVector(pos.x, pos.y+a);
  PVector av4 = new PVector(pos.x-a, pos.y+a);
  PVector bv1 = new PVector(pos.x+b, pos.y+a+b);
  PVector bv2 = new PVector(pos.x+b, pos.y+a);
  PVector bv3 = new PVector(pos.x, pos.y+a);
  PVector bv4 = new PVector(pos.x, pos.y+a+b);

  PVector goal1 = new PVector(pos.x-a, pos.y+a+b);
  float x = pos.x + (pow(a, 2)*b/(pow(a, 2) + pow(b, 2)));
  float y = pos.y + a - (pow(b, 2)*a/(pow(a, 2) + pow(b, 2)));
  PVector goal2 = new PVector(x, y);
  PVector goal3 = new PVector(x+a, y-b);
  aS = new shear(av1, av2, av3, av4, goal1, goal2, goal3, color(247, 145, 252));
  bS = new shear(bv1, bv2, bv3, bv4, goal1, goal2, goal3, color(145, 252, 187));
}
void draw() {
  background(0);
  textSize(30);
  strokeWeight(5);
  fill(col);
  text(onScreen1, 50, 50, width-10, height); // stage 1

  // stage 2
  stroke(col, t2);
  noFill();
  triangle(pos.x, pos.y, pos.x, pos.y+a, pos.x+b, pos.y+a);
  rect(pos.x, pos.y+a-20, 20, 20);
  fill(255, t2);

  //stage 3
  fill(255);
  text(onScreen3, 500, 200);

  //stage4
  noFill();
  stroke(247, 145, 252, t4_a);
  fill(247, 145, 252, t4_a/2);
  rect(pos.x-a, pos.y, a, a);
  stroke(145, 252, 187, t4_b);
  fill(145, 252, 187, t4_b/2);
  rect(pos.x, pos.y+a, b, b);

  //stage5
  noFill();
  stroke(col, t5);
  fill(col, t5/2);
  pushMatrix();
  translate(pos.x, pos.y);
  rotate(-atan(b/a));
  rect(0, 0, c, c);
  popMatrix();

  //stage6
  fill(255);
  text("n\u00B2 + 1", nX, pos.y+a/2-10);

  //stage7
  fill(255, t7);
  text("4" + nSq , 600, 300);

  //stage8
  fill(255, t8);
  text(nFour + "-2" + nSq + "+1", 590, 340);

  //stage 9
  fill(255, t9);
  text("=  " + text9, 600, 380);

  //stage 10
  fill(255, t10);
  text(text9, 600, 460);

  //stage 11
  aS.run();
  bS.run();

  if (stage == 1 && index1 <text1.length()) {
    onScreen1+=text1.substring(index1, index1+1);
    index1++;
  } else if (stage == 2) {
    t2+=5;
  } else if (stage == 3 && index3 <text3.length()) {
    onScreen3+=text3.substring(index3, index3+1);
    index3++;
  } else if (stage == 4 && t4_a<255) {
    t4_a+=5;
    t4_b+=5;
  } else if (stage == 5 && t5<255) {
    t5+=5;
  } else if (stage ==6 && nX >pos.x+b/2 + 20) {
    nX -=20;
    t4_a = 0;
    t4_b = 0;
    t5 =0;
  } else if (stage == 7) {
    t7+=5;
    if (t4_a<255) {
      t4_a+=10;
    }
  } else if (stage == 8) {
    t8+=5;
    if (t4_b<255) {
      t4_b +=10;
    }
  } else if (stage == 9) {
    t9+=5;
  } else if (stage == 10) {
    t10+=5;
    if (t5<255) {
      t5+=10;
    }
  } else if (stage ==11) {
    nX = -100;
    aS.shear1 = true;
    aS.show = true;
  } else if (stage == 12) {
    aS.shear2 = true;
    aS.shear1 = false;
  } else if (stage == 13) {
    bS.shear1 = true;
    bS.show = true;
  } else if (stage == 14) {
    bS.shear2 = true;
    bS.shear1 = false;
  } else if (stage == 15) {
    bS.shear3 = true;
    bS.shear2 = false;
    aS.shear3 = true;
    aS.shear2 = false;
  } else if (stage == 16){
    background(0);
    confetti.run();
  }
}
void keyPressed() {
  if (key == ' ') {
    stage ++;
    if(stage == 16){
      confetti.start();
    }
  }
}
void mouseClicked() {
  println(mouseX + " " + mouseY);
}
