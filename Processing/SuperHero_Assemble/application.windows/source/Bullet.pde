class Bullet {
  /*instance variables*/
  
  // new player 
  Pcharacter shootToKill;
  // path moving bullet object travels through space
  PVector bulletTrajectory;
  // bullets current location
  PVector bulletLocation;
  // speed of bullet
  float speed;
  // damage done by bullet
  int damageDone;
  // the curcumference of the bullet
  int bulletCurcumference;
  
  
  
  /*constructors*/
  Bullet(Pcharacter tempShootToKill) {
    shootToKill = tempShootToKill; // temporary parameter  = instance variable shootToKill
    bulletLocation = shootToKill.characterLocation.get(); // gets a copy of the location vector
    speed = 15.0; // set speed
    damageDone = 1; // set the damge the bullet will make to objects
    
    bulletTrajectory = PVector.sub(shootToKill.mouseCurrentLocation, bulletLocation); // subtract player's location from bullet location
    bulletTrajectory.normalize(); // normalize bullet Trajectory to length 1
    bulletTrajectory.mult(speed); // multiple bullet Trajectory with speed to allows change of speed for bullet
    bulletCurcumference = 15; // set bullet curcumference(circle width)
  }
  
  /*methods*/ 
  // method for how bullet travels through space
  void bulletMovement () {
    // add where abouts the bullet is to the location of it, this simulates bullet movement
    bulletLocation.add(bulletTrajectory);
  }
  
  // method to display bullet
  void displayBullet () {
    fill(129); // colour of bullet
    ellipse(bulletLocation.x, bulletLocation.y, bulletCurcumference, bulletCurcumference); // bullet
  }
  
  // method to remove bullets from array list
  void deleteBullets () {
    // remove bullet from array
    bullets.remove(this);
  }
  
  // method to check if bullet is still displayed on the screen, if it is then no longer alive
  void isBulletStillAlive () {
    // is the bullet beyond the borders of the screen
    if(bulletLocation.x > width || bulletLocation.x < 0 || bulletLocation.y > height || bulletLocation.y < (height-height)) {
    // if the bullet is no longer on the screen, delete the bullet using the appropriate method
      deleteBullets(); 
    }
  }
  
  // method to to update what the bullet state (what is going on with the bullet)
  void updateBullet () {
    // call bullet movement
    bulletMovement();
    // call to see if bullet is still alive
    isBulletStillAlive();
    // call to see if bullet has hit an object(enemy) ?
  }
  
  
}
