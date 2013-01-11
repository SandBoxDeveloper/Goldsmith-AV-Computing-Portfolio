class Enemies extends Pcharacter {
  /*instance variables*/
  
  // Enemy Random position
  float enemyRandomPosition;
  // enemy State alive or dead 
  int enemyState;
  // enemy images
  PImage ghost, robot; 
  
  /*contructors*/
//  Enemies (int tempPcharacterPositionX, int tempPcharacterPositionX) {
//    PcharacterPositionX = tempPcharacterPositionX;
//    PcharacterPositionY = tempPcharacterPositionY;
//  }

 Enemies(float tempPcharacterPositionX, float tempPcharacterPositionY, float tempPcharacterSize) {
    super(tempPcharacterPositionX, tempPcharacterPositionY, tempPcharacterSize);
    // assign localVaraibles from contructor to gloabl variables
   
  
  }
  
  /*methods*/
  
  void displayEnemyDianasour () {
  }
  
}// end Enemies class
