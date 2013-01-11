// Write code so that the circle grows in size as you move the mouse
int circleSize = 0;

int circleX = 100;

int circleY = 100;

void setup() {
  size(200, 200);
}

void draw() {
  
  background(0);
  stroke(255);
  fill(175);

  // Code to have the circle grow in size from the middle of the window

  //ellipse(circleX, circleY, circleSize, circleSize);

  //circleSize = circleSize + 1;

  // Code to have the circle grow as you move the mouse

  ellipse(mouseX, mouseY, circleSize, circleSize);

  circleSize = circleSize + 1;
  
}

