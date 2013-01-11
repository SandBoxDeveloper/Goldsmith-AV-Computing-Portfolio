// This exercise using the for loop to rewrite the exercise
// From 6 - 1

// Multiple Lines

//size(200, 200);
//background(255);
//for (int y = 0; y < 200; y+= 5) {
//  stroke(0);
//  line(0, y, width, y);
//}

// DartBoard

size(200, 200);
background(255);
for (float w = width; w > 0; w-= 20) {
  stroke(0);
  fill(w);
  ellipse(width/2, height/2, w, w);
}
