Bonuses objects;
//Button button;
PFont menue;
// calling the character class to create a new vairable for a character
Pcharacter player;
Enemy test;
Bonuses bonus;
// array of enemies
ArrayList<Enemy> enemies;
// array of characters
ArrayList<Pcharacter> theCharacters;
//ghost
// array of bonuses
ArrayList<Bonuses> bonuses;
Enemy ghost;
// spawn variables
float enemySpawnInterval;
float enemySpawnSpeed;
float enemySpawnModify;
float enemySpawnInterval2;
float enemySpawnSpeed2;
float enemySpawnModify2;
float enemySpawnInterval3;
float enemySpawnSpeed3;
float enemySpawnModify3;
// bonus variables
float bonusDropInterval;
float bonusDropRate;
float bonusDropModifier;
// bullet array list
ArrayList<Bullet> bullets;
// new timer for enemy respawn
Timer t;
// game state
int gameState;
int instructions = 0;
int intro = 1;
int level1 = 2;
int level2 = 3;
int level3 = 4;
boolean gameOver;
PImage backdrop = loadImage("paper_background.gif");


void setup () {
  size(800, 500, P3D);
  frameRate(60);
  
  
  initialize();
 
  

  menue = loadFont("DialogInput-48.vlw");
//  button = new Button(50, 100, 80, 80, 5, 5, 5, 5, color(0)) 
//  objects = new Bonuses(50);
//  player = new Pcharacter();
//  bonus = new  Bonuses(100);
//  //bullets
//  bullets = new ArrayList<Bullet>();
//  enemies = new ArrayList<Enemy>();
//  //timer event 10 seconds
//  t = new Timer(5000);
//  ghost = new Enemy(100, 100, 100);
  test = new Enemy();
  }

  void draw () {
    //background(backdrop);
    
    // conditions to draw different screen modes e.g game over screen
    if(gameState == instructions) {
      displayInstructions();
    }
    if(gameState == intro) {
      startScreen();
    }
    else if(gameState == level1) {
        gameUpdate();
        gameDraw();
    }
    if(gameState == level2) {
        gameUpdate();
        gameDraw();
    }
    if(gameState == level3) {
        gameUpdate();
        gameDraw();
    }
    else if (gameOver) {
        gameUpdate();
        gameDraw();
        gameOverScreen();
    }
    
    
 println(+keyCode);
    // pause game
    if(keyCode == 80) {// P
      gamePause();
      println("game paused");
    }
    if(keyCode == 32) {// SPACEBAR
      background(0);
      gamePause();
      println("game paused");
    }
    // resume game
    if(keyCode == 67) {// C
      gameState = level1;
      println("resume game");
    }
    // restart game
    if(keyCode == 82) {// R
      gameRestart();
      println("restart game");
    }
    
    textFont(menue, 30);
    // display character score
    player.DisplayCharacterScore();
    // display character health
    player.DisplayCharacterHealth();
    //test.displayEnemy();
    // timeline
    displayTimeLine ();
    //println("mouse cur x: "+player.mouseCurrentLocation.x);
    //println("mouse cur y: "+player.mouseCurrentLocation.y);
    //println("char x: "+player.characterLocation.x);
   // println("char y: "+player.characterLocation.y);
  //fill(255, 0, 0);
  noStroke();
  rect(780, 10, 3, 15);
  rect(770, 10, 3, 15);    
    
  }
  
  void track () {
    player.mouseCurrentLocation.x = mouseX;
    player.mouseCurrentLocation.y = mouseY;
    
  }
  
  // moves the characters with the mouse
  void mouseMoved () {
    player.characterLocation.x = mouseX;
    player.characterLocation.y = mouseY;
    
  }
  
//  void mouseDragged () {
//    player.mouseCurrentLocation.x = mouseX;
//    player.mouseCurrentLocation.y = mouseY;
//    
//  }
  
  
  void mousePressed () {
   // player.characterLocation.x = mouseX;
    //player.characterLocation.y = mouseY;
    player.blasterIncrease.shooting = true;
    
  }
  
  

