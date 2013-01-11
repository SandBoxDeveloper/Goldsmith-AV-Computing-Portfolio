void setup() {

  size(500, 500);
}


void draw() { //start drawing

  background(255, 255, 255); //clear the screen before we draw the new frame

  noFill(); // don't fill in the any shape that we done, just draw the outline

  stroke(0, 255, 0); //set the colour to green

  translate(width*0.5, height*0.5);
  //move everything that we draw after this
  //point to the centre of the screen

  rotate(mouseX*0.5);//rotate everything by using the current mouse position

  ellipse(0-40, 0, 40, 40); //draw your rotorelief
  ellipse(0-35, 0, 80, 80);
  ellipse(0-30, 0, 120, 120);
  ellipse(0-25, 0, 160, 160);
  ellipse(0-20, 0, 200, 200);
  ellipse(0-15, 0, 240, 240);
  ellipse(0-10, 0, 280, 280);
  ellipse(0-5, 0, 320, 320);
  ellipse(0, 0, 360, 360);
}

