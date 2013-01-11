float rect1 = 0;
float rect2 = 0;
float rect3 = 0;
float rect4 = 0;


void setup() {
  size(200, 200);
}

void draw() {
  
  background(0);
  stroke(255);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  
  if(mouseX > width/2 && mouseY < height/2) {
    rect3 = 255;
    //fill(255);
    //rect(width/2, 0, width/2, height/2);
  }
  
  else if(mouseX < width/2 && mouseY < height/2) {
    rect1 = 255;
    //fill(rect2);
    //rect(0, 0, width/2, height/2);
  }
  
  else if(mouseX < width/2 && mouseY < height) {
    rect2 = 255;
    //fill(rect3);
    //rect(0, height/2, width/2, height/2);
  }
  
  else if(mouseX > width/2 && mouseY > height/2) {
    rect4 = 255;
    //fill(rect4);
    //rect(width/2, height/2, width/2, height/2);
  }
  
 
  
  // Increment rectangle colors
  rect1 = rect1 - 1;
  rect2 = rect2 - 1;
  rect3 = rect3 - 1;
  rect4 = rect4 - 1;
 
  
 fill(rect1);
 rect(0, 0, width/2, height/2);// top left
 fill(rect2);
 rect(0, height/2, width/2, height/2);// bottom left
 fill(rect3);
 rect(width/2, 0, width/2, height/2);// top right
 fill(rect4);
 rect(width/2, height/2, width/2, height/2);// bottom right
  
  
}
