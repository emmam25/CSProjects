import rita.*;
import java.util.*;

String typing = "";
String saved = "";
String poem = "";

StringDict jd;
String rules;
RiGrammar grammar;

//these are possible lines that can be used with an adjective rhyme
//the place in the array is the line in the poem
String[] adjLines = new String[5];


void setup() {
  size(800, 800);

  adjLines[1] = "$his friends said he was too $adj";
  adjLines[2] = "but $he was $adj";
  adjLines[3] = "and was always $adj";
  adjLines[4] = "so they never again called $him $adj";
  
  jd = jd();
}
void draw() {
  background(255);
  fill(0);
  text(typing, 50, 200);
  text(poem, 100, 50);
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
    poem = grammar.expand();
  } else if (key >37 && keyCode!=SHIFT) {
    typing = typing + key;
  }
}
