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
      displayImage("64_heart.gif", bonusRandomPosition.x, bonusRandomPosition.y);
      //attackUser.healSuperhero(10);
      break;
      // bomb
      case(2):
       displayImage("64_bomb.gif", bonusRandomPosition.x, bonusRandomPosition.y);
       //attackUser.removeAllEnemies();
      break;
      // star
      case(3):
       displayImage("64_star.gif", bonusRandomPosition.x, bonusRandomPosition.y);
       //attackUser.startEffect();
      break;
      // timer
      case(4):
      displayImage("64_timer.gif", bonusRandomPosition.x, bonusRandomPosition.y);
      //attackUser.slowEnemyTimer();
      break;
      // shield
      case(5):
      displayImage("64_shield.gif", bonusRandomPosition.x, bonusRandomPosition.y);
      //attackUser.sheildSuperHero();
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
      // give superhero increased shooting power
      //attackUser.blasterIncrease = new BlasterUpgrade(attackUser);
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
  }// display

}
