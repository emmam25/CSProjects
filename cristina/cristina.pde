PImage back;
PImage girl;
PImage houses;

float houseTint;
float girlTint;

float housePlus;
float girlPlus;

float houseTrigger; //the house value that should trigger the girl

PGraphics pg;

void setup() {
  size(displayWidth, displayHeight);
  back = loadImage("background.png");
  girl = loadImage("girl.png");
  houses = loadImage("houses.png");
  pg = createGraphics(width, height);

  houseTint = 0;
  girlTint =0;
  
  housePlus = 10;
  girlPlus = 10;
  
  houseTrigger = 150;
}
void draw() {
  pg.beginDraw();
  pg.background(0);
  pg.image(back, 0, 0, width, height);
  pg.tint(255, houseTint);
  pg.image(houses, 0, 0, width, height);
  pg.tint(255, girlTint);
  pg.image(girl, 0, 0, width, height);
  pg.noTint();
  pg.endDraw();
  image(pg, 0, 0);
  
  houseTint+=housePlus;
  if(houseTint>houseTrigger){
    girlTint+=girlPlus;
  }
}
