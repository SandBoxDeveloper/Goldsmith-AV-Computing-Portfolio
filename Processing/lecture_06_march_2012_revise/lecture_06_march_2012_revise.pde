// topics covered
// array exercises
// gernal syntax
//generate a random array
//calc average
//find maxx
//fill array wit unique random values


float[] fArray;

void setup () {
  fArray = new float[10];
  printArray(fArray);
  // this is passing by reference
  // this means this function 
  // affects the original array, not a copy
  // fillArrayWithZeros(fArray);
  // printArray(fArray);

  // this assigns random values between 0 and 2
  fillArrayWithRandomValues(fArray);
  printArray(fArray);

  // this calculates the average of the values in the array
  float average = calculateAverage(fArray);
  println("Average is " +average);

  // this find the maxium value in the array
  float maxF = findMax(fArray);
  println("max is " +maxF);


  //
  int [] iArray = new int[10];
  // very decriptive function name
  // google encourage people to have long names for their functions
  // google guide to best practice(google coding standards)
  //fillArrayWithUniqueRandomValue(iArray);
  // printArray(iArray);

  // looking at 2D arrays 
  //int[][] iArray2D = new int [10][10];
  //fill2ArrayWithRandomNumbers(iArray2D);


  // this is and example of pass by reference
  //  int x = 0;
  //  println(x);
  //  addOne(x);
  //  println(x);
}

void draw () {
}

/*need to revisit this in lecture video, unfinished */
//void fillArrayWithUniqueRandomValue (int[] iArray) {
//  int rand = 0;
//  boolean seen;
//  for (int i - 0; i <iArray.length; i++) {
//
//
//    while (seen) {
//      rand = (int) random(0, 10);
//      seen = false;
//
//
//      // test if we already have this number in the array
//      for (int j = 0; j < i; j++) {
//        // we have already added this random number
//        // into the array
//        if (iArray[j] == rand) {
//          seen = true;
//        }
//      }
//      iArray[i] = (int) random(0, 10);
//    }
//  }
//}


// function to find the maximum value in the array
float findMax(float[] fArray) {
  // use this to rembeber the maxium
  //float maxium = 0;

  // the lowest possible positive value the float can hold
  //float maximum = float.MINVALUE;
  float maximum = Float.NEGATIVE_INFINITY;
  println("max is " +maximum);

  // loop
  for (int i = 0; i< fArray.length; i++) {
    // isthe current element in the array
    // bigger than any seen before?
    if (fArray[i] > maximum) {
      // yes, update the remebered
      // maxium
      maximum = fArray[i];
    }
  }
  return maximum;
}

// calculate the average in the array
float calculateAverage(float[] fArray) {
  // divide the sum of elements
  // in the arrary
  // by the number of elements in the array

    float sum = 0;
  for (int i = 0; i<fArray.length; i++) {
    sum = sum + (float)fArray[i];
  }
  return sum / (float)fArray.length;
}

// assigning random values to the array with a for loop
void fillArrayWithRandomValues(float[] fArray) {
  // there are two possible
  // fArrays here:
  // the gloabl one
  // add the cuntion parameter

  for (int i = 0; i < fArray.length; i++) {
    fArray[i] = random(0, 2);
  }
}

// simple function to add on to show pass by value
void addOne(int x) {
  x = x + 1;
}

// function fill array with 1
void fillArrayWithZeros(float[] fArray) {
  int index = 0;
  //  for(int i = 0; i<fArray.length; i++) {
  //    fArray[i] = 1.0;
  //  }
  while (index < fArray.length) {
    fArray[index] = 1.0;
    index++;
  }
}

// this is method overloading
void printArray(int[] iArray) {
  // this is called a foreach loop
  for ( int i: iArray) {
    println("i is " +i);
  }
}

void printArray (float[] fArray) {
  // this is called a foreach loop
  for ( float f: fArray) {
    println("f is " +f);
  }
}

