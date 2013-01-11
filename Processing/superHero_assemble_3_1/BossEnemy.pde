class BossEnemy extends Enemy {
  BossEnemy() {

    enemyLocation = processEnemySpawn();
    enemySpeed = 2.0;
    enemyMaxiumHelath = 60;
    enemyCurrentHealth = enemyMaxiumHelath;
    enemyDamage = 7;
    enemySize = 50;
    colorNormally = color(0, 0, 255);
    colorWhenEnemyHit = color(255, 0, 0);
    colorOfEnemyCurrently = colorNormally;
  }
  
}// boss enemy

