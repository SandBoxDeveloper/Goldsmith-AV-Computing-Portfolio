//// 1: Global "count"
//// Background runs through a cycle of colours
//int count = 0;
//
//void setup() {
//  size(200, 200);
//}
//
//void draw() {
//  count = count + 1;
//  background(count);
//}

// 2: Local "count"
// Background stays black
void setup() {
  size(200, 200);
}

void draw() {
  int count = 0;
  count = count + 1;
  background(count);
}


