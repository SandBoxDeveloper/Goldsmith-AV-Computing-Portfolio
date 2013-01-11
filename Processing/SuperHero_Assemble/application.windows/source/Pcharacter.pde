class Pcharacter {
  /*instance variables*/
  
  // set character position X
  float PcharacterPositionX;
  // set character position Y
  float PcharacterPositionY;
  // set character start location
  PVector characterLocation;
  // set character size
  float PcharacterSize;
  // blasterVelocity
  float blasterVelocity;
  // blaster X direction
  float blasterXdirection;
  // blaster Y direction
  float blasterYdirection;
  // blaster radius
  float blasterRadius;
  // superHero main character image
  PImage superHero;
  // character health
  int healthMaxium;
  // current character health
  int healthCurrent;
  // is the character alive or dead ?
  boolean alive;
  // character score through-out the game
  int score;
  // location of mouse
  PVector mouseCurrentLocation;
  // blaster upgrade (type 2)
  Blaster blasterIncrease;
  
  
  /*constructors*/
  Pcharacter(float tempPcharacterPositionX, float tempPcharacterPositionY, float tempPcharacterSize) {
    
    // assign localVaraibles from contructor to gloabl variables
   
    PcharacterPositionX = tempPcharacterPositionX;  // temporary positon X assigned to position X
    
    PcharacterPositionY = tempPcharacterPositionX;  // temporary positon X assigned to position Y
    
    PcharacterSize = tempPcharacterSize;  // temporary characterSize assigned to characterSize
  }
  
  // additional constructor that changes just the character size
  Pcharacter(float tempPcharacterSize) {
    
    // assign localVaraibles from contructor to gloabl variables
    
    PcharacterSize = tempPcharacterSize;  // temp characterSize to characterSize
  }
  
  // addtional constructor that doesn't require any parameters
  Pcharacter() {
    alive = true; // set character to be alive at the start of the game
    characterLocation = new PVector(width/2, height/2); // set chracter to start in the middle of the screen
    PcharacterSize = 100; // hard code width and height of character
    healthMaxium = 15;   // hard coded value of health, this is the health the character starts with
    healthCurrent = healthMaxium;
    
    score = 0; // presets character's score to 0 at the beginning of the game
    mouseCurrentLocation = new PVector(0, 0);
    // from the blaster class create blaster upgrade
    blasterIncrease = new BlasterUpgrade(this);
    
  }
  
  
  /*methods*/
  // method to display character
  void displayCharacter () {
    // load main character image
    superHero = loadImage("superhero.gif");
    // set superhero to be positioned based on its center point
    imageMode(CENTER);
    // display image and pass values from constructor to position and size image
    image(superHero, mouseX, mouseY, 100, 100);
  }
  
  // method to display character score
  void DisplayCharacterScore () {
    if (this == player/*name of variable of character class that will be in the main sketch*/) {
      fill(129);
      textAlign(LEFT); // align text to the left
      text("Score: " +score, 10,10); // display score
    }
  }
  
  // method to update character state
  void updateCharacter () {
    blasterIncrease.updateShooting();
  }
  
}// end Pcharacter class
