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
  // enemy images
  PImage ghost, robot; 

  /*contructors*/
  // addtional constructor that doesn't require any parameters
  Enemy() {
    enemyLocation = processEnemySpawn(); // generate where enemy will be positioned on the screen
    target = getMainCharacter();
    enemySpeed = 1; // hard coded
    enemyMaxiumHelath = 3; // enemy health. set to change difficulty of game
    enemyCurrentHealth = enemyMaxiumHelath;
    enemyDamage = 1; // this is how much damage the enemy has on the player, set to change difficulty of game
    enemySize = 20; // set to change how big the enemy is (width and height)
    colorNormally = color(125, 75, 100);
    colorWhenEnemyHit = color(255, 0, 0);
    colorOfEnemyCurrently = colorNormally;
    hitTimer = new Timer(25);
  }


  /*methods*/
  // method for spawning enemy in from a random position in space(screen)
  PVector processEnemySpawn () {
    int position;
    int spawnEnemyRandomXposition = 0;
    int spawnEnemyRandomYposition = 0;
    PVector enemySpawnCoordinates;

    // i noticed you cant use strings in switch statements
    // so i replaced with an singler string
    position = int(random(5)); // random number between 0 to 5
    switch(position) { // switch to statement from 0 to 5
      case(0):
      spawnEnemyRandomXposition = 0;
        spawnEnemyRandomYposition = int(noise(height));
        break;
      case(1):
      spawnEnemyRandomXposition = int(noise(width));
        spawnEnemyRandomYposition = height;
        break;
      case(2):
      spawnEnemyRandomXposition = width;
        spawnEnemyRandomYposition = int(noise(height));
        break;
      case(3):
      spawnEnemyRandomXposition = int(noise(height));
        spawnEnemyRandomYposition = 0;
        break;
      case(4):
      spawnEnemyRandomXposition = width/4;
        spawnEnemyRandomYposition = int(noise(height));
        break;
    }
    // need a return type to end the statement, since void has not been used
    return new PVector(spawnEnemyRandomXposition, spawnEnemyRandomYposition);
  }
  
  // method for enemy movement
  void enemyMovement () {
    // enemy moving towards the player(superHero)
    enemyTrajectory = PVector.sub(target.characterLocation, enemyLocation);
    enemyTrajectory.normalize();
    enemyTrajectory.mult(enemySpeed);
    enemyLocation.add(enemyTrajectory); 
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
  }

  void bomb () {
     for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).update();
    //enemies.remove(i);// or
    killEnemy();
  }
    
  }// bomb
  // method to kill enemy when killed by player
  void killEnemy () {
    enemies.remove(this); // remove enemy from ArrayList refereing to this sketch
  }

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
  }

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
  }

  // method to change color of enemy
  void enemyColorChange () {
    if (colorOfEnemyCurrently == colorWhenEnemyHit && hitTimer.timerIsFinished()) {
      colorOfEnemyCurrently = colorNormally;
    }
  }

  // method to udate enemy state
  void update () {
    enemyMovement();
    enemyHasHitSomething();
    enemyColorChange();
  }

  // method to display enemy
  void displayEnemy () {
    pushMatrix();
    ellipseMode(CENTER);
    fill(colorCurrently);
    ellipse(enemyLocation.x, enemyLocation.y, enemySize, enemySize);
    popMatrix();
  }

  void displayEnemyGhost () {
    ghost = loadImage("ghost.gif");
    image(ghost, PcharacterPositionX, PcharacterPositionY, PcharacterSize, PcharacterSize);
  }
}// end Enemies class

