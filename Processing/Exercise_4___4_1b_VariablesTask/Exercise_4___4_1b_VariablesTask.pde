// Sketch 1 of exercise 4 - 4 modification using variables

int backgroundColor = 255;
int fillColor = 129;
int strokeW = 2;

float circleWidth = 30;
float circleHeight = 30; // not neccessary
float postionX = 50;
float postionY = 100;






void setup() {
  size(200, 200);
  smooth();
}

void draw() {
  background(backgroundColor);
  fill(fillColor);
  strokeWeight(strokeW);
  ellipse(postionX, postionX, circleWidth, circleHeight);
  ellipse(postionX, postionY, circleWidth, circleHeight);
  ellipse(postionY, postionX, circleWidth, circleHeight);
  ellipse(postionY, postionY, circleWidth, circleHeight);
  
  postionY = postionY + 1; // assignment operations experiment
  postionX = postionX - 1;
}
