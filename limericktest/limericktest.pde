//easier to read
//typewriter

import rita.*;
import java.util.*;

PFont font;

Poem poem;

String typing = "";
String saved = "";

StringDict jd;
String rules;
RiGrammar grammar;
Buttons buttons;

//these are possible lines that can be used with an adjective rhyme
//the place in the array is the line in the poem
//see other tab for line definitons
String[] adjLines = new String[5];
String[] nounLines = new String[5];
String[] advLines = new String[5];
String[] presPLines = new String[5];
String[] presSLines = new String[5];
String[] pastLines = new String[5];
String[] infLines = new String[5];
String[] gerLines = new String[5];

String[] pronouns = new String[]{"they", "them", "their"};


void setup() {
  fullScreen();
  font = createFont("OldNewspaperTypes.ttf", 128);
  
  lineOptions(); //initializes the lines
  jd = jd();
  poem = new Poem();

  buttons = new Buttons();
}
void draw() {
  background(255);
  fill(0);
  textSize(20);
  text("name: " + typing, width/20, height/4);
  textAlign(CENTER);
 // textFont(font);
  text(poem.makePoem(), width/2, height/2);
  textAlign(CORNER);
  buttons.display();
}

void keyPressed() {
  if (key == '\n' ) {
    jd = jd();
    saved = typing;
    typing = "";
    createWords();
    JSONObject json = new JSONObject(jd);
    rules = json.toString();
    grammar = RiTa.grammar(rules);
    poem.setValue(grammar.expand());
    poem.startAdd();
  } else if (key >37 && keyCode!=SHIFT) {
    typing = typing + key;
  }
}
void mouseClicked() {
  buttons.mouseClicked();
}
