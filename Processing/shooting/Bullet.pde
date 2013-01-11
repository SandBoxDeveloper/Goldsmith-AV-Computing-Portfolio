class Bullet {
  
  float objX;
  float objY;
  float bullet;
  float bulletSpeed;
  boolean visiable;
  
  Bullet(float objX, float objY) {
  
  objX = this.objX;
  objY = this.objY;
  visiable = true;
  bulletSpeed = 5;
  }
  
  void move () {
    objY -=bulletSpeed;
  }
  
  void display () {
    noStroke();
    fill(255, 0, 0);
    
    PVector startPosition = new PVector(objX, objY);
    ellipse(startPosition.x, startPosition.y, 4, 4);
  }
  
}
