class Car {
  
  // Variables
  color c;
  float xpos;
  float ypos;
  float xspeed;
  int thesize;
  

  // Contructor
  Car(color tempC, float tempXpos, float tempYpos, float tempXspeed, int tempThesize) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    thesize = tempThesize;
  }
  

  // Methods/Functions
  void displayCar() {
    int offset = thesize/4;
   
    // draw body of car
  rectMode(CENTER);
  stroke(200);
  fill(c); 
  rect(xpos, ypos, thesize, thesize/2); 
  
  // drar wheels of car
    fill(0);
  rect(xpos-offset, ypos-offset, offset, offset/2);
  rect(xpos+offset, ypos-offset, offset, offset/2);
  rect(xpos-offset, ypos+offset, offset, offset/2);
  rect(xpos+offset, ypos+offset, offset, offset/2);

  }
  
  void drive() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
  

  
}// end class

