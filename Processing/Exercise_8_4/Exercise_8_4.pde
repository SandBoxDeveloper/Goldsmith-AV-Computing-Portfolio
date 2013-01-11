// Exercise 8 - 4
// This is an sketch that will have multiply tabs to create an OOP approach to
// creating an car 

/*color c;
int xpos;
int ypos;
int xspeed;

void setup () {

  size(200, 200);
  c = color(255);
  xpos = width/2;
  ypos = height/2;
  xspeed = 1;
}
void display () {

  rectMode(CENTER);
  fill(c);
  rect(xpos, ypos, 20, 10);
}

void drive () {

  xpos = xpos + xspeed;
  if (xpos > width) {
    xpos = 0;
  }
}
*/ // the original setup for drawing an car non-oop way

Car bently;

void setup () {
  size(500, 500);
  smooth();
  bently = new Car(color(0, 255, 0), width/2, height/2, 2, 50);
}

void draw () {
 background(255);
  bently.displayCar();
  bently.drive();
  
  
 
}
