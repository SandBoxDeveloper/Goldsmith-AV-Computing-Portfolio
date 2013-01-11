// What an achivment here!
// This code demonstates how to keep an design
// To be scalable to anysize of window it is displayed in

void setup() {
  size(900, 300);
  smooth();
}

void draw() {
  rectMode(CENTER);
  background(255);
  fill(129);
  rect((width/(screen.width/2)+width/6), (height/2), 30, 30); // Left square
  rect(width-(width/6), (height/2), 30, 30); // Right sqaure
  noFill();
  line(0, 0, width, height); // Top-Left to bottom Right
  line(width, 0, 0, height); // Top-Right to bottom Left
  fill(129);
  ellipse(width/2, height/2, width/2, height/2); // Center square
}

