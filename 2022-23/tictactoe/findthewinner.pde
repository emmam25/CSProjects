String winner() {
  //there are 76 ways to win (I think)
  String result;

  //check the flat rows (only changing along one axis, other two are constant)
  for (int one = 0; one<4; one++) {
    for (int two =0; two<4; two++) {

      result = checkRow(new int[]{cubes[one][two][0], cubes [one][two][1], cubes [one][two][2], cubes [one][two][3]});
      if (result !=null) {
        return result;
      }

      result = checkRow(new int[]{cubes[0][one][two], cubes[1][one][two], cubes[2][one][two], cubes[3][one][two]});
      if (result != null) {
        return result;
      }

      result = checkRow(new int[]{cubes[one][0][two], cubes[one][1][two], cubes[one][2][two], cubes[one][3][two]});
      if (result != null) {
        return result;
      }
    }
  }

  //check the 2 dimensional diagonals (y=x, y=-x, y=z, y=-z, x=z, x=-z)
  for (int one = 0; one<4; one++) {
    result = checkRow(new int[]{cubes[one][0][0], cubes[one][1][1], cubes[one][2][2], cubes[one][3][3]});
    if (result !=null) {
      return result;
    }

    result = checkRow(new int[]{cubes[one][0][3], cubes[one][1][2], cubes[one][2][1], cubes[one][3][0]});
    if (result !=null) {
      return result;
    }


    result = checkRow(new int[]{cubes[0][one][0], cubes[1][one][1], cubes[2][one][2], cubes[3][one][3]});
    if (result !=null) {
      return result;
    }
    result = checkRow(new int[]{cubes[0][one][3], cubes[1][one][2], cubes[2][one][1], cubes[3][one][0]});
    if (result !=null) {
      return result;
    }

    result = checkRow(new int[]{cubes[0][0][one], cubes[1][1][one], cubes[2][2][one], cubes[3][3][one]});
    if (result !=null) {
      return result;
    }
    result = checkRow(new int[]{cubes[0][3][one], cubes[1][2][one], cubes[2][1][one], cubes[3][0][one]});
    if (result !=null) {
      return result;
    }
  }

  //check three dimensional diagonals (x=y=z, -x=y=z, x=-y=z, x=y=-z)
  result = checkRow(new int[]{cubes[0][0][0], cubes [1][1][1], cubes[2][2][2], cubes[3][3][3]});
  if (result !=null) {
    return result;
  }
  result = checkRow(new int[]{cubes[3][0][0], cubes [2][1][1], cubes[1][2][2], cubes[0][3][3]});
  if (result !=null) {
    return result;
  }
  result = checkRow(new int[]{cubes[0][3][0], cubes [1][2][1], cubes[2][1][2], cubes[3][0][3]});
  if (result !=null) {
    return result;
  }
  result = checkRow(new int[]{cubes[0][0][3], cubes [1][1][2], cubes[2][2][1], cubes[3][3][0]});
  if (result !=null) {
    return result;
  }

  return null;
}
