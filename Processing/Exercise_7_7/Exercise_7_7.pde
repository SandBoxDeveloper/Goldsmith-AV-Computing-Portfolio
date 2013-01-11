// this is an example that can take time to digest and understand
// this example is refered to as pass by copy or pass by value

/*
void setup() {
  float num = 10;
  println("The number is: " + num); // this happens first and displays 10
  randomizer(num); // then this is displayed refering to the randomizer function which will display 10 + and a random number between -2 and 2 and then prints the new number is  
  println("The number is: " + num); // lastly this is displayed which will show 10
}

void randomizer (float newnum) {
  newnum = newnum + random(-2, 2);
  println("The new number is: " + newnum);
}
*/


void setup () {
  println("a");  // "a" is displayed 1st
  function1();  // "e" then "f" is displayed 2nd
  println("b"); // "b" is displayed 3rd
}

void draw () {
    println("c");  // "c" is displayed 4th
    function2();   // "g" then "e" then "f" then "h" is displayed 5th
    println("d");  // "d" is displayed 6th
    function1();   // "e" then "f" is displayed 7th
    noLoop();         // so that draw only runs once 
    
    // there for the sequence of letters displayed when this program is run will be
    // "a", "e", "f", "b", "c", "g", "e", "f", "h", "d", "e", "f",
}

void function1 () {
    println("e");
    println("f");
}

void function2 () {
    println("g");
    function1();
    println("h");
}
