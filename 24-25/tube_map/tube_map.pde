//put other map behind with less opacity?

//Tube stops:  Warwick Avenue, Maida Vale,
//Kilburn Park, Queen's Park, Kensal Green, Willesden Junction
PImage map;
float size;
boolean start = false;
ArrayList<Name> names = new ArrayList<Name>();
int nameIndex = 0;
void setup() {
  size(1440, 900);
  textSize(18);
  map = loadImage("bakerloo.png");
  size = map.width;
  Name wa = new Name(465,432, "Warwick Avenue");
  names.add(wa);
  Name mv = new Name(572,360, "Maida Vale");
  names.add(mv);
  Name kp = new Name(475, 300, "Kilburn Park");
  names.add(kp);
  Name qp = new Name(460,390, "Queen's Park");
  names.add(qp);
  Name kg = new Name(350, 350, "Kensal Green");
  names.add(kg);
  Name wj = new Name(300, 400, "Willesden Junction");
  names.add(wj);
}
void draw() {
  background(0);
  image(map, 0, 0);
  //lines
  stroke(255);
  line(529, 404, 502, 413); //wa
  line(536,365,560,356); //mv
  line(505,338,515,310); //kp
  line(469, 348,470,377); //qp
  line(403,373,403,350); //kg
  line(332,356,334,380); //wj

  fill(0);
  stroke(0);
  rect(0, 0, size, size);
  fill(255);
/*  for (int i = 0; i<map.height; i+=50) {
    text(i, 20, i);
  }
  for (int i = 0; i<map.width; i+=50) {
    text(i, i, 20);
  }*/
  for (Name n : names) {
    n.run();
  }
  if (start) {
    size--;
  }
}

void keyPressed() {
  if (key == ' ') {
    start = true;
  } else if (key == 'q') {
    names.get(nameIndex).on = true;
    nameIndex++;
  }
}
void mouseClicked() {
  println(mouseX + " " + mouseY);
}
