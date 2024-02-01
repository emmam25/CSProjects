PImage image;
String[] text;
int fontSize=8;
int x=0;
int y=fontSize;
void setup() {
  background(0);
  size(displayWidth, displayHeight);
  textSize(fontSize);
  image=loadImage("Dystopia.png");
  PVector s = new PVector(image.width, image.height);
  image.resize((int)s.x/2, (int)s.y/2);
  text =loadStrings ("quotes.txt");
  char[] characters = text[0].toCharArray();
  while (y < image.height) {
    for (int i=0; i <characters.length; i++) {
      color c = image.get(x, y);
      fill(c);
      text(characters[i], x, y);
      x+=textWidth(characters[i]);
      if (x > image.width) {
        x=0;
        y+=fontSize;
      }
    }
  }
}
