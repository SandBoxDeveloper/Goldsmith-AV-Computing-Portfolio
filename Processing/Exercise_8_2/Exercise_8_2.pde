// Exercise 8 - 2
// defining an Human class

class Human {
  // variables
  color hairColor;
  float height;
  float time;
  float speed;
  
  // constructor
  Human() {
    hairColor = color(255, 0, 0);
    height = height/13;
    time = 1;
    speed = 2;
  }
  
  void display() {
    rectMode(CENTER);
    fill(hairColor);
    rect(width/2, height/2, 40, 40);
  }
  
  void sleep() {
    time = time + speed;
    if (time > width) {
      time = 0;
    }
    
  }
}
