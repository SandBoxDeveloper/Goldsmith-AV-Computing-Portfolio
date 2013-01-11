// Andre Hitchman
// based on filters and transformation exercises

PVector position, velocity, adjust, adjustSpeed;
float adjust1, adjust1Speed;

void setup () {
  size(500, 500);
  position = new PVector(0, 0);
  velocity = new PVector(0, 1); // 0 across, 1 down
  adjust = new PVector(0.3, 0.9); // percentage to scale the object 
  adjustSpeed = new PVector(0, 5);
  
  adjust1 = 0.3;
  adjust1Speed = 1;
}

void draw () {
  position.add(velocity); // move shape add velocity to position
  //scale(adjustSpeed);
  adjust.add(adjustSpeed); // animate scalling of object
  translate(position.x, position.y);
  //scale(adjust);
 
  //scale(adjust1);
  rect(0, 0, 200, 200);
}
