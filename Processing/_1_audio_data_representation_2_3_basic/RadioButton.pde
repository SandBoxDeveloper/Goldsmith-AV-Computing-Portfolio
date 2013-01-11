class Radio {
  int x, y;                   // the x and y coordinates
  int size, dotSize;          // dimension of circle, inner circle
  color baseGray, dotGray;    // circle gray value, inner gray value
  boolean checked = false;    // true when button is selected
  int me;                     // ID number for this radio object
  Radio[] others;             // array of all other radio objects
  
  // contructor
  Radio(int xp, int yp, int s, color b, color d, int m, Radio[] o) {
   x = xp;
   y = yp;
   size = s;
   dotSize = size - size/3;
   baseGray = b;
   dotGray = d;
   others = o;
   me = m;
  }
  
   // methods
   boolean press(float mx, float my){
     if (dist(x, y, mx, my) < size / 2) {
       checked = true;
       for (int i = 0; i < others.length; i++) {
         if (i != me) {
           others[i].checked = false;
         }
     }
     return true;
  }
  else {
    return false;
  }
}
  
  void display () {
    noStroke();
    fill(baseGray);
    ellipse(x, y, size, size);
    if (checked == true) {
      fill(dotGray);
      ellipse(x, y, dotSize, dotSize);
    }
  }
}
