//declaring varibales

float x = 60;
float y = 440;
int radius = 45;
int bodyHeight = 160;
int neckHeight = 70;

float easing = 0.9;

void setup() {
  size(360, 480);
  smooth();
  strokeWeight(8);
  ellipseMode(RADIUS);
}

void draw() {
  int targetX = mouseX;
  x += (targetX - x) * easing;
  
  if (mousePressed) {
    neckHeight = 15;
    bodyHeight = 29;
  } else {
    neckHeight = 90;
    bodyHeight = 160;
  }
  
  float ny = y - bodyHeight - neckHeight - radius;
  
  background(178, 0, 255);
  
  //Neck
  stroke(0);
  line(x+12, y-bodyHeight, x+12, ny);
  
  //Antennae
  line(x+12, ny, x-18, ny-43);
  line(x+12, ny, x+42, ny-99);
  line(x+12, ny, x+78, ny+15);
  
  //arms
  fill(255);
  line(x-45, y-bodyHeight, 10, 2);
  //fill(255);
  //line(x-45, 60, 30, 2);
    
  //body
  noStroke();
  fill(0);
  ellipse(x, y-33, 40, 40); // support wheel
  fill(255);
  ellipse(x, y-33, 20, 20); // inner circle
  fill(0, 157, 143);
  rect(x-45, y-bodyHeight, 90, bodyHeight-33); //main body
  
  //head
  fill(0, 157, 143);
  ellipse(x+12, ny, radius, radius); //main head
  fill(255);
  ellipse(x+24, ny-6, 30, 30); //eyeball
  fill(0);
  ellipse(x+24, ny-6, 3, 3); //pupil
  
     
  
}

