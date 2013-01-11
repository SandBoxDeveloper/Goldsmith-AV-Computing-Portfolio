float grade = random(100);

void setup() {
  size(200, 200);
}

void draw() {
  
  //grade = random(100);

if (grade <= 80 || grade >=71) {
  println(" Assign letter B.");
}

else if (grade <= 70 || grade >=61) {
  println("Assign letter C.");
}

else if (grade <= 60 || grade >=51) {
  println("Assign letter D.");
}
  
  else {
    println("Failed.");
  }
  
}
