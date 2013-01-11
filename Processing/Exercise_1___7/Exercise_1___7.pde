// Using only the functions
//point(), line(), rect(), ellipse(), stroke(), and fill(),
//Design a creature

//size
size(200, 200);




fill(255);
rect(75, 20, 50, 50); // head

point(100, 45); // noise

fill(0, 255, 0);
rect(80, 60, 40, 5); // mouth

fill(0, 255, 0); // green
ellipse(85, 30, 10, 10); // right eye
ellipse(115, 30, 10, 10); // left eye

line(100, 70, 100, 100); // neck

fill(255);
ellipse(100, 120, 70, 70); // body shape
line(85, 150, 85, 200); // left leg
line(120, 150, 120, 200); // right leg
line(65, 120, 25, 120); // left arm
line(135, 120, 175, 120); // right arm
