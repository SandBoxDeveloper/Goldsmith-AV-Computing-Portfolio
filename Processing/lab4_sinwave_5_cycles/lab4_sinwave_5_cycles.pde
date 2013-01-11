void setup() {
  size(500, 500, P2D);;
  //background(0);
}

void draw() {
  background(0);
  stroke(255, 0, 0);
  //fill(0, 255, 0);
  //plot a sin wave
  float phase = 0;
    float amp = 0;
    float time = 0;
    while (phase < 10 * TWO_PI) {
      // amp is the 'Y' position
      amp = (sin(phase) + 1) * 250 ;
      // time is the 'X' position
      time ++;
     // fill(255, 0, 0);
      point(time, amp);
      phase += (TWO_PI / 100);
    }
    cline();
    
}

void cline () {
  fill(0, 0, 255);
  line(0, width/2, width , width/2);
}
