void addLines(String[] lines) {
  for (int i = 1; i<5; i++) {
    jd.set(Integer.toString(i), jd.get(Integer.toString(i)) + "|" +lines[i]);
  }
}

void removeBars() {
  for (String s : jd.keys()) {
    if (jd.get(s).length()>0 && jd.get(s).substring(0, 1).equals("|")) {
      jd.set(s, jd.get(s).substring(1));
    }
  }
}

StringDict jd() {
  StringDict jd = new StringDict();
  //main
  jd.set("start", "$0 \n$1 \n$2 \n$3 \n$4");
  jd.set("0", "there once lived a $profession named $subject");
  jd.set("1", "");
  jd.set("2", "");
  jd.set("3", "");
  jd.set("4", "");
  jd.set("subject", "");

  //rhymes
  jd.set("adj", "");
  jd.set("presP", "");
  jd.set("presS", "");
  jd.set("past", "");
  jd.set("ger", "");
  jd.set("inf", "");
  jd.set("adv", "");
  jd.set("noun", "");
  
  // pronouns
  jd.set("he", pronouns[0]);
  jd.set("him", pronouns[1]);
  jd.set("his", pronouns[2]);

  //misc
  jd.set("profession", "cowboy|coder|dancer|scientist|monarch|swimmer|teacher|pill bug|person");
  jd.set("character", "everyone|$his cousin|the baker|$his pet dog|$his best friend|that guy Joe");
  jd.set("characters", "ladybugs|the people|$his friends|the children|$his parents");
  jd.set("body_parts", "eyes|feet|ears|fingers|toes");
  jd.set("long_verb", "fell down a well | always did things | spied on $character | ate $his breakfast");
  return jd;
}

void lineOptions() {
  adjLines[1] = "$characters called $him too $adj";
  adjLines[2] = "but $he seemed $adj";
  adjLines[3] = "and $he appeared $adj";
  adjLines[4] = "so they never again called $him $adj";

  nounLines[1] = "who really wanted $noun.art()";
  nounLines[2] = "then $he found $noun.art()";
  nounLines[3] = "and $he tripped on $noun.art()";
  nounLines[4] = "so $he turned into $noun.art()";

  advLines[1] = "who $long_verb $adv";
  advLines[2] = "$he walked around $adv";
  advLines[3] = "$he fell over $adv";
  advLines[4] = "and $characters cheered for $him $adv";

  presSLines[1] = "$he knows that $character $presS";
  presSLines[2] = "but $character $presS";
  presSLines[3] = "and $character $presS";
  presSLines[4] = "so now $character $presS";

  presPLines[1] = "$characters all see $him and $presP";
  presPLines[2] = "$he saw $characters $presP";
  presPLines[3] = "($characters|$his $body_parts) always $presP";
  presPLines[4] = "and ($characters|$his $body_parts) almost never $presP";

  pastLines[1] = "who $long_verb and then $past";
  pastLines[2] = "but at night $he $past";
  pastLines[3] = "and $person $past";
  pastLines[4] = "on $his birthday he woke up and $past";

  infLines[1] = "$he always wanted $inf";
  infLines[2] = "$he wanted $inf";
  infLines[3] = "$he seemed $inf";
  infLines[4] = "it would be really great $inf";

  gerLines[1] = "$he saw $characters $ger";
  gerLines[2] = "$he really likes $ger";
  gerLines[3] = "$he can't stop $ger";
  gerLines[4] = "but $characters stop him from $ger";
}
