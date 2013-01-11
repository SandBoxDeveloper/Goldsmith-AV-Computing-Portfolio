// using modularity to create functions in this sketch
// while considering the two of the three parts that make up an function
// functionName and arguments

// first I will show original sketch without using function calls

/*
int x = 100;             // x location
int y = 100;             // y location
int thesize = 64;        // size
int offset = thesize/4;  // position of wheel relative to car

void setup () {
  size(200, 200);
  background(255); 
}

void draw () {
  //draws main car body 
  rectMode(CENTER);
  stroke(0);
  fill(175);
  rect(x, y, thesize, thesize/2);
  
  // draws four wheels relative to center
  fill(0);
  rect(x-offset, y-offset, offset, offset/2);
  rect(x+offset, y-offset, offset, offset/2);
  rect(x-offset, y+offset, offset, offset/2);
  rect(x+offset, y+offset, offset, offset/2);


// to draw another car we would need to re-write the above code

int x = 500;             // x location
int y = 50;              // y location
int thesize = 24;        // size
int offset = thesize/4;  // position of wheel relative to car

  rectMode(CENTER);
  stroke(0);
  fill(255, 0, 0);
  rect(x, y, thesize, thesize/2);
  
  // draws four wheels relative to center
  fill(0);
  rect(x-offset, y-offset, offset, offset/2);
  rect(x+offset, y-offset, offset, offset/2);
  rect(x-offset, y+offset, offset, offset/2);
  rect(x+offset, y+offset, offset, offset/2); 
  
}
*/

// as show this can be an tirersome task
// now i will reduce this using mudularity by using functions

void setup() {
  size(200, 200);
  background(255);
}

void draw() {
  drawCar(50, 50, 100, color(255, 0, 200)); // i called the function with paramenters to draw the shape
  // i can call this function mutiple time to draw the car instead of having to rewrite the code numerous times and changing its values for code
  drawCar(100, 150, 40, color(255));
  drawCar(width/2, height/2, 10, color(255, 100, 110, 50));
}

void drawCar (int x, int y, int thesize, color c) {
  
//int x = 100;             // x location and others are not need as this would be a dublication of what is written in the function arguments
//int y = 100;             // if i wanted to have this then i would get with of the arguments in the function definition
//int thesize = 64;        
int offset = thesize/4;    // this is needed as it is not defined in the function arguments

  //draws main car body 
  rectMode(CENTER);
  stroke(200);
  fill(c); // replaced hard coded value with c to match function arguments
  rect(x, y, thesize, thesize/2);
  
  // draws four wheels relative to center
  fill(200);
  rect(x-offset, y-offset, offset, offset/2);
  rect(x+offset, y-offset, offset, offset/2);
  rect(x-offset, y+offset, offset, offset/2);
  rect(x+offset, y+offset, offset, offset/2);

}

// something important to remember about functions is the lingo between
// arguments Vs Parameters

// drawCar (int x, int y, int thesize, color c)
// that is what is called the arguments of an function


// this is passing parameters
//  drawCar(50, 50, 100, color(255, 0, 200))

