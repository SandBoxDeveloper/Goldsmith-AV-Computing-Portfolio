Bonuses objects;
//Button button;
PFont menue;
// calling the character class to create a new vairable for a character
Pcharacter player;

// bullet array list
ArrayList<Bullet> bullets;


void setup () {
  size(800, 500);

  menue = loadFont("DialogInput-48.vlw");
  //button = new Button(50, 100, 80, 80, 5, 5, 5, 5, color(0)) 
  objects = new Bonuses(50);
  player = new Pcharacter();
  //bullets
  bullets = new ArrayList<Bullet>();
  }

  void draw () {
    background(255);
    //  objects.displayBonusHeart();
    //  objects.displayBonusSheild();
    //  objects.displayBonusTimer();
    //  objects.displayBonusStar();
    //  objects.displayBonusBomb();
    player.displayCharacter();

    //button.drawRectangleButton();
    textFont(menue, 30);

    // vertical line
    line(width/2, 0, width/2, 480);
    // thickness of line
    strokeWeight(5);
    // horizontal line
    line(80, 480, 390, 480);
    noStroke();
    // starting position of timer ball
    fill(255);
    ellipse(80, 480, 15, 15);
    // start text
    fill(0, 0, 255);
    text("start", 3, 487);
    // finish text
    text("finnish", 394, 487);
    
    
  }
  
  void mousePressed () {
    player.blasterIncrease.shooting = true;
  }

