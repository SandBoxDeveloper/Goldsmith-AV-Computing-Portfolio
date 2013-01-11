class SnowBall {
  // the class variables
  // for SnowBall
  float xPos;
  float yPos;
  float dX;
  float size;
  
  SnowBall(float x, float y, float size) {
   
  }// end SnowBall
  
  
  // basic drawing setup of snowall
  void draw() {
    fill(255); //white snowball colour
    ellipse(xPos, yPos, size, size);
  }// end draw
  
  
  // simulation effects/conditions for snow falling
  void physics() {
    if (xPos >= 500) {
      xPos = 500
    }// This is when the snow falls to ground level, it stays on the ground
    // eventually it will build up and tower of balls
    if (yPos >=500) {
      yPos = 500
    }
  }// end physics
}// end ball class
