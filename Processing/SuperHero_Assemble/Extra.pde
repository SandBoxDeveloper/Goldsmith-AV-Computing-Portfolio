 void initialize() {
  PImage backdrop = loadImage("paper_background.gif");
    background(backdrop);
    player = new  Pcharacter();
    theCharacters = new ArrayList<Pcharacter>();
    theCharacters.add(player);
    bullets = new ArrayList<Bullet>();
    enemies = new ArrayList<Enemy>();
    bonuses = new ArrayList<Bonuses>();
    //gameOver = true;
    gameState = level1; // 1 = start menue, 2 = lv 1, 3 = lv 2, 4 = lv 3, 5 = end game
    //startScreen();
    // enemy rates
    if(gameState == level1) {
    enemySpawnInterval = 0.05;
    enemySpawnSpeed = 30.0;
    enemySpawnModify = 0.05;
    }
    
    // level 2
    else if(gameState == level2) {
    enemySpawnInterval2 = 0.10;
    enemySpawnSpeed2 = 10.0;
    enemySpawnModify2 = 0.05;
    println("lv2");
    }
    // level 3
    else if(gameState == level3) {
    enemySpawnInterval3 = 0.15;
    enemySpawnSpeed3 = 50.0;
    enemySpawnModify3 = 0.05;
    println("lv3");
    }
    
    
    // bonus rates
    bonusDropInterval = 0.0;
    bonusDropRate = 700.0;
    bonusDropModifier = 30;
    
  }
  
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
 // level 2
 void enemySpawnRateLevel2 () {
   if(enemySpawnInterval2 < enemySpawnSpeed2) {
     enemySpawnInterval2++;
   }
   else {
     enemySpawnInterval2 = 0;
     if(enemySpawnSpeed2 > 5) {
       enemySpawnSpeed2 -= enemySpawnModify2;
     }
     else {
       enemySpawnSpeed2 = 8;
     }
    int enemyType;
    enemyType = int(random(3));
    
    switch(enemyType) {
      case(0): enemies.add(new Enemy());
      break;
    }
   }
 }
 // level 3
 void enemySpawnRateLevel3 () {
   if(enemySpawnInterval3 < enemySpawnSpeed3) {
     enemySpawnInterval3++;
   }
   else {
     enemySpawnInterval3 = 0;
     if(enemySpawnSpeed3 > 15) {
       enemySpawnSpeed3 -= enemySpawnModify3;
     }
     else {
       enemySpawnSpeed3 = 25;
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
       case(1): bonuses.add(new Bonuses(1));
       break;
       default: bonuses.add(new Bonuses(2));
       break;
     }
   }
 }
