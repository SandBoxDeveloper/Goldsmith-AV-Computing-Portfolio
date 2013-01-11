// Sketch 2 of exercise 4 - 4 modification using variables

int r = 255;
int g = 255;
int b = 255;

float backgroundColor = 255 ;

float x1 = 100;
float x2 = 0;
float x3 = 200;
float y1 = 0;
float y2 = 200;
float y3 = 100;

void setup() {
  size(200, 200);
}

void draw() {
  
  background(backgroundColor);
  
  line(x1, y1, x1, y3); // Middle ine
  line(x2, y2, x1, y3); // Left line
  line(x3, y2, x1, y3); // Right line
}
