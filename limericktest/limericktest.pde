import rita.*;
import java.util.*;

String typing = "";
String saved = "";
String poem = "";

JSONObject json;
String rules;
RiGrammar grammar;


void setup() {
  size(800, 800);
  json = loadJSONObject("test.json");
  rules = json.toString();
  grammar = RiTa.grammar(rules);
  poem = grammar.expand();
}
void draw() {
  background(255);
  fill(0);
  text(typing, 50, 200);
  text(poem, 100, 50);
}

void keyPressed() {
  if (key == '\n' ) {
    saved = typing;
    typing = "";
    createWords();
  } else if (key >37 && keyCode!=SHIFT) {
    typing = typing + key;
  }
}

void mousePressed() {
  poem = grammar.expand();
}
