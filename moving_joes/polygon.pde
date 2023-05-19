//holds one shape with any number of vertices (takes an arraylist of joes in the constructor)
//function that returns a pshape object
class polygon{
  PShape s;
  ArrayList<joe> vertices = new ArrayList<joe>();
  polygon(ArrayList<joe> verticesIn){
    vertices = verticesIn;
  }
 void showShape(PGraphics img){
    s = createShape();
    s.beginShape();
    s.texture(img);
    s.textureMode(NORMAL);
    s.stroke(0);
    for(int i = 0; i<vertices.size(); i++){
      float angle = map(i,0,vertices.size(), 0, 360);
      PVector unitcircle = new PVector (cos(radians(angle)), sin(radians(angle)));
      s.vertex(vertices.get(i).getX(), vertices.get(i).getY(), map(unitcircle.x, -1, 1, 0, 1), map (unitcircle.y, -1, 1, 0, 1));
    }
    s.endShape();
    
    shape(s, 0,0);
  }
  void addVertex(joe v){
    vertices.add(v);
  }
}
