// An array to keep track of how often random number are produced

float [] randomCounts;

void setup() {
  size(200, 200);
  randomCounts = new float[20];
}

void draw() {
  background(0);
  
  // Pick an random number and increase the count
  int index = int(random(randomCounts.length));
  randomCounts[index]++;
  
  // Draw a rectangle to the graph results
  stroke(0);
  fill(175, 200, 0, 200);
  for (int x = 0; x < randomCounts.length; x++) {
    rect(x*10, 0, 9, randomCounts[x]);
  }
}
