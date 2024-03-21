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
  jd.set("start", "$0 \n $1 \n $2 \n $3 \n $4");
  jd.set("0", "(there once lived a cowboy named | there was a weird person called) $subject");
  jd.set("1", "");
  jd.set("2", "");
  jd.set("3", "");
  jd.set("4", "");
  jd.set("subject", "");
  jd.set("adj", "");
  jd.set("presP", "");
  jd.set("presS", "");
  jd.set("past", "");
  jd.set("ger", "");
  jd.set("inf", "");
  jd.set("adv", "");
  jd.set("noun", "");

  jd.set("he", "(he)");
  jd.set("him", "(him)");
  jd.set("his", "(his)");
  return jd;
}
