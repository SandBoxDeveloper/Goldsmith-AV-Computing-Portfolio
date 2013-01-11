class Rectangle {
  //public
  int x;
  int y;
  int rectSize;
  color c;

  Rectangle(int x, int y, int rectSize)
  {
    this.x = x;
    this.y = y;
    this.rectSize = rectSize;
    c = color(255);
  }



void draw() {
  fill(c);
  rect(x, y, rectSize, rectSize); 
  
}

}
