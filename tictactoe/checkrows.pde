//checks one row of 4 cubes to see if its four in a row
String checkRow(int[] row) {
  int product = 1;
  for (int i : row) {
    product*=i;
  }
  if (product == 16) {
    return "FIRST";
  } else if (product == 81) {
    return "SECOND";
  }
  return null;
}
