class Button {
  /*instance variables*/

  // position X of square button
  float rectanglePositionX;
  // position Y of square button
  float rectanglePositionY;
  // rectangle width
  int rectangleWidth;
  // rectangle height
  int rectangleHeight;
  //
  int radiiAllFourCorners, radiusTopLeft, radiusTopRight, radiusBottomRight, radiusBottomLeft;
  // 
  color rectangleColor;
  // color of rectangle when highlighted/mouseover
  color rectangleHighlightColor;
  // current color of rectangle
  color rectangleCurrentColor;
  // true of false is the rectangle highlighted ?
  boolean rectangleHoverOver = false;

  /*constructor*/
  /*following the format rect(x, y, w, h)*/
  /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight*/
  Button(float tempRectanglePositionX, float tempRectanglePositionY, int tempRectanlgeWidth, int tempRectanlgeHeight, color tempRectangleColor) {

    // assign localVaraibles from contructor to gloabl variables

    rectanglePositionX = tempRectanglePositionX; // temporary positon X assigned to position X

    rectanglePositionX = tempRectanglePositionY; // temporary positon X assigned to position Y

    rectangleWidth = tempRectanlgeWidth; // temporary rectangle width assigned to rectangle width

    rectangleHeight = tempRectanlgeHeight; // temporary rectangle height assigned to rectangle height

    rectangleColor = tempRectangleColor; // temporary rectangle colour assigned to rectangle colour
  }

  /*following the format rect(x, y, w, h, r)*/
  /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight, r = radii for all four corners */
  Button(float tempRectanglePositionX, float tempRectanglePositionY, int tempRectanlgeWidth, int tempRectanlgeHeight, float radiiAllFourCorners, color tempRectangleColor) {
    
    // assign localVaraibles from contructor to gloabl variables

    rectanglePositionX = tempRectanglePositionX; // temporary positon X assigned to position X

    rectanglePositionX = tempRectanglePositionY; // temporary positon X assigned to position Y

    rectangleWidth = tempRectanlgeWidth; // temporary rectangle width assigned to rectangle width

    rectangleHeight = tempRectanlgeHeight; // temporary rectangle height assigned to rectangle height

    rectangleColor = tempRectangleColor; // temporary rectangle colour assigned to rectangle colour
  }

  /*following the format rect(x, y, w, h, t1, tr, br, b1)*/
  /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight, t1 = radius for top-left corner, tr = radius for top-right corner, br =  radius for bottom-right corner , b1 =  radius for top-left corner */
  Button(float tempRectanglePositionX, float tempRectanglePositionY, int tempRectanlgeWidth, int tempRectanlgeHeight, float radiusTopLeft, float radiusTopRight, float radiusBottomRight, float radiusBottomLeft, color tempRectangleColor) {
    
    // assign localVaraibles from contructor to gloabl variables

    rectanglePositionX = tempRectanglePositionX; // temporary positon X assigned to position X

    rectanglePositionX = tempRectanglePositionY; // temporary positon X assigned to position Y

    rectangleWidth = tempRectanlgeWidth; // temporary rectangle width assigned to rectangle width

    rectangleHeight = tempRectanlgeHeight; // temporary rectangle height assigned to rectangle height

    rectangleColor = tempRectangleColor; // temporary rectangle colour assigned to rectangle colour
  
  }


  /*methods*/
  void drawRectangleButton () {
    // fill rectangle with color passed by reference in constructor
    fill(rectangleColor);
    // draw rectangle based on references passed in constructor
    /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight*/
    /*rect(x, y, w, h)*/
    rect(rectanglePositionX, rectanglePositionY, rectangleWidth, rectangleHeight);
    /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight, r = all four corners*/
    /*rect(a, b, c, d, r)*/
    rect(rectanglePositionX, rectanglePositionY, rectangleWidth, rectangleHeight, radiiAllFourCorners);
    fill(rectangleColor);
    /* x = rectanglePositionX, y = rectanglePositionY, w = rectanlgeWidth, h = rectanlgeHeight, tl = radius top-left corner, tr = radius top-right corner, br = radius bottom-right corner, bl = radius bottom-left corner*/
    /*rect(a, b, c, d, t1, tr, br, b1)*/
    rect(rectanglePositionX, rectanglePositionY, rectangleWidth, rectangleHeight, radiusTopLeft, radiusTopRight, radiusBottomRight, radiusBottomLeft);
  }
}// end button class

