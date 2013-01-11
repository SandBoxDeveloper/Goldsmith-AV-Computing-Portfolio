import processing.core.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class SuperHero_Assemble extends PApplet {

Bonuses objects;
//Button button;
PFont menue;
// calling the character class to create a new vairable for a character
Pcharacter player;

// bullet array list
ArrayList<Bullet> bullets;


public void setup () {
  size(800, 500);

  menue = loadFont("DialogInput-48.vlw");
  //button = new Button(50, 100, 80, 80, 5, 5, 5, 5, color(0)) 
  objects = new Bonuses(50);
  player = new Pcharacter();
  //bullets
  bullets = new ArrayList<Bullet>();
  }

  public void draw () {
    background(255);
    //  objects.displayBonusHeart();
    //  objects.displayBonusSheild();
    //  objects.displayBonusTimer();
    //  objects.displayBonusStar();
    //  objects.displayBonusBomb();
    player.displayCharacter();

    //button.drawRectangleButton();
    textFont(menue, 30);

    // vertical line
    line(width/2, 0, width/2, 480);
    // thickness of line
    strokeWeight(5);
    // horizontal line
    line(80, 480, 390, 480);
    noStroke();
    // starting position of timer ball
    fill(255);
    ellipse(80, 480, 15, 15);
    // start text
    fill(0, 0, 255);
    text("start", 3, 487);
    // finish text
    text("finnish", 394, 487);
    
    
  }
  
  public void mousePressed () {
    player.blasterIncrease.shooting = true;
  }

class Blaster {
  /*instance variables*/
  Pcharacter shootToKill;
  // are you shoting or not ?
  boolean shooting;
  // what level is the blaster ?
  int blasterLevel; // level = 1 is normal mode, level 2 = increase bullet damage and speed
  //byte blasterLevel; // a more convient was to store number values, this stores between -127 and 128
  
  
  /*constructors*/
  Blaster(Pcharacter tempShootToKill) {
    shootToKill = tempShootToKill; 
    shooting = false; // set shooting to false, (current not shooting)
    blasterLevel = 1; // set blaster level to normal mode
  }
  
  /*methods*/
  // method to start blasting(shooting) objects
  public void blastIt () {
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
  public void updateShooting () {
    // call the blastIt method to shoot again
    blastIt();
  }
  
}// end blaster class

class BlasterUpgrade extends Blaster{
  /*instance variables*/
  // based on the timer class which includes millsecond, this will allow the ability to increase the rate in which you can shoot a bullet
  Timer blasterFireRate;
  // set the cap on how many shots the blaster can take in this current upgraded mode
  int blasterCap;
  // this is needed to keep track of cap, e.g to see how much of the blastercap the player has used already
  int blasterCurrentCap;
  
  /*constructors*/
  BlasterUpgrade (Pcharacter tempShootToKill) {
    super(tempShootToKill); // call the parameter from the Blaster class
    blasterLevel = 2; // set blaster to level 2(increase shooting rate and damage);
    blasterFireRate = new Timer(120); // this blaster rate will last for 120 milliseconds(0.12 seconds)
    blasterCap = 80; // set blaster cap
    blasterCurrentCap = blasterCap; // current cap = set blaster cap
  }
  /*methods*/
  // method to start blasting(shooting) objects
  public void blastIt () {
    // if character is alive
    if(shootToKill.alive) {
      // and if shooting and blaster upgrade timer rate is over and current blaster cap is greater than 0
      if(shooting && blasterFireRate.timerIsFinished() && blasterCurrentCap > 0) {
        // add a new bullet to array list
        bullets.add(new Bullet(shootToKill));
        // decrease by -1 the current blaster cap. e.g each time you are shooting during the upgrade timer event decrease the blasterCap by -1
        blasterCurrentCap--;
      }
    }
  }
  

  
  
}// end BlasterUpgrade class
class Bonuses {
  /*instance variables*/

  // bonus Size
  int bonusSize;
  // bonuses images
  PImage heart, sheild, timer, star, bomb;
  // bonus random position
  float bonusRandomPosition;


  /* constructors */
  // Bonuses(string tempFile, int tempBonusSize);

  Bonuses(int tempBonusSize) {
    bonusSize = tempBonusSize;
  }











  /* methods */

  // display heart bonus
  public void displayBonusHeart () {
    // load heart image
    heart = loadImage("heart.gif");
    // display image and pass values from constructor to position image
    image(heart, bonusSize, bonusSize);
  }

  // display sheild bonus
  public void displayBonusSheild () {
    // load sheild image
    sheild = loadImage("family-guy.jpg");
    // display image and pass values from constructor to position image
    image(sheild, bonusSize, bonusSize);
  }

  // display timer bonus
  public void displayBonusTimer () {
    // load timer image
    timer = loadImage("family-guy.jpg");
    // display image and pass values from constructor to position image
    image(timer, bonusSize, bonusSize);
  }

  // display star bonus
  public void displayBonusStar () {
    // load star image
    star = loadImage("star.jpeg");
    // display image and pass values from constructor to position image
    image(star, bonusSize, bonusSize);
  }

  // display bomb bonus
  public void displayBonusBomb() {
    // load bomb image
    bomb = loadImage("bomb.jpg");
    // display image and pass values from constructor to position image
    image(bomb, bonusSize, bonusSize);
  }
}// end bonuses class

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
    speed = 15.0f; // set speed
    damageDone = 1; // set the damge the bullet will make to objects
    
    bulletTrajectory = PVector.sub(shootToKill.mouseCurrentLocation, bulletLocation); // subtract player's location from bullet location
    bulletTrajectory.normalize(); // normalize bullet Trajectory to length 1
    bulletTrajectory.mult(speed); // multiple bullet Trajectory with speed to allows change of speed for bullet
    bulletCurcumference = 15; // set bullet curcumference(circle width)
  }
  
  /*methods*/ 
  // method for how bullet travels through space
  public void bulletMovement () {
    // add where abouts the bullet is to the location of it, this simulates bullet movement
    bulletLocation.add(bulletTrajectory);
  }
  
  // method to display bullet
  public void displayBullet () {
    fill(129); // colour of bullet
    ellipse(bulletLocation.x, bulletLocation.y, bulletCurcumference, bulletCurcumference); // bullet
  }
  
  // method to remove bullets from array list
  public void deleteBullets () {
    // remove bullet from array
    bullets.remove(this);
  }
  
  // method to check if bullet is still displayed on the screen, if it is then no longer alive
  public void isBulletStillAlive () {
    // is the bullet beyond the borders of the screen
    if(bulletLocation.x > width || bulletLocation.x < 0 || bulletLocation.y > height || bulletLocation.y < (height-height)) {
    // if the bullet is no longer on the screen, delete the bullet using the appropriate method
      deleteBullets(); 
    }
  }
  
  // method to to update what the bullet state (what is going on with the bullet)
  public void updateBullet () {
    // call bullet movement
    bulletMovement();
    // call to see if bullet is still alive
    isBulletStillAlive();
    // call to see if bullet has hit an object(enemy) ?
  }
  
  
}
class Button {
  /*instance variables*/

  // position X of square button
  float rectanglePositionX;
  // position Y of square button
  float rectanglePositionY;
  // rectangle width
  int rectangleWidth;
  // rectangle height
  int rectangleHeight;
  //
  int radiiAllFourCorners, radiusTopLeft, radiusTopRight, radiusBottomRight, radiusBottomLeft;
  // 
  int rectangleColor;
  // color of rectangle when highlighted/mouseover
  int rectangleHighlightColor;
  // current color of rectangle
  int rectangleCurrentColor;
  // true of false is the rectangle highlighted ?
  boolean rectangleHoverOver = false;

  /*constructor*/
  /*following the format rect(x, y, w, h)*/
  /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight*/
  Button(float tempRectanglePositionX, float tempRectanglePositionY, int tempRectanlgeWidth, int tempRectanlgeHeight, int tempRectangleColor) {

    // assign localVaraibles from contructor to gloabl variables

    rectanglePositionX = tempRectanglePositionX; // temporary positon X assigned to position X

    rectanglePositionX = tempRectanglePositionY; // temporary positon X assigned to position Y

    rectangleWidth = tempRectanlgeWidth; // temporary rectangle width assigned to rectangle width

    rectangleHeight = tempRectanlgeHeight; // temporary rectangle height assigned to rectangle height

    rectangleColor = tempRectangleColor; // temporary rectangle colour assigned to rectangle colour
  }

  /*following the format rect(x, y, w, h, r)*/
  /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight, r = radii for all four corners */
  Button(float tempRectanglePositionX, float tempRectanglePositionY, int tempRectanlgeWidth, int tempRectanlgeHeight, float radiiAllFourCorners, int tempRectangleColor) {
    
    // assign localVaraibles from contructor to gloabl variables

    rectanglePositionX = tempRectanglePositionX; // temporary positon X assigned to position X

    rectanglePositionX = tempRectanglePositionY; // temporary positon X assigned to position Y

    rectangleWidth = tempRectanlgeWidth; // temporary rectangle width assigned to rectangle width

    rectangleHeight = tempRectanlgeHeight; // temporary rectangle height assigned to rectangle height

    rectangleColor = tempRectangleColor; // temporary rectangle colour assigned to rectangle colour
  }

  /*following the format rect(x, y, w, h, t1, tr, br, b1)*/
  /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight, t1 = radius for top-left corner, tr = radius for top-right corner, br =  radius for bottom-right corner , b1 =  radius for top-left corner */
  Button(float tempRectanglePositionX, float tempRectanglePositionY, int tempRectanlgeWidth, int tempRectanlgeHeight, float radiusTopLeft, float radiusTopRight, float radiusBottomRight, float radiusBottomLeft, int tempRectangleColor) {
    
    // assign localVaraibles from contructor to gloabl variables

    rectanglePositionX = tempRectanglePositionX; // temporary positon X assigned to position X

    rectanglePositionX = tempRectanglePositionY; // temporary positon X assigned to position Y

    rectangleWidth = tempRectanlgeWidth; // temporary rectangle width assigned to rectangle width

    rectangleHeight = tempRectanlgeHeight; // temporary rectangle height assigned to rectangle height

    rectangleColor = tempRectangleColor; // temporary rectangle colour assigned to rectangle colour
  
  }


  /*methods*/
  public void drawRectangleButton () {
    // fill rectangle with color passed by reference in constructor
    fill(rectangleColor);
    // draw rectangle based on references passed in constructor
    /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight*/
    /*rect(x, y, w, h)*/
    rect(rectanglePositionX, rectanglePositionY, rectangleWidth, rectangleHeight);
    /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight, r = all four corners*/
    /*rect(a, b, c, d, r)*/
    rect(rectanglePositionX, rectanglePositionY, rectangleWidth, rectangleHeight, radiiAllFourCorners);
    fill(rectangleColor);
    /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight, tl = radius top-left corner, tr = radius top-right corner, br = radius bottom-right corner, bl = radius bottom-left corner*/
    /*rect(a, b, c, d, t1, tr, br, b1)*/
    rect(rectanglePositionX, rectanglePositionY, rectangleWidth, rectangleHeight, radiusTopLeft, radiusTopRight, radiusBottomRight, radiusBottomLeft);
  }
}// end button class

class Enemies extends Pcharacter {
  /*instance variables*/
  
  // Enemy Random position
  float enemyRandomPosition;
  // enemy State alive or dead 
  int enemyState;
  // enemy images
  PImage ghost, robot; 
  
  /*contructors*/
//  Enemies (int tempPcharacterPositionX, int tempPcharacterPositionX) {
//    PcharacterPositionX = tempPcharacterPositionX;
//    PcharacterPositionY = tempPcharacterPositionY;
//  }

 Enemies(float tempPcharacterPositionX, float tempPcharacterPositionY, float tempPcharacterSize) {
    super(tempPcharacterPositionX, tempPcharacterPositionY, tempPcharacterSize);
    // assign localVaraibles from contructor to gloabl variables
   
  
  }
  
  /*methods*/
  
  public void displayEnemyDianasour () {
  }
  
}// end Enemies class
/*
  NOTE THIS IS NOT A CLASS
  THIS IS JUST AN TAB THAT HOLDS THE METHODS 
  FOR UPDATING THE GAME STATE
*/
  

  
 
  /*methods*/
  
  // method to display end of game screen
  public void gameOverScreen () {
    // fill background
    fill(0, 129, 0, 50);
    textAlign(CENTER); // align text center
    textSize(40); // set font to 40 
    // this message prompts the user 
    text("GAME OVER!", (width/2), (height/2)); // display message 
    textSize(20);
    // this message prompt the user on what to do next
    text("Do you wish to play again?, press R to restart !", (width/ 2), 400); // display message
  }

class Pcharacter {
  /*instance variables*/
  
  // set character position X
  float PcharacterPositionX;
  // set character position Y
  float PcharacterPositionY;
  // set character start location
  PVector characterLocation;
  // set character size
  float PcharacterSize;
  // blasterVelocity
  float blasterVelocity;
  // blaster X direction
  float blasterXdirection;
  // blaster Y direction
  float blasterYdirection;
  // blaster radius
  float blasterRadius;
  // superHero main character image
  PImage superHero;
  // character health
  int healthMaxium;
  // current character health
  int healthCurrent;
  // is the character alive or dead ?
  boolean alive;
  // character score through-out the game
  int score;
  // location of mouse
  PVector mouseCurrentLocation;
  // blaster upgrade (type 2)
  Blaster blasterIncrease;
  
  
  /*constructors*/
  Pcharacter(float tempPcharacterPositionX, float tempPcharacterPositionY, float tempPcharacterSize) {
    
    // assign localVaraibles from contructor to gloabl variables
   
    PcharacterPositionX = tempPcharacterPositionX;  // temporary positon X assigned to position X
    
    PcharacterPositionY = tempPcharacterPositionX;  // temporary positon X assigned to position Y
    
    PcharacterSize = tempPcharacterSize;  // temporary characterSize assigned to characterSize
  }
  
  // additional constructor that changes just the character size
  Pcharacter(float tempPcharacterSize) {
    
    // assign localVaraibles from contructor to gloabl variables
    
    PcharacterSize = tempPcharacterSize;  // temp characterSize to characterSize
  }
  
  // addtional constructor that doesn't require any parameters
  Pcharacter() {
    alive = true; // set character to be alive at the start of the game
    characterLocation = new PVector(width/2, height/2); // set chracter to start in the middle of the screen
    PcharacterSize = 100; // hard code width and height of character
    healthMaxium = 15;   // hard coded value of health, this is the health the character starts with
    healthCurrent = healthMaxium;
    
    score = 0; // presets character's score to 0 at the beginning of the game
    mouseCurrentLocation = new PVector(0, 0);
    // from the blaster class create blaster upgrade
    blasterIncrease = new BlasterUpgrade(this);
    
  }
  
  
  /*methods*/
  // method to display character
  public void displayCharacter () {
    // load main character image
    superHero = loadImage("superhero.gif");
    // set superhero to be positioned based on its center point
    imageMode(CENTER);
    // display image and pass values from constructor to position and size image
    image(superHero, mouseX, mouseY, 100, 100);
  }
  
  // method to display character score
  public void DisplayCharacterScore () {
    if (this == player/*name of variable of character class that will be in the main sketch*/) {
      fill(129);
      textAlign(LEFT); // align text to the left
      text("Score: " +score, 10,10); // display score
    }
  }
  
  // method to update character state
  public void updateCharacter () {
    blasterIncrease.updateShooting();
  }
  
}// end Pcharacter class
class Timer {
  /*instance variables*/
  
  int timerStarted;
  int timerDuration;
  
   /*contructor*/
   Timer(int tempTimerDuration) {
     timerDuration = tempTimerDuration;
   }
  
  /*methods*/
  public void startTimerEvent () {
    // timer starts based on the number of milliseconds since starting the game
    // milliseconds = 1000 seconds
    timerStarted = millis();
  }
  
  public boolean timerIsFinished () {
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
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "SuperHero_Assemble" });
  }
}
