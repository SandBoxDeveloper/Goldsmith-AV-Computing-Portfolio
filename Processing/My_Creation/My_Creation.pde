size(200, 200);
rectMode(CENTER); // Set rect to allign center
ellipseMode(CENTER); // Set ellipse to allign center
background(255);

fill(190, 0, 200);
rect(100, 100, 70, 50); // Body
fill(129);
rect(75, 148, 20, 45); // Left Leg
rect(125, 148, 20, 45); // Right Leg
fill(129);
rect(45, 95, 40, 40); // Head
fill(0);
triangle(35, 55, 25, 75, 45, 75); // Left Ear
triangle(55, 55, 45, 75, 65, 75); // Right Ear
fill(0, 255, 0);
ellipse(35, 85, 10, 10); // Left Eye
fill(0, 0, 255);
ellipse(55, 85, 10, 10); // Right Eye
fill(255, 0, 0);
ellipse(45, 105, 20, 10); // Mouth
strokeWeight(2);
line(136, 76, 160, 76); // Tail
