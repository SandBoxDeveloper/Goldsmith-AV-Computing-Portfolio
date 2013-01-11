class Mcharacter {
  
  int chartX;
  int chartY;
  float chartSpeed;
  PVector chartVect1, chartVect2;
  PImage chart = loadImage("robot.png");
  
  Mcharacter () {
    // where character starts off on the screen
    chartX = width/2;
    chartY = width/2;
    chartSpeed = 9;
  }
  
  void drawChart () {
    image(chart, -chart.width/2, -chart.height/2);
  }
}
