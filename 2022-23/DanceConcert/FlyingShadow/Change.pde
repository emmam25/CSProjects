void Change(PImage x) {

  int[][] pixelArray = getPixelArray(x);

  int[][] newArray = Switch(pixelArray);


  setPixelArray(x, newArray);
}


int[][] Switch(int[][] pixelArray) {
  int[][] newArray = new int[pixelArray.length][pixelArray[0].length];

  int w = pixelArray[0].length; // length of row

  for (int i=0; i<pixelArray.length; i++)
    for (int j=0; j<w; j++)
    {
      newArray[i][j] = pixelArray[i][w-1-j] ;
    }

  return newArray;
}


int[][] getPixelArray(PImage img) {
  img.loadPixels();
  int[][] newArray = new int[img.height][img.width];

  if (img.width * img.height != img.pixels.length)
    println("[getPixelArray] Something's wrong!");

  for (int i=0; i<img.height; i++) {
    for (int j=0; j<img.width; j++)
    {
      newArray[i][j]= img.pixels[i*img.width + j];
    }
  }

  return newArray;
}


void setPixelArray(PImage img, int[][] newArray) {
  img.loadPixels();

  if (newArray.length* newArray[0].length != img.pixels.length)
    println("[setPixelArray] error");

  for (int i=0; i<img.height; i++)
    for (int j=0; j<img.width; j++)
    {
      img.pixels[i*img.width + j] = newArray[i][j];
    }

  img.updatePixels();
}
