// Our friend here "Zoog" will appear from the bottom of the screen 
// And travel vertically upwards "until infinity and beyound!"
// The task here is to get our friend here to shake left and right
// As he moves upwards
float zoogX;
float zoogY;
float moveX;

float eyeR;
float eyeG;
float eyeB;

void setup() {
  size(200, 200);
  zoogX = width/2;
  zoogY = height + 100;
  smooth();
}

void draw() {
  
  background(255);
  
  // Set ellipses and rects to CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  // Draw zoog's body
  stroke(0);
  fill(150);
  rect(zoogX, zoogY, 20, 100);
  
  // Draw zoog's head
  stroke(0);
  fill(255);
  ellipse(zoogX, zoogY-30, 60, 60);
  
  // Draw zoog's eyes
  eyeR = random(255);
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR, eyeG, eyeB);
  
  ellipse(zoogX-19, zoogY-30, 16, 32);
  ellipse(zoogX+19, zoogY-30, 16, 32);
  
  // Draw zoog's legs
  stroke(150);
  line(zoogX-10, zoogY+50, zoogX-10, height);
  line(zoogX+10, zoogY+50, zoogX+10, height);
  
  // Zoog moves up
  zoogY = zoogY - 1;
  // Zoog shakes left and right
  zoogX = zoogX + random(-5, 5);
  
  
}
