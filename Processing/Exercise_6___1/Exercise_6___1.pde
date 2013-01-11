//size(200, 200);
//background(255);
//
//int y = 0;
//while (y < 200) {
//  stroke(0);
//  line(0, y, width, y);
//  y += 5;
//}

size(200, 200);
background(255);

float w = width;
while (w > 0) {
  stroke(0);
  fill(w);
  ellipse(width/2, height/2, w, w);
  w = w - 20;
}
