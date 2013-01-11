// Example 5 - 3 mutiple rollovers

// Woohoo!
// The task for this exercise was to code a sketch
// That when the mouse rollovers an quadrant in the window
// It would turn black
// I successfully done it without looking in the book for the soultion!

void setup() {
  size(200, 200);
}

void draw() {
  
  background(255);
  stroke(0);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  
  if(mouseX > width/2 && mouseY < height/2) {
    fill(0);
    rect(width/2, 0, width/2, height/2);
  }
  
  else if(mouseX < width/2 && mouseY < height/2) {
    fill(0);
    rect(0, 0, width/2, height/2);
  }
  
  else if(mouseX < width/2 && mouseY < height) {
    fill(0);
    rect(0, height/2, width/2, height/2);
  }
  
  else if(mouseX > width/2 && mouseY > height/2) {
    fill(0);
    rect(width/2, height/2, width/2, height/2);
  }
  
  
}
