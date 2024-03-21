ArrayList<Word> conjugate(String v) {
  ArrayList<Word> verbs = new ArrayList<Word>();
  HashMap presP = new HashMap(); //present plural
  presP.put("tense", RiTa.PRESENT);
  presP.put("number", RiTa.PLURAL);
  presP.put("person", RiTa.THIRD);
  verbs.add(new Word ("presP", RiTa.conjugate(v, presP)));

  HashMap presS = new HashMap();
  presS.put("tense", RiTa.PRESENT);
  presS.put("number", RiTa.SINGULAR);
  presS.put("person", RiTa.THIRD);
  verbs.add(new Word ("presS", RiTa.conjugate(v, presS)));

  HashMap past = new HashMap();
  past.put("tense", RiTa.PAST);
  past.put("number", RiTa.SINGULAR);
  past.put("person", RiTa.THIRD);
  verbs.add(new Word ("past", RiTa.conjugate(v, past)));
  
  
  //need to add inf etc
  
  return verbs;
}
