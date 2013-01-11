class Bullet {
  float x;
  float y;
  float vy;
  float r;
  
  // contructor
  Bullet(float tempX, float tempY, float tempVY, float tempR) {
    x = tempX;
    y = tempY;
    vy = tempVY;
    r = tempR;
  }
    
    // functions
    void update () {
      frameRate(15);
      x+= -80;
      y+= vy;
      r+= 0;
      
      if (y < 0) {
        y = height + 100;
        vy = 0;
        r = 0;
      }
    }
    
    void display () {
      fill(40, 50, 255, 100);
      ellipse(x, y, r, r);
    }
  
}// wnd class
