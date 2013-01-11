class Pcharacter {
  /*instance variables*/


  // set character start location
  PVector characterLocation;
  float PcharacterPositionX;
  // set character position Y
  float PcharacterPositionY;
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
  //Blaster blasterIncrease;
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

    PcharacterSize = 100; // hard code width and height of character
    alive = true; // set character to be alive at the start of the game
    healthMaxium = 15;   // hard coded value of health, this is the health the character starts with
    healthCurrent = healthMaxium;
    score = 0; // presets character's score to 0 at the beginning of the game

    // from the blaster class create blaster upgrade
    //blasterIncrease = new Blaster(this);
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
  // method to update character state
  void updateCharacter () {
    //blasterIncrease.updateShooting();
  }

  // method to display character
  void displayCharacter () {
    displayImage("64_superhero.gif", characterLocation.x, characterLocation.y );
  }// display character

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
      fill(255);
      textSize(20);
      textAlign(LEFT); // align text to the left
      text("Health: " +healthCurrent, 250, 35); // display score
    }
  }

  // method to reduce health from character
  void characterDamaged (Enemy hurt) {
    healthCurrent = constrain(healthCurrent - hurt.enemyDamage, 0, healthMaxium);
    if (healthCurrent <= 0) {
      characterDies();
    }
    else {
      hitTimer.startTimerEvent();
    }
  }

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
      //enemyVoodo(dd");
    }
    else {
      for (int i = 0; i < enemies.size(); i++) {
        Enemy hurt = enemies.get(i);

        if (hurt.target == this) {
          hurt.target = hurt.getMainCharacter();
        }
      }
    }
  }

  //------------------------
  // SCORE TALLY DISPLAY
  //------------------------
  void scoreUpdate(int score) {
    if (this == player) {
      fill(255);
      noStroke();
      textSize(20);
      text("SCORE: "+score, 55, 35);
    }
  }// update score
}// end Pcharacter class

