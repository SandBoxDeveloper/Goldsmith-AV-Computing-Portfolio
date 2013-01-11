// Andre Hitchman
// based on filters and transformation exercises

PVector position, velocity, adjust, adjustSpeed;
float adjust1, adjust1Speed;
PImage myImage, myImageCopy;
int temp;

void setup () {
  size(500, 500);
  position = new PVector(0, 0);
  velocity = new PVector(0, 1); // 0 across, 1 down
  myImage = loadImage("Facebook-Like.jpg");
  //temp = myImage.copy();

}

void draw () {
  background(255); 
  myImage.filter(BLUR, 0.6); // the second parameter is the amount of blur
  position.add(velocity); // move shape add velocity to position
  translate(position.x, position.y);
  image(myImage, 0, 0);
  
}
