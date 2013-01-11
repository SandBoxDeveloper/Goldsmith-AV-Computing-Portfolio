Mcharacter player;
Bullet bullet;

void setup () {
  size(500, 500);
  player = new Mcharacter();
}

void draw () {
  
  
  player.drawChart();
    if (bullet != null) {
      bullet.display();
      bullet.move();
    }
    
    if (mousePressed) {
      bullet = new Bullet(player.chartX, player.chartY);
    }
}
