// This sketch displays interactiving with the mouse
// Of the Zoog creature
// The sections in which where initizally blank 
// Have been commented


// Task make creature body move with the mouse

void setup() {
  size(200, 200);
}

void draw() {
  background(120);
  
// Draw zoog's eyes
fill(0);
ellipse(mouseX, mouseY, 16, 32); // mouseX, mouseY moves eyes with mouse
ellipse(mouseX+30, mouseY, 16, 32);

// Draw Zoog's legs
stroke(0);
line(mouseX, mouseY, mouseX+80, mouseY+60);
line(110, 150, 120,160);

}
