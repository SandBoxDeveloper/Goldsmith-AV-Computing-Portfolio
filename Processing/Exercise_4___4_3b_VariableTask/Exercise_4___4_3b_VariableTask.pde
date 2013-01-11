// Sketch 3 of exercise 4 - 4 modification using variables

int r = 255;
int g = 255;
int b = 255;

float x1 = 10;
float x2 = 100;
float y1 = 180;

float circleWidth= 100;
//float circleHeight= 100; // not neccessary
int backgroundColor = 255;
int fillColor = 129;


void setup() {
  size(200, 200);
  smooth();
}

void draw() {
  background(backgroundColor);
  fill(fillColor);
  rect(x1, x1, y1, y1);
  fill(b);
  ellipse(x2, x2, circleWidth, circleWidth);
}
