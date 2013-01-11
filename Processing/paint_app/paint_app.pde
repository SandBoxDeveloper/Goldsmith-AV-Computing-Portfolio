// paint program/app
// Created by Andre Hitchman
// With special Thanks to Matthew Yee-King and Ariel
// For proving their source code for this application 
// That provided additional help 

// these are constants, i.e. they don't change
// final means it doesn't change
final int BRUSH_CIRCLE = 1;
final int BRUSH_SQUARE = 2;
final int BRUSH_TRIANGLE = 3;
final int BRUSH_RECTANGLE = 4;
final int BRUSH_ERASER = 5;

color c1;


// this variable will store the current brush mode
int brushMode;
// this data structure is called an ArrayList
// it is a growable array. 
// it will store all the brush strokes the user makes
ArrayList brushStrokes;
Panel panel;

void setup(){
  // set the initial brush mode
    brushMode = BRUSH_CIRCLE;
    // reset the image
    clearImage();
    size(500, 500);
    panel = new Panel(width, height);
    c1 = color(255, 255, 255);
}

void draw(){
  background(0);
  // if they pressed the mouse, add some new brush strokes 
  // to the brushStrokes arraylist
  if (mousePressed){
    // we check the current brush stroke mode
    // so we know what kind of brush stroke to add
    if (brushMode == BRUSH_CIRCLE){
      brushStrokes.add(new BrushStroke(mouseX, mouseY, color(c1) ));
    }
    if (brushMode == BRUSH_SQUARE){
      brushStrokes.add(new SquareStroke(mouseX, mouseY, color(c1) ));        
    }
    if (brushMode == BRUSH_TRIANGLE){
      brushStrokes.add(new TriangleStroke(mouseX, mouseY, color(c1) )); 
    }
    if (brushMode == BRUSH_RECTANGLE){
      brushStrokes.add(new RectangleStroke(mouseX, mouseY, color(c1) ));      
    }
    if (brushMode == BRUSH_ERASER){
      // scan through the brushSTrokes array list
      // and erase those that are close to the mouse
      // using the shouldErase function 
      // and the ArrayList.remove(index) function
      for (int i = 0; i < brushStrokes.size(); i++) {
        BrushStroke b = (BrushStroke) brushStrokes.get(i);
        if (b.shouldErase(mouseX, mouseY) == true) {
          brushStrokes.remove(i);
        }
      }
    }
  }
  // now we draw the current list of brush strokes
  // iterate through the arraylist
  for (int i = 0; i < brushStrokes.size(); i++){
    // this is the tricky bit...
    // * we create a local variable called b
    //   which has type BrushStroke
    // * we get the next item from the ArrayList (brushStrokes.get(i)
    // * the item comes as a raw Object, but we need a BrushStroke
    //   so we convert it (cast it) to a 
    //   BrushStroke Object ( BrushStroke b = -->(BrushStroke)<-- )
    // * we know it can be converted since all the different
   //    BrushSTroke types inherit (extend from) the BrushStroke class
    BrushStroke b = (BrushStroke) brushStrokes.get(i);
    // now we call the paint function on b
    // which will call the right function, depending on what type it actually is
    b.paint();
  }
  panel.currentBrush(brushMode, c1);
  panel.chooseBrushPanel(brushMode);
}

// this function gets called when a key is pressed
void keyPressed(){
  // print out the code for the key they pressed, for debugging
  println(keyCode);
  // 67 is c for clear
  if (keyCode == 67){
    clearImage();
  }
  // 49 is 1 for circle brush
  if (keyCode == 49){
    // change the current brush mode
    brushMode = BRUSH_CIRCLE;
  }
  // 50 is 2 for square brush
  if (keyCode == 50){
    // change the current brush mode
    brushMode = BRUSH_SQUARE;
  }
  // 51 is 3 for triangle mode
  if (keyCode == 51){
    // change the current brush mode
    brushMode = BRUSH_TRIANGLE;
  }
  // 52 is 4 for rectangle mode
  if (keyCode == 52){
    // change to current brush mode
    brushMode = BRUSH_RECTANGLE;
  }
  // 53 is 5 for eraser mode
  if (keyCode == 53){
    // change to the current brush mode   
    brushMode = BRUSH_ERASER;
  }
  
  
}

// reset the array list 
// to wipe the image
void clearImage(){
   brushStrokes = new ArrayList(1000);

}

