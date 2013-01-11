// defining me own functions
// these have three parts to them
// returnType, functionName and its arguments
// like this;

/*
returnType functionName (arguments) { 
    //code to be written here
}
*/

// this is only the definition of the function
// functions are best written below draw()
// this example ignors the returnType and arguments of an function

/*
void myFirstFunction () {
  fill(255, 0, 0);
  rect(width/2, height/2, 60, 60);
}
*/

// this is the definition of the function named myFirstFuntion
// when it is called it will display an red rectangle as shown by the function instructions
 
// to call an function do this

/*void setup () {
  size(200, 200);
}

void draw () {
  myFirstFunction();
  drawBlackCircle(20);
}

void myFirstFunction () {
  fill(255, 0, 0);
  rectMode(CENTER);
  rect(width/2, height/2, 60, 60);

}

// next I will explore the arguments of an function
// these can be described as the conditions in which an function should operate
// this is just like how we call processing functions, we call it using its
// speceified pararemters e.g rect(x1, y1, width, height); need to be called 
// to draw the rectangle

void drawBlackCircle (int x1) {
  fill(0);
  ellipse(x1, 50, 30, 30);
}

*/

// what ever is defined as the arguments will when called in the draw() function 
// change it's corresponding name determined by the value passed.
// e.g from the circle drawBlackCircle(20) where argument = 20; will
// change the x1 value in the functionas its function defintion stated that int x1
// should be passed in this function e.g void drawBlackCircle (int x1)

// next is looking at the return type of an function
// this is simply defining what literal value should be return in this function, e.g int, float, char, e.t.c
// e.g int sum (int a, int b);
// when an return type is included in the structure of an function it must include an return statement in order to display an value, otherwise nothing wll come up
// this is displayed bellow


//return valueToReturn;

/* //an example
int sum = sum(5, 10, 32);

int sum (int a, int b, int c) {
  int total = a + b + c;
  int plus = a + b;
  println(+total);
  println(+plus);
  return sum;
}
*/

//another example

void draw() {
println(+distance( 20, 10, 15, 30));
noLoop();
}

float distance (float x1, float y1, float x2, float y2) {
float dx = x1 - x2;
float dy = y1 - y2;
float d = sqrt(dx*dx + dy*dy);
return d;
}





