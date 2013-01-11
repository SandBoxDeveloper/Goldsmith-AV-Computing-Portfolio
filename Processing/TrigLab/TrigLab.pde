float r;
float t;
float f;
//PImage imagePic;
void setup () {
  size(500, 500);
  //imagePic = loadImage("heart.gif");
}

void draw () {
  background(0);
  t = frameCount/4;
  // t = millis();
  // f = amplitude * sin( frequency * t + phase);
  f = 50 * sin(1 * t + 40);
  
  beginShape();
  //PImage imagePic = loadImage("heart.gif");
  //texture(imagePic);

  //fill(255, 0, 0);
  //noFill();
  //stroke(255);
  //strokeWeight(5);
  for (int i = 0; i <= 500; i+=10)

    // x = R*cos(A), y = R*sin(A)
    // R = radius of circle
    // A = angle of circle
    vertex(5*cos(radians(i)), 5*sin(radians(i)));
    // use below to generate a wave form
    //vertex(i, r*sin(radians(i)));
 // r+=0.1;
  translate(width/2, height/2 + f);
  endShape();
}

