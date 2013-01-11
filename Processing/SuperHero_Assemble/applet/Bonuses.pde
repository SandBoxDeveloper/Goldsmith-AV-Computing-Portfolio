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
  void displayBonusHeart () {
    // load heart image
    heart = loadImage("heart.gif");
    // display image and pass values from constructor to position image
    image(heart, bonusSize, bonusSize);
  }

  // display sheild bonus
  void displayBonusSheild () {
    // load sheild image
    sheild = loadImage("family-guy.jpg");
    // display image and pass values from constructor to position image
    image(sheild, bonusSize, bonusSize);
  }

  // display timer bonus
  void displayBonusTimer () {
    // load timer image
    timer = loadImage("family-guy.jpg");
    // display image and pass values from constructor to position image
    image(timer, bonusSize, bonusSize);
  }

  // display star bonus
  void displayBonusStar () {
    // load star image
    star = loadImage("star.jpeg");
    // display image and pass values from constructor to position image
    image(star, bonusSize, bonusSize);
  }

  // display bomb bonus
  void displayBonusBomb() {
    // load bomb image
    bomb = loadImage("bomb.jpg");
    // display image and pass values from constructor to position image
    image(bomb, bonusSize, bonusSize);
  }
}// end bonuses class

