
//------------------------
// HEALTH TALLY DISPLAY
//------------------------

 void initialize() {
    background(50);
    player = new  Pcharacter();
    theCharacters = new ArrayList<Pcharacter>();
    theCharacters.add(player);
    bullets = new ArrayList<Bullet>();
    enemies = new ArrayList<Enemy>();
    bonuses = new ArrayList<Bonus>();
    level1 = true; 
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
  background(50);
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
    enemyType = int(random(3));
    
    switch(enemyType) {
      case(0): enemies.add(new Enemy());
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
     bonusDropType = int(random(4));
     
     switch(bonusDropType) {
       case(1): bonuses.add(new Bonus(1));
       break;
       default: bonuses.add(new Bonus(2));
       break;
     }
   }
 }
