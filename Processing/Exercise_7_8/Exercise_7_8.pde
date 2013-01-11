void draw () {
  println(+tempConverter(100));
  noLoop();
}

float tempConverter(float f) {
  float celsius = (f - 32)*(5.0/9.0);
  return celsius;
}

