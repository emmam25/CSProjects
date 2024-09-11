float size; //size of one square
int nSmall; // number of small squares in a big square
float circleSize = 10;
void setup() {
  size(800,800);
  size = 10;
  nSmall = 10;
}
void draw() {
  for (int i = 0; i<width; i+=size) {
    if (i/size % nSmall == 0) {
      strokeWeight(3);
    } else {
      strokeWeight(1);
    }
    line(i, 0, i, height);
    strokeWeight(1);
  }
  for (int j = 0; j<height; j+=size) {
    if (j/size % nSmall == 0) {
      strokeWeight(3);
    } else {
      strokeWeight(1);
    }
    line(0, j, width, j);
  }
  //circles
  fill(0);
  strokeWeight(1);
  for (int i = 0; i<width; i+=size*nSmall) {
    for (int j = 0; j<height; j+=size*nSmall) {
      circle(i,j,circleSize);
    }
  }
}
