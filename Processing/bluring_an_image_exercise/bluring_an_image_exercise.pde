// create a vector variable to store position and velocity
PVector position, velocity;
PVector scaleShape, scaleSpeed;
PImage logo;
// variable to controll blur
float x;
// variable to store copyed image
int temp;

void setup () {
  size(600, 600);
  // initialise vector variable position, velocity
  position = new PVector(0, 0);
  velocity = new PVector(1, 2); // 1 along x-axis, 2 along y-axis
  scaleShape = new PVector(2.0, 2.0); // scale x-axis by 2(200%), sclae y-axis by 2(200%)
  scaleSpeed = new PVector(3, 3);
  // initialise image(load image)
  logo = loadImage("img1_cc.png");
  // initialise x(blur)
  x = 1;
 

}

void draw () {
  
  temp = logo.copy();
  // to be able to move the shape, add to the velocity of the position of every frame
  position.add(velocity);  
  translate(position.x, position.y);
  // to scale shape uniformly
  scale(scaleShape.x, scaleShape.y);
  // animate scale variable(scale is done faster)
  position.add(scaleSpeed);
  //rect(0, 0, 200, 200);
  
  // display image
  image(logo, 0, 0, 100, 100);
  // filter copied image
  temp.filter(BLUR, x);
  
}
