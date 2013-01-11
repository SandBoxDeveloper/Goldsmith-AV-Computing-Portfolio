Stock [] stocks = new Stock[6];
float totalW = 0;

PFont f;

void setup () {
  size(400, 200);
  f = createFont("Ariel", 16, true);
  
  // init stock name and values to display
  stocks[0] = new Stock("APPL", 501);
  stocks[1] = new Stock("ROMM", 8);
  stocks[2] = new Stock("NOKIA", 23);
  stocks[3] = new Stock("HP", 26);
  stocks[4] = new Stock("FB", 12);
  stocks[5] = new Stock("ZYN", 3);
  
  float x = 0;
  for(int i = 0; i < stocks.length; i++) {
    stocks[i].setX(x);
    x = x + (stocks[i].textW()); 
  }
  totalW = x;
}

void draw () {
  background(255);
  fill(0);
  
  // move and display quotes
  for (int i = 0; i < stocks.length; i++) {
    stocks[i].move();
    stocks[i].display();
  }
}
