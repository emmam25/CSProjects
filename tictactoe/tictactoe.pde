import peasy.*;

PeasyCam cam;

SelectColor selectcolor;

PlayGame level1;

GraphicsManager gm;

ShowReplay replay;

float[] rotations;
//holds the state of each cube in the game
int[][][] cubes = new int[4][4][4];

//holds the previous moves so you can undo
ArrayList<int[][][]> time = new ArrayList<int[][][]>();


color purple = color(160, 0, 255);
color orange = color(255, 160, 0);

String firstShell = "orange cube";
String secondShell = "purple cube";


ArrayList<GameState> gamestates;


int place =0;


PShape cat, fish, houseplant, sodacan;


void setup() {
  size(displayWidth, displayHeight, P3D);
  cam = new PeasyCam(this, 0, 0, 0, 150);
  cam.setWheelHandler(null);
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(150);

  selectcolor = new SelectColor();

  level1 = new PlayGame();

  replay = new ShowReplay();

  gamestates = new ArrayList<GameState>();
  gamestates.add(selectcolor);
  gamestates.add(level1);
  gamestates.add(replay);

  cat = loadShape("bot.obj");
  cat.scale(0.3);
  cat.translate(0, 0, 0);

  fish = loadShape("fish.obj");
  fish.scale(10.0);

  houseplant = loadShape("houseplant.obj");
  houseplant.scale(0.4);
  houseplant.rotateX(PI); //the houseplant was upside down when I imported it

  sodacan = loadShape("sodacan.obj");
  sodacan.scale(1.2);
}


void draw() {
  if (gamestates.get(place).run()) {
    place++;
    if (place>=gamestates.size()) {
      place = gamestates.size()-1;
    }
    if (place == gamestates.size()-1) {
      replay.startTimer();
    }
  }
}


void keyPressed() {
  gamestates.get(place).keyPressed();
}
