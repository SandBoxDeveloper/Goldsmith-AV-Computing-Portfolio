//int x = 0;

void setup() {
  size(500, 500,P2D);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  int x = 0;
  
  while (x < 255) {
    //fill(255);
   // fill(x);
    fill(255-x, 40, x);
    rect(x, 0, 5, 100);
    x = x + 10;
  }

println("The value of X is: " +x);
println("There are this many rectangles " +(x + 10));
//rect(x, 0, 5, 100);

}
