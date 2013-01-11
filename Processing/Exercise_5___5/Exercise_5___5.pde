int x = 50;
int y = 50;
int w = 100;
int h = 75;

void setup() {
  size(200, 200);
}

void draw() {
  background(0);
  stroke(255);
  rect(x, y, w, h);
  
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y + h ) {
    fill(0);
  }
  
  else {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
  
}
