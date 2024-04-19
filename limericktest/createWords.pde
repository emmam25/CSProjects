void createWords() {
  Set<String> rhymes = getRhymes(saved);
  if (rhymes.size()==0) { //if your name doesn't rhyme you are fred instead
    jd.set("profession", saved);
    saved = "fred";
    rhymes = getRhymes("fred");
  }
/* Set<String> rhymes = new HashSet<String>();
 rhymes.add("hello");
 rhymes.add("bye");
 rhymes.add("up");
 rhymes.add("down");*/
  print(rhymes);
  for (String r : rhymes) {
    //only add each word as one part of speech (to avoid repeats)
    if (RiTa.isAdjective(r)) {
      jd.set("adj", jd.get("adj") + "|" + r);
      addLines(adjLines);
    } else if (RiTa.isAdverb(r)) {
      jd.set("adv", jd.get("adv") + "|" + r);
      addLines(advLines);
    } else if (RiTa.isNoun(r)) {
      jd.set("noun", jd.get("noun") + "|" + r);
      addLines(nounLines);
    } else if (RiTa.isVerb(r)) {
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



Set<String>  getRhymes(String name) {
  Set<String> rhymes_set = new HashSet<String>();

  ArrayList<String> rhymes= new ArrayList<String>(Arrays.asList(RiTa.rhymes(name)));
  rhymes_set.addAll(rhymes);

  if (rhymes.size() <4 && name.length() >3) {
    //find last syllable
    String syllable = RiTa.syllables(name);
    syllable = syllable.substring(syllable.lastIndexOf('/') +1, syllable.length());
    syllable = syllable.replaceAll("-", "");
    rhymes_set.addAll(Arrays.asList(RiTa.rhymes(syllable)));
  }  
  return rhymes_set;
}
