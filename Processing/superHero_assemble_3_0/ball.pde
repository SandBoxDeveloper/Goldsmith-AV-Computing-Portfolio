void playGame() {

  //(float rx, float ry, float rw, float rh, float cx, float cy, float cr
  if (rectCircleIntersect(enemyX, y, 70, 60, x, bally+20, radius) == true) {
    x = 60;
    move = false;
  }  

  //////////////////ENEMY BALL
  fill(255, 0, 0);
  ellipse(enemyballx, y+23, enemyballradius, enemyballradius);

  int enemyshoot = PApplet.parseInt (random(10));
  if (enemyshoot ==1) {
    enemymove = true;
  }

// moves ball continuiously
  if (enemymove == true) {
    enemyballx -= speedEnemyball;

  }

  if (enemyballx < 0) {
    enemymove = false;
    enemyballx = mouseX;
  }


}

boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
 
  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);
 
  if (circleDistanceX > (rw/2 + cr)) { return false; }
  if (circleDistanceY > (rh/2 + cr)) { return false; }
  if (circleDistanceX <= rw/2) { return true; }
  if (circleDistanceY <= rh/2) { return true; }
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}
