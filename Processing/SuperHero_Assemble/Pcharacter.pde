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
  //PImage superHero;
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
  // hit timer
  Timer hitTimer;
  Timer shieldDuration;
  // 
  color colorNormally;
  color colorHit;
  color colorCurrently;
  
  // load character image
  PImage superHero = loadImage("superhero.gif");

  
  
  /*constructors*/
  // addtional constructor that doesn't require any parameters
  Pcharacter() {
    characterLocation = new PVector(width/2, height/2); // set chracter to start in the middle of the screen
    mouseCurrentLocation = new PVector(0, 0);
    
    
    PcharacterSize = 100; // hard code width and height of character
    alive = true; // set character to be alive at the start of the game
    healthMaxium = 15;   // hard coded value of health, this is the health the character starts with
    healthCurrent = healthMaxium;
    score = 0; // presets character's score to 0 at the beginning of the game
    
    // from the blaster class create blaster upgrade
    blasterIncrease = new Blaster(this);
    hitTimer = new Timer(25);
    colorNormally = color(200, 100, 0);
    colorHit = color(255, 0, 0);;
    colorCurrently = colorNormally;
    // for shield bonus
    shieldDuration = new Timer(10);
    superHero.resize(82, 82); // resize character
    
    
  }
  
  
  /*methods*/
  // method to change color
  void colorChange () {
    if(colorCurrently == colorHit && hitTimer.timerIsFinished()) {
      colorCurrently = colorNormally;
    }
  }
  
  // method to update character state
  void updateCharacter () {
    colorChange();
    blasterIncrease.updateShooting();
  }
  
  // method to display character
  void displayCharacter () {
    // load main character image
    // superHero = loadImage("superhero.gif");
//    if(characterLocation.x < width/2) {
//         rotateY(PI);
//       translate(characterLocation.x, characterLocation.y);
//       
//       translate(-characterLocation.x, -characterLocation.y);
//       image(superHero, characterLocation.x, characterLocation.y, PcharacterSize, PcharacterSize);  
//       //println("flip"); 
//    }
    // set superhero to be positioned based on its center point
    //imageMode(CENTER);
    // display image and pass values from constructor to position and size image
    //else {
      
       
      //cursor(superHero, 10, 10);
    image(superHero, characterLocation.x, characterLocation.y, PcharacterSize, PcharacterSize);
    //println("dont flip");
    //}
    
  }
  
  // method to heal character based on bonus
  void healSuperhero (int heal) {
    healthCurrent = constrain(healthCurrent + heal, 0, healthMaxium); 
  }
  
  // method to implement star bonus effect
//  void starBonus () {
//  }
  
  // method to shield character, effectivly keeping their health at a constant state for a while
//  void shieldSuperhero (Pcharacter hurt, Timer shieldDuration) {
//    shieldDuration = new Timer(10);
//    while(shieldDuration) {
//       hurt.enemyDamage = 0; 
//    }
//    while (shieldDuration.startTimerEvent()) {
//    hurt.enemyDamage = 0; 
//    }  
//  }
  
  // method to display character score
  void DisplayCharacterScore () {
    if (this == player/*name of variable of character class that will be in the main sketch*/) {
      fill(0);
      textSize(12);
      textAlign(LEFT); // align text to the left
      text("Score: " +score, 10, 20); // display score
    }
  }
  
  // method to display character health
  void DisplayCharacterHealth () {
    if (this == player/*name of variable of character class that will be in the main sketch*/) {
      fill(0);
      textAlign(LEFT); // align text to the left
      text("Health: " +healthCurrent, 250, 20); // display score
    }
  }
  
  // method to reduce health from character
  void characterDamaged (Enemy hurt) {
    healthCurrent = constrain(healthCurrent - hurt.enemyDamage, 0, healthMaxium);
      if(healthCurrent <= 0) {
        characterDies();
      }
      else {
        colorCurrently = colorHit;
        hitTimer.startTimerEvent();
      }
  }
  
  // method to kill mina character
  void characterDies () {
    theCharacters.remove(this); // remove this character from the ArrayList
    alive = false; // now set alive to false(character is dead)
    // then insert code to end game
    gameOver = true;// end of game
    
    for (int i = 0; i < theCharacters.size(); i++) {
      Pcharacter player = theCharacters.get(i);
      
      if(player.alive == true) {
        // set the game to next level
        gameState = level1;//first level
      }
    }
    
    if(gameOver) {// end of game
      enemyVoodo();
    }
    else {
      for(int i = 0; i < enemies.size(); i++) {
       Enemy hurt = enemies.get(i);
       
       if(hurt.target == this) {
         hurt.target = hurt.getMainCharacter();
       }
      }
    }
  }
  
  
  
}// end Pcharacter class
