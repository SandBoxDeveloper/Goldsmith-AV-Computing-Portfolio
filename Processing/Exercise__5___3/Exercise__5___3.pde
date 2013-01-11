float x = 0;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);
  
  // Display object
  fill(0);
  rect(x, 100, 20, 20);
  
  // Increment X
  x = x + 1;
  
  //without the i statment to stop the rect at x = 100
  x = constrain(x, 0, width);
  
  //with the if statement to stop rect at x = 100
 // if(x >= width) {
  //  x = width ;
 // }
  
}
