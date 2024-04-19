class Poem {
  String value = "";
  boolean adding = false;
  String poem = "";
  int index =0;
  Poem() {
  }
  String makePoem() {
    if (adding == true) {
      poem = poem + value.substring(index, index+1);
    }
    if(poem.equals(value)){
      adding = false;
    }
    index ++;
    return poem;
  }
  void setValue(String v) {
    value = v;
  }
  void startAdd() {
    adding = true;
    poem = "";
    index =0;
  }
}
