class Buttons {
  PVector she, he, they; //locations of the options
  float buttonSize;
  PVector selected;
  Buttons() {
    she = new PVector(width/5, height/2);
    he = new PVector(width/5, height/2 + 50);
    they = new PVector(width/5, height/2 + 100);
    selected = new PVector(-100, -100);
    buttonSize = 20;
  }
  void mouseClicked() {
    if (dist(mouseX, mouseY, she.x, she.y) < buttonSize) {
      pronouns = new String[]{"she", "her", "her"};
      selected =she;
    } else if (dist(mouseX, mouseY, he.x, he.y) <buttonSize) {
      pronouns = new String[]{"he", "him", "his"};
      selected = he;
    } else if (dist(mouseX, mouseY, they.x, they.y) <buttonSize) {
      pronouns = new String[]{"they", "them", "their"};
      selected = they;
    }
  }

  void display() {
    fill(255);
    stroke(0);
    circle(she.x, she.y, buttonSize);
    circle(he.x, he.y, buttonSize);
    circle(they.x, they.y, buttonSize);
    fill(0);
    text("she/her", she.x+buttonSize+5, she.y);
    text("he/him", he.x+buttonSize+5, he.y);
    text("they/them", they.x+buttonSize+5, they.y);
    circle(selected.x, selected.y, buttonSize/2);
  }
}
