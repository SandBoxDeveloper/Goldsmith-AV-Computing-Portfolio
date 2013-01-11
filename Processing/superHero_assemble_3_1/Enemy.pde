class Enemy extends Pcharacter {
  /*instance variables*/

  // enemy location(position) on screen
  PVector enemyLocation;
  // path enemy object travel through space
  PVector enemyTrajectory;
  // new character
  Pcharacter target;
  // enemy speed
  float enemySpeed;
  // enemy accerleration
  float enemyAccerleration;
  // enemy maxium health
  int enemyMaxiumHelath;
  // enemy current health( keeps track of health when dieing)
  int enemyCurrentHealth;
  // enemy damage taken
  int enemyDamage;
  // enemy size
  int enemySize;
  // new timer
  Timer hitTimer;
  // enemy color states
  color colorNormally;
  color colorWhenEnemyHit;
  color colorOfEnemyCurrently;
  // Enemy Random position
  float enemyRandomPosition;
  // enemy State alive or dead 
  int enemyState;


  /*contructors*/
  // addtional constructor that doesn't require any parameters
  Enemy() {
    enemyLocation = processEnemySpawn(); // generate where enemy will be positioned on the screen
    target = getMainCharacter();
    enemySpeed = 1; // hard coded
    enemyMaxiumHelath = 3; // enemy health. set to change difficulty of game
    enemyCurrentHealth = enemyMaxiumHelath;
    enemyDamage = 2; // this is how much damage the enemy has on the player, set to change difficulty of game
    enemySize = 20; // set to change how big the enemy is (width and height)
    colorNormally = color(125, 75, 100);
    colorWhenEnemyHit = color(255, 0, 0); // red
    colorOfEnemyCurrently = colorNormally;
    hitTimer = new Timer(25);
  }


  /*methods*/
  void displayImage(String filename, float x, float y) {
    PImage img = loadImage(filename);
    image(img, x, y);
  }
  // method for spawning enemy in from a random position in space(screen)
  PVector processEnemySpawn () {
    int position;
    int spawnEnemyRandomXposition = 0;
    int spawnEnemyRandomYposition = 0;
    PVector enemySpawnCoordinates;


    position = int(random(5)); // random number between 0 to 5
    switch(position) { // switch to statement from 0 to 5
      case(1):
      spawnEnemyRandomXposition = 0;
      spawnEnemyRandomYposition = int(noise(height));
      break;
      case(2):
      spawnEnemyRandomXposition = int(noise(width));
      spawnEnemyRandomYposition = height;
      break;
      case(3):
      spawnEnemyRandomXposition = width;
      spawnEnemyRandomYposition = int(noise(height));
      break;
      case(4):
      spawnEnemyRandomXposition = int(noise(height));
      spawnEnemyRandomYposition = 0;
      break;
      case(5):
      spawnEnemyRandomXposition = width/4;
      spawnEnemyRandomYposition = int(noise(height));
      break;
    }
    // need a return type to end the statement, since void has not been used
    return new PVector(spawnEnemyRandomXposition, spawnEnemyRandomYposition);
  }// spawn position


    void enemyMovement () {
    // enemy moving towards the player(superHero)
    enemyTrajectory = PVector.sub(target.characterLocation, enemyLocation);
    enemyTrajectory.normalize();
    enemyTrajectory.mult(enemySpeed);
    enemyLocation.add(enemyTrajectory);
  }// move

  void EnemyColorChange () {
    if (colorOfEnemyCurrently == colorWhenEnemyHit && hitTimer.timerIsFinished()) {
      colorOfEnemyCurrently = colorNormally;
    }
  }

  // playing around with enemy variables
  void voodoo () {
    this.enemySpeed = random(0.4, 1);
    enemyTrajectory.set(random(-50, 50), random(-50, 50), 0);
    enemyTrajectory.normalize();
    enemyTrajectory.mult(enemySpeed);
  }

  // method to attract enemy to player(superhero)
  Pcharacter getMainCharacter () {
    int targetId = int(random(theCharacters.size())); // random choose any character within the theCharacters ArrayList
     return theCharacters.get(targetId);
  }// chase

  // method to kill enemy when killed by player
  void killEnemy () {
    enemies.remove(this); // remove enemy from ArrayList refereing to this sketch
  }// killed

  // method to reduce health from enemy
  void enemyDamaged (Bullet penertrates) { // passing local variable of class type bullet so i can call it methods,
    enemyCurrentHealth -= penertrates.damageDone; // minus hardcoded enemyDamge value from the current health of the enemy
    // if the current health of the enemy reachs or equals to 0
    if (enemyCurrentHealth <= 0) {
      //kill the enemy by removing it from the enemies ArrayList
      killEnemy();
      // then update the score of the player by +1
      penertrates.shootToKill.score++;
    }
    // otherwise
    else {
      // turn the current color of the enemy to another signed color value(enemyWhenHit)
      // this acts as a visuall indication to the user that they have hit the enemy
      colorOfEnemyCurrently = colorWhenEnemyHit;
      // then start the timer
      hitTimer.startTimerEvent();
    }
  }// damaged

  // method to detect if enemy has hit player
  void enemyHasHitSomething () {
    for (int i = 0; i < theCharacters.size(); i++) { // look through ArrayList and grab enemy
      Pcharacter attackUser = theCharacters.get(i);
      // if the enemy is alive
      if (attackUser.alive == true) {
        float distanceBetween = dist(enemyLocation.x, enemyLocation.y, attackUser.characterLocation.x, attackUser.characterLocation.y); // calculate the distance between the enemy location where spawned and its location now
        // if there is a collison
        if (distanceBetween < 10) { // or use this (PcharacterSize)/3
          // the enemy get damaged and loses health
          attackUser. characterDamaged(this);
          // if health reaches 0
          // kill the enemy by removing it from the ArrayList
          killEnemy();
          // break needed to end nested if statements
          break;
        }
      }
    }
  }// hit


  // method to udate enemy state
  void update () {
    enemyMovement();
    enemyHasHitSomething();
    EnemyColorChange();
  }// update

    // method to display enemy
  void displayEnemy () {
    displayImage("64_ghost.gif", enemyLocation.x, enemyLocation.y);

    pushMatrix();
    ellipseMode(CENTER);
    fill(colorOfEnemyCurrently);
    ellipse(enemyLocation.x, enemyLocation.y, enemySize, enemySize);
    popMatrix();
  }// display
}// end Enemies class

//============
// NEXT LEVEL ENEMY
//============
class NewEnemy extends Enemy {
  NewEnemy() {
    enemyLocation = processEnemySpawn();
    enemySpeed = 1.4;
    enemyMaxiumHelath = 5;
    enemyCurrentHealth = enemyMaxiumHelath;
    enemyDamage = 4;
    enemySize = 50;
    colorNormally = color(0, 255, 0);// green
    colorWhenEnemyHit = color(255, 0, 0);
    colorOfEnemyCurrently = colorNormally;
  }
}// new enemy

