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
  // color of bullet
  color colorNormally;
  color colorCurrently;
  
  
  
  /*constructors*/
  Bullet(Pcharacter tempShootToKill) {
    shootToKill = tempShootToKill; // temporary parameter  = instance variable shootToKill
    bulletLocation = shootToKill.characterLocation.get(); // gets a copy of the location vector
    speed = 15.0; // set speed
    damageDone = 1; // set the damge the bullet will make to objects
    bulletCurcumference = 9; // set bullet curcumference(circle width)
    bulletTrajectory = PVector.add(shootToKill.mouseCurrentLocation, bulletLocation); // subtract player's location from bullet location
    bulletTrajectory.normalize(); // normalize bullet Trajectory to length 1
    bulletTrajectory.mult(speed); // multiple bullet Trajectory with speed to allows change of speed for bullet
    colorNormally = color(25, 75, 200);
    colorCurrently = colorNormally;
   
  }
  
  /*methods*/ 
  // method for how bullet travels through space
  void bulletMovement () {
    // add where abouts the bullet is to the location of it, this simulates bullet movement
    bulletLocation.add(bulletTrajectory);
  }
  
  // method to check if bullet is still displayed on the screen, if it is then no longer alive
  void isBulletStillAlive () {
    // is the bullet beyond the borders of the screen
    if(bulletLocation.x > width || bulletLocation.x < 0 || bulletLocation.y > height || bulletLocation.y < (height-height)) {
    // if the bullet is no longer on the screen, delete the bullet using the appropriate method
      deleteBullets(); 
    }
  }
  
  // method to remove bullets from array list
  void deleteBullets () {
    // remove bullet from array
    bullets.remove(this);
  }
  
  // method to determine enemy hit with bullet?
  void hitEnemy () {
    for(int i = 0; i < enemies.size(); i++) {
      Enemy hurt = enemies.get(i);
      float distanceBetween = dist(bulletLocation.x, bulletLocation.y, hurt.characterLocation.x, hurt.characterLocation.y);
      
      if(distanceBetween < ( bulletCurcumference/2) + hurt.PcharacterSize/2) {
        hurt.enemyDamaged(this);
        deleteBullets();
        break;
      }
    }
  }
  // method to to update what the bullet state (what is going on with the bullet)
  void updateBullet () {
    // call bullet movement
    bulletMovement();
    // call to see if bullet is still alive
    isBulletStillAlive();
    // call to see if bullet has hit an object(enemy) ?
    hitEnemy();
  }
  
  // method to display bullet
  void displayBullet () {

    pushMatrix();
    ellipseMode(CENTER);
    fill(colorCurrently);
    ellipse(bulletLocation.x + bulletLocation.y, bulletLocation.y, bulletCurcumference, bulletCurcumference);
    noFill();
    popMatrix();
    //println("bang!");
  }
  
}
  
