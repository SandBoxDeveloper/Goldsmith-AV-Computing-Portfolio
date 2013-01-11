float r = 150;
float g = 0;
float b = 0;


void setup() {
  size(200, 200);
}

void draw() {
  
  stroke(255);
  background(r, g, b);
  line(width/2, 0, width/2, height);
  
  if(mouseX > width/2) {
    r = r + 1;
  }
  
  else { r = r - 1; }
  
  if (mousePressed) {
    println("ouch that hurt!");
  }
  
  
  // Contraining variables
  // First way
  if( r > 255) {
    r = 255;
  }
  
  else if (r < 0) {
    r = 0;
  }
  
  
  
  // Second way
  r = constrain(r, 0, 255);
}

