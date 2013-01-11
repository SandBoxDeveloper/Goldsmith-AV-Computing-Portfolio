int globalX = 0;
int globalY = 100;
int speed = 1;

void setup () {
  size(200, 200);
  smooth();
}

void draw () {
  background(255);
  move();
  bounce();
  drawCar(globalX, globalY, 20, color(255, 0, 0));
}



void move () {
  // change the x location by speed
  globalX = globalX + speed;
}

void bounce() {
  if ((globalX > width) || (globalX < 0)) {
    speed = speed * -1;
  }
}


void drawCar(int x, int y, int thesize, color c) {
 
  int offset = thesize/4;   

  //draws main car body 
  rectMode(CENTER);
  stroke(200);
  fill(c); // replaced hard coded value with c to match function arguments
  rect(x, y, thesize, thesize/2);
  
  // draws four wheels relative to center
  fill(200);
  rect(x-offset, y-offset, offset, offset/2);
  rect(x+offset, y-offset, offset, offset/2);
  rect(x-offset, y+offset, offset, offset/2);
  rect(x+offset, y+offset, offset, offset/2);
}
