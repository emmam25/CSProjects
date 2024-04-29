import processing.sound.*;

//typewriter - clackity clack + bell

import rita.*;
import java.util.*;

PFont font;

Typewriter tw;
SoundFile typewriting, bell;

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
  typewriting = new SoundFile(this, "typewriting.wav");
  bell = new SoundFile(this, "bell.wav");

  font = createFont("OldNewspaperTypes.ttf", 128);
  textFont(font);

  lineOptions(); //initializes the lines
  jd = jd();
  tw = new Typewriter();

  buttons = new Buttons();
}
void draw() {
  background(255);
  fill(0);
  textSize(20);
  textAlign(CORNER);
  text("Type your name and select your pronouns for a custom poem!", width/3, height/5);
  text("name: " + typing, width/20, height/4);
  tw.run();
  buttons.display();

  fill(255, 0, 0);
  noStroke();
  rectMode(CENTER);
  rect(width/2, 4*height/5, 100, 50);
  textAlign(CENTER);
  fill(255);
  text("CLEAR", width/2, 4*height/5);

  fill(0, 255, 0);
  rect(width/2, 4*height/5 -75, 100, 50);
  fill(255);
  text("GO", width/2, 4*height/5 - 75);
}

void keyPressed() {
  if (key == '\n' ) {
    jd = jd();
    saved = typing;
    typing = "";
    createWords();
    JSONObject json = new JSONObject(jd);
    rules = json.toString();
    print(rules);
    grammar = RiTa.grammar(rules);
    tw.setValue(grammar.expand());
    tw.startAdd();
  } else if (key == BACKSPACE && typing.length()>0) {
    typing = typing.substring(0, typing.length() -1);
  } else if (key >37 && keyCode!=SHIFT) {
    typing = typing + key;
  }
}
void mouseClicked() {
  buttons.mouseClicked();
  if (mouseX >width/2 - 50 && mouseX<width/2+50 && mouseY>4*height/5 -25 && mouseY<4*height/5 + 25) {
    tw.setValue("");
    tw.reset();
    buttons.reset();
  } else if (mouseX >width/2 - 50 && mouseX<width/2+50 && mouseY>4*height/5 -100 && mouseY<4*height/5 - 50) {
    jd = jd();
    saved = typing;
    typing = "";
    createWords();
    JSONObject json = new JSONObject(jd);
    rules = json.toString();
    grammar = RiTa.grammar(rules);
    tw.setValue(grammar.expand());
    tw.startAdd();
  }
}
