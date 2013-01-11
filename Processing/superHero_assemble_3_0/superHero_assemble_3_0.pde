// Array list of obejcts
ArrayList<Enemy> enemies;
ArrayList<Bonus> bonuses;
ArrayList<Pcharacter> theCharacters;
ArrayList<Bullet> bullets;
//ArrayList<Bullet> bullets;
Pcharacter player;
Timer t;
// spawn variables
float enemySpawnInterval;
float enemySpawnSpeed;
float enemySpawnModify;
// bonus variables
float bonusDropInterval;
float bonusDropRate;
float bonusDropModifier;

int score;

// Instances
boolean menuOn = false;
boolean gameInstructions = false;
boolean level1 = true;
boolean level2 = false;
boolean level3 = false;
boolean youWon = false;
boolean gamePaused = false;
boolean gameOver = false;
// delete
int mode = 0;
int radius = 10;
int enemyballradius = 10;
float x = 23;
float y = 35;
float speedBall = 25;
float speedEnemyball = 10;
//
float speedPlayerball = 10;
//
float speedEnemy = 3;
int direction = 1;
float bally;
boolean move = false;

float enemyballx = 800;
//
float playerballx = 800;
//
float enemybally = 58;
boolean enemymove = false;
float enemyX = 790;
//
boolean playermove = false;
//end


void setup () {
  size(800, 480);
  smooth();
  frameRate(60);
  initialize();
}

void draw () {
  //------------------------
  // MENU SET TO ON
  //------------------------
  if(menuOn == true) {
    background(0);
    fill(206, 165, 110);
    textSize(85);
    text("SUPERHERO", width/2 - 220, 240);
    textSize(60);
    text("ASSEMBLE", width/2 - 135, 300); 
    fill(101, 112, 232);
    textSize(20);
    text("-----CLICK TO START-----", 270, 330);
  }
  //------------------------
  // GAME INSTRUCTIONS
  //------------------------
  if(gameInstructions == true) {
    background(0, 0, 200);
    fill(206, 165, 110);
    textSize(20);
    text("Move mouse to move superhero & control shooting", 150, 240);
    textSize(20);
    text("Press P or SPACEBAR to pause game", 230,300); 
    fill(101, 112, 232);
    textSize(20);
    text("Collect bonuses to help you during the game", 180, 330);
  }
  
  if(level1 == true) {
    gameUpdate();
    gameDraw();
  }
  
  if(mode == 1) {
    playGame();
  }
  
  GUI();
  player.scoreUpdate(score);
  player.displayCharacter();
  player.DisplayCharacterHealth();
  
  

}

void mousePressed () {
  if (mode == 0) {
    speedEnemy = 3;
    mode = 1;
    enemyballradius=10;
  } 
  else if (mode == 1) {
    enemymove = true;
    playermove = true;
  }
}

void mouseMoved () {
    player.characterLocation.x = mouseX;
    player.characterLocation.y = mouseY;
    enemyballx = mouseX;
    y = mouseY;
  }


