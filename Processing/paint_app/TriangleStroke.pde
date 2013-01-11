class TriangleStroke extends BrushStroke {
  
  // this constructor
  // just calls the constructor
  // of the parent class. (super)
  TriangleStroke(float x, float y, color theColor){
    super(x, y, theColor);
  }
  
  // we don't want to paint like our parent, 
  // so we 'override' the paint method, with our own
  // painting code
  void paint(){ 
    rectMode(CENTER);  
    fill(paintColor);
   //fill(0, 0, 255);
    stroke(255);
    strokeWeight(1);
    triangle(x, y-15, x-15, y+15, x+15, y+15);
  }
}
