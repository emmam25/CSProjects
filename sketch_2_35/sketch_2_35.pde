ArrayList<Text> lines = new ArrayList<Text>();
Text t1;
ArrayList<PFont> fonts = new ArrayList<PFont>();
ArrayList<String> dialogues = new ArrayList<String>();
void setup() {
  size(1440, 900);
  fonts.add(createFont("typewriter.otf", 50));
  fonts.add(createFont("BrushScript.ttf", 50));
  fonts.add(createFont("Herculanum.ttf", 50));
  fonts.add(createFont("Papyrus.ttc", 50));
  fonts.add(createFont("doctor punk.otf", 50));
  fonts.add(createFont("KeeponTruckin.ttf", 50));
  fonts.add(createFont("Panic.ttf", 50));
  fonts.add(createFont("Popcat.otf", 50));
  fonts.add(createFont("Simplisicky.otf", 50));

  dialogues.add("Heathrow Airport Check In");
  dialogues.add("Bagel Factory");
  dialogues.add("Eat");
  dialogues.add("Excellence and taste");
  dialogues.add("Stationlink");
  dialogues.add("Buses");
  dialogues.add("WH Smith");
  dialogues.add("Mezzanine");
  dialogues.add("Heathrow Express");
  dialogues.add("Clinique");
  dialogues.add("First Class");
  dialogues.add("Fuller's");
  dialogues.add("easyCar.co");
  dialogues.add("The Mad Bishop");
  dialogues.add("Bear Public House");
  dialogues.add("Fuller's London Pride");
  dialogues.add("Dixons");
  dialogues.add("Paddington Bear");
  dialogues.add("Tickets");
  dialogues.add("Taxis");
  dialogues.add("Eastbourne Terrace");
  dialogues.add("Way Out");
  dialogues.add("Praed Street");
  dialogues.add("The Lawn");
  dialogues.add("Here Please");
  dialogues.add("Upper Crust");
  dialogues.add("Sainsbury's");
  dialogues.add("Local Information");
  dialogues.add("Great Western First");
  dialogues.add("Position Closed");
  dialogues.add("Closed");
  dialogues.add("Sock Shop");
  dialogues.add("Millie's Cookies");
  dialogues.add("Check in here");
  dialogues.add("Yo! Sushi");
  dialogues.add("Q here please");
  dialogues.add("Fast Ticket Point");
  dialogues.add("Sweet Pastries");
  dialogues.add("First Aid");
  dialogues.add("Freshly Baked Cookies and Muffins");
  dialogues.add("Cold Drinks");
  dialogues.add("Penalty Fares");
  dialogues.add("Warning");
  dialogues.add("Savory Pastries");
  dialogues.add("Platform 14");
  dialogues.add("Burger King");
  dialogues.add("Fresh Filled");
  dialogues.add("The Reef Cafe Bar");
  dialogues.add("Business Travel");
  dialogues.add("Special Edition");
  dialogues.add("Evening Standard");
  noCursor();
}
void draw() {
  background(0);
  for (int i = 0; i<lines.size(); i++) {
    lines.get(i).run();
    if (lines.get(i).pos.x > width+500 || lines.get(i).pos.y>height+500 || lines.get(i).pos.x<-500|| lines.get(i).pos.y<-500) {
      lines.remove(i);
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    lines.clear();
  } else {
    Text newText = new Text(new PVector(random(width), random(height)),dialogues.get((int)(random(dialogues.size()))));
    lines.add(newText);
  }
}
