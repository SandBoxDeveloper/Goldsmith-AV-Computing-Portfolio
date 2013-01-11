// This sketch demonstrates how the faster the user moves the mouse
// The thicker the weight of the line drawn becomes
// This is possible by calculating the between the mouse
// Current location and it previous location 
// pmouseX and mouseX using the formula mouseX - pmouseX
// Since a negative can occur we use abs value math function
void setup() {
  size(200, 200);
}

void draw() {
  //strokeWeight(10);
  //point(50, 50);
 
 
  stroke(0);
  strokeWeight(abs(mouseX-pmouseX)); 
  line(pmouseX, pmouseY, mouseX, mouseY);
}
