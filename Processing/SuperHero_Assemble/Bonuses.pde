class Bonuses {
  /*instance variables*/

  // bonus Size
  int bonusSize;
  // bonuses images
  PImage heart, sheild, timer, star, bomb;
  // type of bonus
  int type;
  // bonus random position
  PVector bonusRandomPosition;
  color bonuesColor;


  /* constructors */
  // Bonuses(string tempFile, int tempBonusSize);

  //  Bonuses(int tempBonusSize) {
  //    bonusSize = tempBonusSize;
  //  }

  Bonuses(int i) {
    bonusRandomPosition = new PVector(int(random(width)), (int)(random(height)));
    bonusSize = 50;
    type = i;
    sheild = loadImage("shield.gif");
    timer = loadImage("timer.gif");
    bomb = loadImage("bomb.gif");

    switch(i) {
      // heart
      case(1):
      image(sheild, bonusRandomPosition.x, bonusRandomPosition.y, bonusSize, bonusSize);
      break;
      // timer
      case(2):
      image(timer, bonusRandomPosition.x, bonusRandomPosition.y, bonusSize, bonusSize);
      // shield
      case(3):
      image(bomb, bonusRandomPosition.x, bonusRandomPosition.y, bonusSize, bonusSize);
    }
  }





  /* methods */

  // method that determines if the bonues item has been picked up
  void pickedUp () {
    for (int i = 0; i < theCharacters.size(); i++) {
      Pcharacter attackUser = theCharacters.get(i);
      float distanceBetween = dist(bonusRandomPosition.x, bonusRandomPosition.y, attackUser.characterLocation.x, attackUser.characterLocation.y);

      if (distanceBetween < (bonusSize/2) + attackUser.PcharacterSize/2) {
        applyBonusEffectPlayer(attackUser);
        removeBonus();
        break;
      }
    }
  }

  // method to apple the effect of th bonus to the player or eneimies
  void applyBonusEffectPlayer (Pcharacter attackUser) {
    switch(type) {
      case(1):
      // give superhero increased health
      attackUser.healSuperhero(10);
      break;
      case(2):
      // give superhero increased shooting power
      attackUser.blasterIncrease = new BlasterUpgrade(attackUser);
      break;
      case(3):
      // timer bonus
      //hurt.bomb();
      //case(4):
      // star bonus
    }
  }
  
  // method to apple the effect of th bonus to the player or eneimies
  void applyBonusEffectEnemy (Enemy hurt) {
    switch(type) {
      //case(1):
      // give superhero increased health
     // attackUser.healSuperhero(10);
      //break;
      //case(2):
      // give superhero increased shooting power
      //attackUser.blasterIncrease = new BlasterUpgrade(attackUser);
      //break;
      case(3):
      // timer bonus
      hurt.bomb();
      break;
      //case(4):
      // star bonus
    }
  }

  // method to remove bonus from screen
  void removeBonus () {
    bonuses.remove(this);
  }

  // method to update state of bonuses
  void updateBonus () {
    pickedUp();
  }

  // method to display bonuses
  void display () {
    fill(bonuesColor);
    heart = loadImage("heart.gif");
    //ellipse(bonusRandomPosition.x, bonusRandomPosition.y, bonusSize, bonusSize);
    image(heart, bonusRandomPosition.x, bonusRandomPosition.y, bonusSize, bonusSize);
    noFill();
  }

//  // display heart bonus
//  void displayBonusHeart () {
//    // load heart image
//    heart = loadImage("heart.gif");
//    // set image to be positioned by its center point
//    imageMode(CENTER);
//    // display image and pass values from constructor to position image
//    image(heart, bonusSize, bonusSize, bonusSize, bonusSize);
//  }
//
//  // display sheild bonus
//  void displayBonusSheild () {
//    // load sheild image
//    sheild = loadImage("shield.gif");
//    // set image to be positioned by its center point
//    imageMode(CENTER);
//    // display image and pass values from constructor to position image
//    image(sheild, bonusSize, bonusSize, bonusSize, bonusSize);
//  }
//
//  // display timer bonus
//  void displayBonusTimer () {
//    // load timer image
//    timer = loadImage("timer.gif");
//    // set image to be positioned by its center point
//    imageMode(CENTER);
//    // display image and pass values from constructor to position image
//    image(timer, bonusSize, bonusSize, bonusSize, bonusSize);
//  }
//
//  // display star bonus
//  void displayBonusStar () {
//    // load star image
//    star = loadImage("star.gif");
//    // set image to be positioned by its center point
//    imageMode(CENTER);
//    // display image and pass values from constructor to position image
//    image(star, bonusSize, bonusSize, bonusSize, bonusSize);
//  }
//
//  // display bomb bonus
//  void displayBonusBomb() {
//    // load bomb image
//    bomb = loadImage("bomb.gif");
//    // set image to be positioned by its center point
//    imageMode(CENTER);
//    // display image and pass values from constructor to position image
//    image(bomb, bonusSize, bonusSize, bonusSize, bonusSize);
//  }
}// end bonuses class

