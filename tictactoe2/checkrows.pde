String checkRow(int[] row) {
  //checks one row
  int product = 1;
  for (int i : row) {
    product*=i;
  }
  if (product == 16) {
    return "ORANGE";
  } else if (product == 81) {
    return "PURPLE";
  }
  return null;
}
