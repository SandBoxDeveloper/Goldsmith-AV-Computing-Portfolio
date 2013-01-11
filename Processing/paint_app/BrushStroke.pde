// basic Brush
// draws a circlular blob of red

class BrushStroke {
  // it remembers its x and y
  float x;
  float y;
  color paintColor; // stores the color
  
  // constructor accepts and stores x and y position
  BrushStroke(float x, float y, color theColor){
    this.x = x;
    this.y = y;
    this.paintColor = theColor;
  }// end brushStorke
   
   // paint sets up the painting mode (colour, weight etc.)
   // then draws a point
  void paint(){
    strokeWeight(10);
    stroke(paintColor);
    point(x, y);
  }// end void paint
  
  // this function can be called to decide if we should erase
   // the brushstroke or not
  boolean shouldErase(float eraserX, float eraserY){
   if (abs(x - eraserX) <= 10 && abs(y - eraserY) <= 10){
     // we are within a square 10 pixels around the erasor
     return true;
   }
   else {
     return false;
   }
  }

}
