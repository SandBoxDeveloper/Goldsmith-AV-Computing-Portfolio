// This is a dynamic sketch of my creation

void setup() {
  
  size(200, 200);
}

void draw() {
  
  rectMode(CENTER); // Set rect to allign center
  ellipseMode(CENTER); // Set ellipse to allign center

  rect(100, 100, 70, 50); // Body
  rect(75, 148, 20, 45); // Left Leg
  rect(125, 148, 20, 45); // Right Leg
  rect(45, 95, 40, 40); // Head
  triangle(35, 55, 25, 75, 45, 75); // Left Ear
  triangle(55, 55, 45, 75, 65, 75); // Right Ear
  ellipse(35, 85, 10, 10); // Left Eye
  ellipse(55, 85, 10, 10); // Right Eye
  ellipse(45, 105, 20, 10); // Mouth
  strokeWeight(2);
  line(136, 76, 160, 76); // Tail
  
}

