ArrayList<String> verbTenses(String v) {
  ArrayList<String> tenses = new ArrayList<String>();
  HashMap presP = new HashMap(); //present plural
  presP.put("tense", RiTa.PRESENT);
  presP.put("number", RiTa.PLURAL);
  presP.put("person", RiTa.THIRD);
  if (RiTa.conjugate(v, presP).equals(v)) {
    tenses.add("presP");
    addLines(presPLines);
  }

  HashMap presS = new HashMap();
  presS.put("tense", RiTa.PRESENT);
  presS.put("number", RiTa.SINGULAR);
  presS.put("person", RiTa.THIRD);
  if (RiTa.conjugate(v, presS).equals(v)) {
    tenses.add("presS");
    addLines(presSLines);
  }

  HashMap past = new HashMap();
  past.put("tense", RiTa.PAST);
  past.put("number", RiTa.SINGULAR);
  past.put("person", RiTa.THIRD);
  if (RiTa.conjugate(v, past).equals(v)) {
    tenses.add("past");
    addLines(pastLines);
  }
  
  HashMap ger = new HashMap();
  ger.put("form", RiTa.GERUND);
  if (RiTa.conjugate(v, ger).equals(v)) {
    tenses.add("ger");
    addLines(gerLines);
  }

  return tenses;
}
