void createWords() {
  ArrayList<String> rhymes = getRhymes(saved);
  if (rhymes.size()==0) { //if your name doesn't rhyme you are fred instead
    saved = "fred";
    rhymes = getRhymes("fred");
  }
  for (String r : rhymes) {
    if (RiTa.isAdjective(r)) {
      jd.set("adj", jd.get("adj") + "|" + r);
      addLines(adjLines);
    }
    if (RiTa.isAdverb(r)) {
      jd.set("adv", jd.get("adv") + "|" + r);
      addLines(advLines);
    }
    if (RiTa.isNoun(r)) {
      jd.set("noun", jd.get("noun") + "|" + r);
      addLines(nounLines);
    }
    if (RiTa.isVerb(r)) {
      //note that addLines is called within the verbTenses function
      ArrayList<String> tenses = verbTenses(r);
      for (String t : tenses) {
        jd.set(t, jd.get(t) + "|" + r);
      }
    }
  }
  jd.set("subject", saved);
  //remove starting | from all json
  removeBars();
}



ArrayList<String> getRhymes(String name) {
  ArrayList<String> rhymes= new ArrayList<String>(Arrays.asList(RiTa.rhymes(name)));
  //find last syllable
  String syllable = RiTa.syllables(name);
  syllable = syllable.substring(syllable.lastIndexOf('/') +1, syllable.length());
  syllable = syllable.replaceAll("-", "");
  //if all else fails
  if (rhymes.size() <2 && name.length() >3) {
    String end = name.substring(name.length()-3);
    rhymes.addAll(Arrays.asList(RiTa.rhymes(end)));
    rhymes.addAll(Arrays.asList(RiTa.rhymes(syllable)));
  }
  return rhymes;
}
