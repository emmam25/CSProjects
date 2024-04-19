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
  adjLines[1] = "$characters called $him too $adj.nr()";
  adjLines[2] = "but $he seemed $adj.nr()";
  adjLines[3] = "and $he appeared $adj.nr()";
  adjLines[4] = "so they never again called $him $adj.nr()";

  nounLines[1] = "who really wanted $noun.nr().art()";
  nounLines[2] = "then $he found $noun.nr().art()";
  nounLines[3] = "and $he tripped on $noun.nr().art()";
  nounLines[4] = "so $he turned into $noun.nr().art()";

  advLines[1] = "who $long_verb $adv.nr()";
  advLines[2] = "$he walked around $adv.nr()";
  advLines[3] = "$he fell over $adv.nr()";
  advLines[4] = "and $characters cheered for $him $adv.nr()";

  presSLines[1] = "$he knows that $character $presS.nr()";
  presSLines[2] = "but $character $presS.nr()";
  presSLines[3] = "and $character $presS.nr()";
  presSLines[4] = "so now $character $presS.nr()";

  presPLines[1] = "$characters all see $him and $presP.nr()";
  presPLines[2] = "$he saw $characters $presP.nr()";
  presPLines[3] = "($characters|$his $body_parts) always $presP.nr()";
  presPLines[4] = "and ($characters|$his $body_parts) almost never $presP.nr()";

  pastLines[1] = "who $long_verb and then $past.nr()";
  pastLines[2] = "but at night $he $past.nr()";
  pastLines[3] = "and $character $past.nr()";
  pastLines[4] = "on $his birthday $he woke up and $past.nr()";

  infLines[1] = "$he always wanted $inf.nr()";
  infLines[2] = "$he wanted $inf.nr()";
  infLines[3] = "$he seemed $inf.nr()";
  infLines[4] = "it would be really great $inf.nr()";

  gerLines[1] = "$he saw $characters $ger.nr()";
  gerLines[2] = "$he really likes $ger.nr()";
  gerLines[3] = "$he can't stop $ger.nr()";
  gerLines[4] = "but $characters stop him from $ger.nr()";
}
