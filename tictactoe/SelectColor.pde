class SelectColor extends GameState {

  String whoIsPicking = "FIRST";

  SelectColor() {
  }
  boolean run() {
    background(0);
    rotations = cam.getRotations();
    
    pushMatrix();

    rotateX(rotations[0]);
    rotateY(rotations[1]);
    rotateZ(rotations[2]);

    fill(255);
    textSize(12);
    text(whoIsPicking + " player, pick your color", -70, -70);

    pushMatrix();
    translate(-100, -50);
    fill(orange);
    box(8);
    fill(255);
    textSize(5);
    text("1", 0, 10);
    popMatrix();
 
    pushMatrix();
    translate(-100, -25);
    fill(purple);
    box(8);
    fill(255);
    textSize(5);
    text("2", 0, 10);
    popMatrix();
    
    
    pushMatrix();
    translate(-100, 0);
    shape(cat,0,0);
    textSize(5);
    text("3", 0, 10);
    popMatrix();
    
    pushMatrix();
    translate(-100, 25);
    shape(fish,0,0);
    textSize(5);
    text("4", 0, 10);
    popMatrix();
    
    
    pushMatrix();
    translate(-100, 50);
    shape(houseplant,0,0);
    textSize(5);
    text("5", 0, 10);
    popMatrix();
    
    pushMatrix();
    translate(-50, -50);
    shape(sodacan,0,0);
    textSize(5);
    text("6", 0, 10);
    popMatrix();

    popMatrix();
    return done;
  }
  void keyPressed() {
    if (key == '1') {
      setShell("orange cube");
    } else if (key =='2') {
      setShell("purple cube");
    } else if(key == '3'){
      setShell("cat");
    } else if(key == '4'){
      setShell("fish");
    } else if(key == '5'){
      setShell("houseplant");
    } else if(key == '6'){
      setShell("sodacan");
    }
  }

  void setShell(String cubeColor) {
    if (whoIsPicking.equals("FIRST")) {
      firstShell = cubeColor;
      whoIsPicking = "SECOND";
    } else if(firstShell !=cubeColor) {
      secondShell = cubeColor;
      done = true;
    }
  }
}
