// Array list of obejcts
ArrayList<Enemy> enemies;
ArrayList<Bonus> bonuses;
ArrayList<Pcharacter> theCharacters;
ArrayList<Bullet> bullets;
Pcharacter player;
Timer t;
// spawn variables
float enemySpawnInterval;
float enemySpawnSpeed;
float enemySpawnModify;
// bonus variables
float bonusDropInterval;
float bonusDropRate;
float bonusDropModifier;

int score;
// character directions that cant be changed
final static int NORTH = 1;
final static int SOUTH = 4;
final static int EAST = 2;
final static int WEST = 8;
// Instances
boolean menuOn = false;
boolean gameInstructions = false;
boolean level1 = true;
boolean level2 = false;
boolean level3 = false;
boolean youWon = false;
boolean gamePaused = false;
boolean gameOver = false;

PImage backdrop;



void setup () {
  size(800, 480);
  smooth();
  frameRate(60);
  backdrop = loadImage("paper_background.gif");
  backdrop.resize(800, 480);
  cursor(HAND);
  initialize();
  
}

void draw () {
  background(backdrop);
  //------------------------
  // MENU SET TO ON
  //------------------------
  if (menuOn == true) {
    background(0);
    fill(206, 165, 110);
    textSize(85);
    text("SUPERHERO", width/2 - 220, 240);
    textSize(60);
    text("ASSEMBLE", width/2 - 135, 300); 
    fill(101, 112, 232);
    textSize(20);
    text("-----CLICK TO START-----", 270, 330);
  }
  //------------------------
  // GAME INSTRUCTIONS
  //------------------------
  if (gameInstructions == true) {
    background(0, 0, 200);
    fill(206, 165, 110);
    textSize(20);
    text("Move mouse to move superhero & control shooting", 150, 240);
    textSize(20);
    text("Press P or SPACEBAR to pause game", 230, 300); 
    fill(101, 112, 232);
    textSize(20);
    text("Collect bonuses to help you during the game", 180, 330);
  }

  if (level1 == true) {
    gameUpdate();
    gameDraw();
    //println("level1");
  }
  
  


  GUI();
  player.scoreUpdate(score);
  player.displayCharacter();
  player.DisplayCharacterHealth();
  //println(+keyCode);
}

// press to shoot
void mousePressed () {
  player.blasterIncrease.shooting = true;
}

void mouseDragged () {
  player.mouseCurrentLocation.x = mouseX;
  player.mouseCurrentLocation.y = mouseY;
}
//----------
// AUTOMATIC
//-----------
void mouseReleased () {
  if (player.blasterIncrease.blasterLevel == 2) {
    player.blasterIncrease.shooting = true;
  }
}

void mouseMoved () {
  player.mouseCurrentLocation.x = mouseX;
  player.mouseCurrentLocation.y = mouseY;
//  player.characterLocation.x = mouseX;
//  player.characterLocation.y = mouseY;
  //player.blasterIncrease.shooting = true;
}

void keyPressed () {
  switch(keyCode) {
    case(UP):
    player.PcharacterDirection =NORTH;
    break;
    case(RIGHT):
    player.PcharacterDirection =EAST;
    break;
    case(DOWN):
    player.PcharacterDirection =SOUTH;
    break;
    case(LEFT):
    player.PcharacterDirection =WEST;
    break;
//    case 38:
//    player.PcharacterDirection |=NORTH;
//    break;
//    case 40:
//    player.PcharacterDirection |=SOUTH;
//    break;
//    case 37:
//    player.PcharacterDirection |=WEST;
//    break;
//    case 39:
//    player.PcharacterDirection |=EAST;
//    break;
  }
}

void keyReleased() {
  // For player direction.
  switch(keyCode) {
    case(UP):
    player.PcharacterDirection ^=NORTH;
    break;
    case(RIGHT):
    player.PcharacterDirection ^=EAST;
    break;
    case(DOWN):
    player.PcharacterDirection ^=SOUTH;
    break;
    case(LEFT):
    player.PcharacterDirection ^=WEST;
    break;
  }
}

class Blaster {
  /*instance variables*/
  Pcharacter shootToKill;
  // are you shoting or not ?
  boolean shooting;
  // what level is the blaster ?
  int blasterLevel; // level = 1 is normal mode, level 2 = increase bullet damage and speed
  //byte blasterLevel; // a more convient way to store number values, this stores between -127 and 128
  
  
  /*constructors*/
  Blaster(Pcharacter tempShootToKill) {
    shootToKill = tempShootToKill; 
    shooting = false; // set shooting to false, (current not shooting)
    blasterLevel = 1; // set blaster level to normal mode
  }
  
  /*methods*/
  // method to start blasting(shooting) objects
  void blastIt () {
    // if player is alive
    if(shootToKill.alive) {
      // if the player is shooting
      if(shooting) {
        // add a new bullet to the bullet array list
        bullets.add(new Bullet(shootToKill));
        // then set shooting back to false
        shooting = false;
      }
    }
  }
  
  // method to update the state of shooting
  void updateShooting () {
    // call the blastIt method to shoot again
    blastIt();
  }
  
}// end blaster class

//====================
// BLASTER CLASSES effected by Bonuses
//=====================

// actuall blaster(gun)
class NormalBlaster extends Blaster {
  NormalBlaster(Pcharacter tempShootToKill) {
    super(tempShootToKill);
  }
}


//===================================//
// AUTOMATIC GUN ACTIVATED WITH BONUS//
//===================================//
class SemiAutoMatic extends Blaster{
  /*instance variables*/
  // based on the timer class which includes millsecond, this will allow the ability to increase the rate in which you can shoot a bullet
  Timer blasterFireRate;
  // set the cap on how many shots the blaster can take in this current upgraded mode
  int blasterCap;
  // this is needed to keep track of cap, e.g to see how much of the blastercap the player has used already
  int blasterCurrentCap;
  
  /*constructors*/
  SemiAutoMatic (Pcharacter tempShootToKill) {
    super(tempShootToKill); // call the parameter from the Blaster class
    blasterLevel = 2; // set blaster to level 2(increase shooting rate and damage);
    blasterFireRate = new Timer(10000); // this blaster rate will last for 10000 milliseconds(10.0 seconds)
    blasterCap = 80; // set blaster cap
    blasterCurrentCap = blasterCap; // current cap = set blaster cap
  }
  /*methods*/
  // method to start blasting(shooting) objects
  void blastIt () {
    // if character is alive
    if(shootToKill.alive) {
      // and if shooting and blaster upgrade timer rate is over and current blaster cap is greater than 0
      if(shooting && blasterFireRate.timerIsFinished() && blasterCurrentCap > 0) {
        // add a new bullet to array list
        bullets.add(new Bullet(shootToKill));
        // decrease by -1 the current blaster cap. e.g each time you are shooting during the upgrade timer event decrease the blasterCap by -1
        blasterCurrentCap--;
        
        if(blasterCurrentCap > 0) {
          blasterFireRate.startTimerEvent();  
        }
        else {
          shootToKill.blasterIncrease = new NormalBlaster(shootToKill);
        }
      }
    }
  }
  

  
  
}// end BlasterUpgrade class
class Bonus {
  
  int bonusSize;
  // bonuses images
  PImage heart, sheild, timer, star, bomb;
  // type of bonus
  int type;
  PVector bonusRandomPosition;
  color bonuesColor;
  
  Bonus(int i) {
    bonusRandomPosition = new PVector(int(random(width)), (int)(random(height)));
    type = i;

    switch(i) {
      // heart
      case(1):
      //attackUser.healSuperhero(10);
      break;
      // bomb
      case(2):
       //attackUser.removeAllEnemies();
      break;
      // star
      case(3):
       //attackUser.startEffect();
      break;
      // timer
      case(4):
      //attackUser.slowEnemyTimer();
      break;
      // shield
      case(5):
    }
  }


void displayImage(String filename, float x, float y) {
      PImage img = loadImage(filename);
      image(img,x,y);
}


  void applyBonusEffect (Pcharacter attackUser) {
    switch(type) {
      case(1):
      // give superhero increased health
      attackUser.healSuperhero(10);
      break;
      case(2):
      // kill all enemies
      break;
      case(3):
      // give superhero max health and increased shooting for a while
      attackUser.healSuperhero(10);
      break;
      case(4):
      // give superhero increased shooting power
      attackUser.blasterIncrease = new SemiAutoMatic(attackUser);
      break;
      case(5):
      // give superhero max health for a while
      attackUser.healSuperhero(15);
      break;
    }
  }// apple bonus
  
  // method that determines if the bonues item has been picked up
  void pickedUp () {
    for (int i = 0; i < theCharacters.size(); i++) {
      Pcharacter attackUser = theCharacters.get(i);
      float distanceBetween = dist(bonusRandomPosition.x, bonusRandomPosition.y, attackUser.characterLocation.x, attackUser.characterLocation.y);

      if (distanceBetween < (bonusSize/2) + attackUser.PcharacterSize/2) {
        applyBonusEffect(attackUser);
        removeBonus();
        break;
      }
    }
  }// picked up
  
void removeBonus () {
  bonuses.remove(this);
}// remove bonus from screen

void updateBonus () {
  pickedUp();  
}// update bonus

// method to display bonuses
  void display () {
    switch(type) {
      // heart
      case(1):
      displayImage("64_heart.gif", bonusRandomPosition.x, bonusRandomPosition.y);
      break;
      // bomb
      case(2):
      displayImage("64_bomb.gif", bonusRandomPosition.x, bonusRandomPosition.y);
      break;
      // star
      case(3):
      displayImage("64_star.gif", bonusRandomPosition.x, bonusRandomPosition.y);
      break;
      // timer
      case(4):
      displayImage("64_timer.gif", bonusRandomPosition.x, bonusRandomPosition.y);
      break;
      // shield
      case(5):
      displayImage("64_shield.gif", bonusRandomPosition.x, bonusRandomPosition.y);
      break;
    }
  }// display

}
class BossEnemy extends Enemy {
  BossEnemy() {

    enemyLocation = processEnemySpawn();
    enemySpeed = 2.0;
    enemyMaxiumHelath = 60;
    enemyCurrentHealth = enemyMaxiumHelath;
    enemyDamage = 7;
    enemySize = 50;
    colorNormally = color(0, 0, 255);
    colorWhenEnemyHit = color(255, 0, 0);
    colorOfEnemyCurrently = colorNormally;
  }
  
}// boss enemy

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
    if(bulletLocation.x > width || bulletLocation.x < 0 || bulletLocation.y > height || bulletLocation.y < (height-height)) {
      deleteBullets(); 
    }
  }
  

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
    bulletMovement();
    isBulletStillAlive();
    hitEnemy();
  }
  
  // method to display bullet
  void displayBullet () {

    pushMatrix();
    ellipseMode(CENTER);
    fill(colorCurrently);
    ellipse(bulletLocation.x, bulletLocation.y, bulletCurcumference, bulletCurcumference);
    noFill();
    popMatrix();
    //println("bang!");
  }
  
}
  
class Pcharacter {
  /*instance variables*/


  // set character start location
  PVector characterLocation;
  float PcharacterPositionX;
  float PcharacterPositionY;
  int PcharacterDirection;
  float PcharacterSpeed;
  float PcharacterSize;
  
  float blasterVelocity;
  float blasterXdirection;
  float blasterYdirection;
  float blasterRadius;
  // character health
  int healthMaxium;
  int healthCurrent;
  boolean alive;
  int score;
  // location of mouse
  PVector mouseCurrentLocation;
  // blaster upgrade (type 2)
  Blaster blasterIncrease;
  // hit timer
  Timer hitTimer;
  Timer shieldDuration; 
  color colorNormally;
  color colorHit;
  color colorCurrently;


  /*constructors*/
  Pcharacter() {
    characterLocation = new PVector(width/2, height/2); // set chracter to start in the middle of the screen
    mouseCurrentLocation = new PVector(0, 0);
    PcharacterDirection = 0;
    PcharacterSpeed = 3;

    PcharacterSize = 100; // hard code width and height of character
    alive = true; // set character to be alive at the start of the game
    healthMaxium = 15;   // hard coded value of health, this is the health the character starts with
    healthCurrent = healthMaxium;
    score = 0; // presets character's score to 0 at the beginning of the game

    // from the blaster class create blaster upgrade
    blasterIncrease = new Blaster(this);
    hitTimer = new Timer(25);
    colorNormally = color(200, 100, 0);
    colorHit = color(255, 0, 0);
    colorCurrently = colorNormally;
  }


  /*methods*/
  void displayImage(String filename, float x, float y) {
    PImage img = loadImage(filename);
    image(img, x, y);
  }
  
  void moveCharacter () {
    switch(PcharacterDirection) {
      case NORTH: characterLocation.y -= PcharacterSpeed;
      break;
      case SOUTH: characterLocation.y += PcharacterSpeed;
      break;
      case EAST: characterLocation.x += PcharacterSpeed;
      break;
      case WEST: characterLocation.x -= PcharacterSpeed;
      break;
      //
      //
      case NORTH|WEST: characterLocation.y -= PcharacterSpeed;
                      characterLocation.x -= PcharacterSpeed;
      break;
      case NORTH|EAST: characterLocation.y -= PcharacterSpeed;
                      characterLocation.x += PcharacterSpeed;
      break;
      case SOUTH|WEST: characterLocation.y += PcharacterSpeed;
                      characterLocation.x -= PcharacterSpeed;
      break;
      case SOUTH|EAST: characterLocation.y += PcharacterSpeed;
                      characterLocation.x += PcharacterSpeed;
      break;
      case NORTH|WEST|EAST: characterLocation.y -= PcharacterSpeed;
      break;
      case SOUTH|WEST|EAST: characterLocation.y += PcharacterSpeed;
      break;
      case NORTH|WEST|SOUTH: characterLocation.x -= PcharacterSpeed;
      break;
      case NORTH|SOUTH|EAST: characterLocation.x += PcharacterSpeed;
      break;
    }
    characterLocation.x = constrain(characterLocation.x, 0 + (PcharacterSize / 2), width - (PcharacterSize / 2));
    characterLocation.y = constrain(characterLocation.y, 0 + (PcharacterSize / 2), height - (PcharacterSize / 2));
  }
  
  void updateCharacter () {
    moveCharacter();
    blasterIncrease.updateShooting();
    changeColorOfEnemy();
    blasterIncrease.updateShooting();
  }// update

 
  void displayCharacter () {
    displayImage("64_superhero.gif", characterLocation.x, characterLocation.y);
  }// display character

  void changeColorOfEnemy () {
    if(colorCurrently == colorHit && hitTimer.timerIsFinished()) {
      colorCurrently = colorNormally;
    }
  }
  
  // method to heal character based on bonus
  void healSuperhero (int heal) {
    healthCurrent = constrain(healthCurrent + heal, 0, healthMaxium);
  }


//------------------------
// HEALTH TALLY DISPLAY
//------------------------
  // method to display character health
  void DisplayCharacterHealth () {
    if (this == player) {
      fill(0, 129, 0);
      textSize(20);
      textAlign(LEFT); // align text to the left
      text("HEALTH: ", 250, 35); // display score
      fill(10, 174, 247);
      text(+healthCurrent, 347, 35);
    }
  }// health

  // method to reduce health from character
  void characterDamaged (Enemy hurt) {
    healthCurrent = constrain(healthCurrent - hurt.enemyDamage, 0, healthMaxium);
    if (healthCurrent <= 0) {
      characterDies();
    }
    else {
      hitTimer.startTimerEvent();
    }
  }// damaged character

  // method to kill main character
  void characterDies () {
    theCharacters.remove(this); // remove this character from the ArrayList
    alive = false; // now set alive to false(character is dead)
    // then insert code to end game
    gameOver = true;// end of game

      for (int i = 0; i < theCharacters.size(); i++) {
      Pcharacter player = theCharacters.get(i);

      if (player.alive == true) {
        // set the game to next level
        level1 = true;
      }
    }

    if (gameOver) {// end of game
      enemyVoodo();
    }
    else {
      for (int i = 0; i < enemies.size(); i++) {
        Enemy hurt = enemies.get(i);

        if (hurt.target == this) {
          hurt.target = hurt.getMainCharacter();
        }
      }
    }
  }// character dies

  //------------------------
  // SCORE TALLY DISPLAY
  //------------------------
  void scoreUpdate(int score) {
    if (this == player) {
      fill(0, 129, 0);
      noStroke();
      textSize(20);
      text("SCORE: ", 55, 35);
      fill(10, 174, 247);
      text(+score, 135, 35);
    }
  }// update score
}// end Pcharacter class

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

void GUI () {
//------------------------
// YOU WON DISPLAY
//------------------------
if(youWon == true) {
  background(255);
  fill(0, 129, 0, 50);
  textAlign(CENTER); // align text center
  textSize(40); // set font to 40 
  // this message prompts the user 
  text("YOU'VE WON!", (width/2), (height/2)); // display message
  text("YOUR SCORE WAS ", (width/2), (height/2 + 50));
  
}

//------------------------
// GAME OVER DISPLAY
//------------------------
if(gameOver == true) {
  background(255);
  fill(0, 129, 0, 50);
  textAlign(CENTER); 
  textSize(40); 
  text("GAME OVER!", (width/2), (height/2)); 
  textSize(20);
  text("Do you wish to play again?, press R to restart !", (width/ 2), 400); // display message
}

//------------------------
// GAME PAUSED DISPLAY
//------------------------
if(gamePaused == true) {
  background(255);
  fill(0, 129, 0, 50);
  textAlign(CENTER); // align text center
  textSize(40); // set font to 40 
  // this message prompts the user 
  text("GAME PAUSED", (width/2), (height/2)); // display message
  text("Press C to resume game", (width/2), (height/2 + 50));
  text("Press R to restart game", (width/2), (height/2) + 90);
}

}
// referenced from learning processing book
class Timer {

  /*instance variables*/
  int timerStarted;
  int timerDuration;

  /*contructor*/
  Timer(int tempTimerDuration) {
    timerDuration = tempTimerDuration;
  }

  /*methods*/
  void startTimerEvent () {
    // timer starts based on the number of milliseconds since starting the game
    // milliseconds = 1000 seconds
    timerStarted = millis();
    println(timerStarted);
  }

  boolean timerIsFinished () {
    // calculate time passed  = current time - start time
    int timePassed = millis() - timerStarted;

    // if the time passed is greater than or equal to the set duration of the game
    if (timePassed >= timerDuration) {
      // computer say 'yes'
      return true;
    }
    else {
      // otherwise computer say 'no'
      return false;
    }
  }
}


//------------------------
// HEALTH TALLY DISPLAY
//------------------------

 void initialize() {
    //background(50);
    player = new  Pcharacter();
    theCharacters = new ArrayList<Pcharacter>();
    theCharacters.add(player);
    bullets = new ArrayList<Bullet>();
    enemies = new ArrayList<Enemy>();
    bonuses = new ArrayList<Bonus>();
    level1 = true; 
    level2 = false;
    level3 = false;
    // enemy rates
    if(level1 == true) {
    enemySpawnInterval = 0.05;
    enemySpawnSpeed = 30.0;
    enemySpawnModify = 0.05;
    }
 
    
    
    
    // bonus rates
    bonusDropInterval = 0.0;
    bonusDropRate = 700.0;
    bonusDropModifier = 30;
    
  }// initialize
  
//------------------------
// UPDATE GAME
//------------------------
  void gameUpdate () {
  //background(50);
  if (level1 == true) { 
    enemySpawnRate();
    bonusSpawn();
  }

  // update player
  for (int i = 0; i < theCharacters.size(); i++) { // look through the array of characters
    theCharacters.get(i).updateCharacter(); // grab the characters then update (it)
  }
  // update bullets
  for (int i = 0; i < bullets.size(); i++) { // look through array of bullets
    bullets.get(i).updateBullet();  // grab the bullets then update them
  }
  // update enemies
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).update();
  }
  // update bonus
  for (int i = 0; i < bonuses.size(); i++) {
    bonuses.get(i).updateBonus();
  }
}// update player


//------------------------
// DRAW GAME
//------------------------
void gameDraw () {
  // draw player 
  for (int i = 0; i < theCharacters.size(); i++) { // look through the array of characters
    theCharacters.get(i).displayCharacter(); // grab the characters then display them(it)
  }
  // draw bullets
  for (int i = 0; i < bullets.size(); i++) { // look through array of bullets
    bullets.get(i).displayBullet(); // grab the bullets then display them
  }
  // draw enemies
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).displayEnemy();
  }
  // draw bonuses
  for (int i = 0; i < bonuses.size(); i++) {
    bonuses.get(i).display();
  }
}// game draw

void enemySpawnRate () {
   if(enemySpawnInterval < enemySpawnSpeed) {
     enemySpawnInterval++;
   }
   else {
     enemySpawnInterval = 0;
     if(enemySpawnSpeed > 15) {
       enemySpawnSpeed -= enemySpawnModify;
     }
     else {
       enemySpawnSpeed = 15;
     }
    int enemyType;
    enemyType = int(random(2));
    
    switch(enemyType) {
      case(1): enemies.add(new Enemy());
      break;
      case(2): enemies.add(new NewEnemy());
      break;
    }
   }
 }
 
 // vodo for the enemies
 void enemyVoodo () {
   for(int i = 0; i < enemies.size(); i++) {
     enemies.get(i).voodoo();
   }
 }
 
 void bonusSpawn () {
   if(bonusDropInterval < bonusDropRate) {
     bonusDropInterval++;
   }
   else {
     bonusDropInterval = 0;
     if(bonusDropRate > 300) {
       bonusDropRate -= bonusDropModifier;
     }
     else {
       bonusDropRate = 300;
     }
     
     int bonusDropType;
     bonusDropType = int(random(5));
     
     switch(bonusDropType) {
       case(1): bonuses.add(new Bonus(1));
       break;
       case(2): bonuses.add(new Bonus(2));
       break;
       case(3): bonuses.add(new Bonus(3));
       break;
       case(4): bonuses.add(new Bonus(4));
       break;
       case(5): bonuses.add(new Bonus(5));
       break;
     }
   }
 }
//void playGame() {
//
//  //(float rx, float ry, float rw, float rh, float cx, float cy, float cr
//  if (rectCircleIntersect(enemyX, y, 70, 60, x, bally+20, radius) == true) {
//    x = 60;
//    move = false;
//  }  
//
//  //////////////////ENEMY BALL
//  fill(255, 0, 0);
//  ellipse(enemyballx, y+23, enemyballradius, enemyballradius);
//
//  int enemyshoot = PApplet.parseInt (random(10));
//  if (enemyshoot ==1) {
//    enemymove = true;
//  }
//
//// moves ball continuiously
//  if (enemymove == true) {
//    enemyballx -= speedEnemyball;
//
//  }
//
//  if (enemyballx < 0) {
//    enemymove = false;
//    enemyballx = mouseX;
//  }
//
//
//}
//
//boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
// 
//  float circleDistanceX = abs(cx - rx - rw/2);
//  float circleDistanceY = abs(cy - ry - rh/2);
// 
//  if (circleDistanceX > (rw/2 + cr)) { return false; }
//  if (circleDistanceY > (rh/2 + cr)) { return false; }
//  if (circleDistanceX <= rw/2) { return true; }
//  if (circleDistanceY <= rh/2) { return true; }
// 
//  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
//  return cornerDistance <= pow(cr, 2);
//}

