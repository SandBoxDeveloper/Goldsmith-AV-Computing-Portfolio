/*
  NOTE THIS IS NOT A CLASS
 THIS IS JUST AN TAB THAT HOLDS THE METHODS 
 FOR UPDATING THE GAME STATE
 */







/*methods*/

// method to display end of game screen
void gameOverScreen () {
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

// method to update game
void gameUpdate () {
  PImage backdrop = loadImage("paper_background.gif");
  background(backdrop);
  if (gameState == level1) { 
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
}

// method to draw game objects
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
  
  if(gameOver) {
    gameOverScreen();
  }
}

// method to display start screen
void gameStart () {
  // fill background
  fill(0, 129, 0, 50);
  textAlign(CENTER); // align text center
  textSize(40); // set font to 40 
  // this message prompts the user 
  text("START GAME", (width/2), (height/2)); // display message 
  textSize(20);
}

// method to display pause menue
void gamePause () {
  // fill background
  fill(0, 129, 0, 50);
  textAlign(CENTER); // align text center
  textSize(40); // set font to 40 
  // this message prompts the user 
  text("GAME PAUSED", (width/2), (height/2)); // display message
  text("Press C to resume game", (width/2), (height/2 + 50));
  text("Press R to restart game", (width/2), (height/2) + 90);
}

// method to restart game
void gameRestart () {
  //gameState = 2; // restart at level 1
  // later on it would be better to implement a statement tht checks what level the user
  // was playing on, and restart from that level instead of from level 1
  
  initialize();
  gameUpdate();
  gameDraw();
}

// method to display timeline
void displayTimeLine () {

  //PImage icon = loadImage("superhero.gif");
  noStroke();
  // starting position of timer ball
  //fill(255);
  //image(icon, 80, 465, 30, 30);
  //ellipse(80, 480, 15, 15);
  // start text
  textSize(12);
  fill(0, 0, 255);
  text("start", 3, 487);
  // finish text
  text("finish", 763, 487);
}

void displayInstructions () {
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Move character with mouse", width/2, height/2 - 40);
  text("Controll shooting with mouse", width/2, height/2);
  text("Press SPACEBAR or P to pause game", width/2, height/2 + 40);
}


void startScreen () {
  float x = 305;
  float y = 175;
  float w = 190;
  float h = 50;
  float rad = 8;

  float x2 = 305;
  float y2 = 275;

  background(0, 0, 0);
  //rectMode(CENTER);

  // first button
  fill(0, 200, 200);
  rect(x, y, w, h, rad, rad, rad, rad);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("start game", width/2, height/2 - 40);
  // when mouse pressed
  if (mousePressed) {
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      println("but1");
      fill(50, 50, 50);
      text("start game", width/2, height/2 - 40);
      //gameState = 2;
      //initialize1();
      //gameState = level1;
      //gameUpdate();
    //gameDraw();
    }
  }

  // second button introduction
  fill(0, 200, 200);
  rect(x2, y2, w, h, rad, rad, rad, rad);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("instructions", width/2, height/2 + 60);
  // when mouse pressed
  if (mousePressed) {
    if (mouseX > x2 && mouseX < x2 + w && mouseY > y2 && mouseY < y2 + h) {
      println("but2");
      fill(50, 50, 50);
      text("instructions", width/2, height/2 + 60);
      displayInstructions();
      
    }
  }
}



