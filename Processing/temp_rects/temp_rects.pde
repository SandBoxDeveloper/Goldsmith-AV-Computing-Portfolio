int arrayLength = 1000;
float [] myRandomX; 
float [] myRandomY; 
float [] myRectSize;
  
  
Rectangle[] rectangles = new Rectangle[arrayLength];
  
void setup() {
  size(500, 500);
  frameRate(10);
 
  myRandomX = new float [arrayLength]; //dont need
  myRandomY = new float [arrayLength];
  myRectSize = new float [arrayLength];
    
    for (int x = 0; x < arrayLength; x++) {
    float xPos = random(0, 500);
    float yPos = random(0, 500);
    float rectSize = random(0, 100);
      
      myRandomX[x] = xPos; //dont need
      myRandomY[x] = yPos; 
      myRectSize[x] = rectSize;
      
          //make all rectangles
      rectangles[x] = new Rectangle((int)xPos, (int)yPos, (int)rectSize);
      
    }
    

}

void draw() {
 
/*for(int i = 0; i < arrayLength; i++){
  DrawRectangle(myRandomX[i], myRandomY[i], myRectSize[i]);
 
}*/

for(int k=0; k < rectangles.length; k++)
{
  rectangles[k].draw();
}

}
  
  /*void DrawRectangle(float x, float y, float rectSize){
  
    rect(x, y, rectSize, rectSize); 
    if (mouseX > x && mouseX < (x+rectSize) ){
      if(mouseY > y && mouseY < (y+ rectSize)){
        boolean colour = true; 
          if(colour){
           fill(255,0,0);
           rect(x, y, rectSize, rectSize); 
           fill(255); 
          }
      }
    }    
  }*/
  
  void mouseMoved()
  {
    //reset to white
      for(int k=0; k < rectangles.length; k++)
      {
        rectangles[k].c = color(255);
      }
    
      //draw first rect found (i.e. on top)
      for(int k= rectangles.length - 1; k >= 0; k--)
      {
        int x = rectangles[k].x;
        int y = rectangles[k].y;
        int rectSize = rectangles[k].rectSize;
        
        if (mouseX > x && mouseX < (x+rectSize) ){
      if(mouseY > y && mouseY < (y+ rectSize)){
        //mouse is above rect, so change color
        rectangles[k].c = color(255, 0, 0);
        break; //dangerous only one rect will highlight (but could be in background)
      }
        }
      }
    
  }
