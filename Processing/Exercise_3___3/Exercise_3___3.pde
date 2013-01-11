void setup() {
  size(200, 200);
 
}

void draw() {
  background(255);
  
  //body
  stroke(0);
  fill(175);
  rectMode(CENTER);
  rect(mouseX, mouseY, 50, 50);
}

// why do you see a trail of rectangles
// if we move background() to setup(), leaving it out of draw().

// Answer
// Because the draw function repeatly draws the rectangle, when
// background if decalred within this draw funtion
// the color white is draw over and over again each time the
// rectangle is drawn, meaning the rectangle is drawn ontop of
// the changing background leaving no trial

// when moved to setup(), the background of white is only processed once
// there after the shape of color overrides the background and is drawn
// ontop of the white background
