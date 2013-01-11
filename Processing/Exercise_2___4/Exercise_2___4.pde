// This sketch is of a creature i created
// All parts of the creature are commented
// For easy reference
// At the end iv'e included an print line function "hello mate!, how are you?"

//size of display window
size(200, 200); // size



//creature head
fill(255);
rect(75, 20, 50, 50); // head

//creature noise
point(100, 45); // noise

//creature mouth
fill(0, 255, 0);
rect(80, 60, 40, 5); // mouth

//creature's eyes
fill(0, 255, 0); // green
ellipse(85, 30, 10, 10); // right eye
ellipse(115, 30, 10, 10); // left eye

//creature neck
line(100, 70, 100, 100); // neck

//creature body
fill(255);
ellipse(100, 120, 70, 70); // body shape

//creature's legs
line(85, 150, 85, 200); // left leg
line(120, 150, 120, 200); // right leg

//creature's arm
line(65, 120, 25, 120); // left arm
line(135, 120, 175, 120); // right arm

println("Hello mate!, how are you?");
