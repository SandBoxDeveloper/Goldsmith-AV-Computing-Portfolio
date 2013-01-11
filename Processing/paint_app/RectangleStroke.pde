class RectangleStroke extends BrushStroke {
  
  // this constructor
  // just calls the constructor
  // of the parent class. (super)
  RectangleStroke(float x, float y, color theColor){
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
    rect(x, y, 50, 15);
  }
}// class
