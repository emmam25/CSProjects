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
    //try to do this with a loop
    s.vertex(vertices.get(0).getX(), vertices.get(0).getY(), 0,0);
    s.vertex(vertices.get(1).getX(), vertices.get(1).getY(), 1,0);
    s.vertex(vertices.get(2).getX(), vertices.get(2).getY(), 1,1);
    s.vertex(vertices.get(3).getX(), vertices.get(3).getY(), 0,1);
    s.endShape();
    
    shape(s, 0,0);
  }
  void addVertex(joe v){
    vertices.add(v);
  }
}
