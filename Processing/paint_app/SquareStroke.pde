// this class is a child of BrushStroke
// so it has all the properties and behaviours of
// BrushStroke
class SquareStroke extends BrushStroke {
  
  // this constructor
  // just calls the constructor
  // of the parent class. (super)
  SquareStroke(float x, float y, color theColor){
    super(x, y, theColor);
  }
  
  // we don't want to paint like our parent, 
  // so we 'override' the paint method, with our own
  // painting code
  void paint(){   
    fill(paintColor);
    stroke(255);
    strokeWeight(1);
    rect(x, y, 20, 20);
  }
}
