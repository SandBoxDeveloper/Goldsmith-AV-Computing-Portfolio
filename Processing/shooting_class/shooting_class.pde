int n = 100;
int j = 0;// bullet
int score; // scoring system
Bullet[] bullet = new Bullet[n];
Hero hero;

void setup () {
  size(500, 500);
  
  
   for(int i = 0; i < n; i++){
    
    bullet[i] = new Bullet(-100,height+100,0,0);
   }
   
   hero = new Hero(mouseX, mouseY, 50, 50, color(129, 255, 0));
}

void draw () {
  background(129);
  // display score on screen
  fill(255);
  text(score, 20,20);
  
  // update bullet position
  for(int i = 0; i < n; i++) { 
    bullet[i].update();
  }
  
  // display bullet
  for(int i = 0; i < n; i++){
    bullet[i].display();
  }
  
  // display hero
  hero.display();

}

// create a new bullet each time the mouse is pressed based on the current
// mouse position
void mousePressed () {
 bullet[j] = new Bullet(mouseX, mouseY, +20, 5);
 j = (j + 1) % n;
}
