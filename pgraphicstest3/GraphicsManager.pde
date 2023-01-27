class GraphicsManager {

  PGraphics buffer;


  GraphicsManager() {
    buffer = createGraphics(width, height, P3D);
  }

  void run() {
    buffer.beginDraw();
    drawCubes(buffer);
    buffer.endDraw();

    cam.getState().apply(buffer);


    buffer.loadPixels();
    cam.beginHUD();
    image(buffer, 0, 0);
    cam.endHUD();
  }

  PVector getSelectedCube(int mousex, int mousey) {
    PVector cubeIndex= new PVector(-1, -1, -1);
    color c = buffer.pixels[mousey*width + mousex];
    //println(c);

    for (int r= 0; r<cubes.length; r++) {
      for (int b=0; b<cubes.length; b++) {
        for (int g = 0; g<cubes.length; g++) {
          if (c == color(255-r, 255-b, 255-g)) {
            cubeIndex.x = r;
            cubeIndex.y = b;
            cubeIndex.z = g;
          }
        }
      }
    }
    return cubeIndex;
  }
}
