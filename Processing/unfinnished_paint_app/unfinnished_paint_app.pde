ArrayList brushStroke;

final int CIRCLE_MODE = 1;
final int SQUARE_MODE = 2;

int brushState;

void setup() {
  size(500, 500);
  brushStokes = new ArrayList();
  brushState = CIRCLE_MODE;
}

void draw() {
  background(0);
  // 1
  if (mousePressed) {
    if (brushState == SQUARE_MODE){
    brushStrokes.add(new BrushStroke(mouseX, mouseY));
  }
  else {
    brushStrokes.add(new SquareSroke(mouseX, mouseY));
      }
    }
}
  //2
  for (int i=0, i < brushStrokes.size(); i++){
    BrushStoke b;
    b = (BrushStroke) brushStrokes.get(i);
    b.paint();
  }
  //3
   
  
  
  
}

void keyPressed() {
  if (keycode == 49 ){
    brush = CIRCLE_MODE;
  }
  
  if (keycode == 50){
    brushState = SQUARE_MODE;
  }
  
}
