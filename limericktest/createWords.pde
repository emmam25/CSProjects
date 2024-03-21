void createWords() {
  ArrayList<String> rhymes = getRhymes(saved);
  ArrayList<Word> words = new ArrayList<Word>();
  if (rhymes.size()==0) { //if your name doesn't rhyme you are fred instead
    saved = "fred";
    rhymes = getRhymes(saved);
  }
  for (String r : rhymes) {
    if (RiTa.isAdjective(r)) {
      words.add(new Word("adj", r));
      addLines(adjLines);
    }
    if(RiTa.isAdverb(r)){
      words.add(new Word("adv", r));
    }
    if(RiTa.isNoun(r)){
      words.add(new Word("noun", r));
    }
    if(RiTa.isVerb(r)){
      words.addAll(conjugate(r));
    }
  }

  for (Word w : words) {
    if (RiTa.isRhyme(w.value, saved)) {
      jd.set(w.type, jd.get(w.type) + "|" + w.value);
    }
  }
  jd.set("subject", saved);
    //remove starting | from all json
  removeBars();
 // print(jd);
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
