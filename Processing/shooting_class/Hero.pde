class Hero {
  float xPos;
  float yPos;
  int wSize;
  int hSize;
  color choose;
  
  // contructor
  Hero(float tempXpos, float tempYpos, int tempWsize, int tempHsize, color tempChoose) {
    xPos = tempXpos;
    yPos = tempYpos;
    wSize = tempWsize;
    hSize = tempHsize;
    choose = tempChoose;
  }
  
  void display () {
    rectMode(CENTER);
    fill(choose);
    rect(mouseX, mouseY, wSize, hSize);
  }
}
