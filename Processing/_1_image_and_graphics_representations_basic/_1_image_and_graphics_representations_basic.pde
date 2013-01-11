// Andre Hitchman
// based on filters and transformation exercises

import processing.opengl.*; // 3D rendering library
PImage graphic;
PVector vertex1, vertex2, vertex3, vertex4;// to store each vertex coordinate
PVector position; // to store the position of the shape

void setup () {
  size(500, 500, OPENGL); // add a call to 3D renderer to create in 3D
  graphic = loadImage("Facebook-Like.jpg");
  // NORMALIZED maps out using only 1's & 0's
  // IMAGE mode would better scale you image is you know its dimensions
  textureMode(NORMALIZED); // default mode is image
  
  // intialsing each PVector variable with a position
  // this allows me to alter vertices easier
  vertex1 = new PVector(100, 100);
  vertex2 = new PVector(100, 400); // 100 = x-axis, 400 = y-axis
  vertex3 = new PVector(400, 400);
  vertex4 = new PVector(400, 100);
  position = new PVector(100, 100); // shift whole image 100 across, 100 down
}

void draw () {
  //image(graphic, 0, 0);
  beginShape(); // starting drawing shape
  
  //texture must be called before any calls to vertex(); and beginShape();
  texture(graphic); // sets texture to be applied to PImage = graphic
  
  //this draws a square using coordinate system
    PVector vertex1new = PVector.add(position, vertex1); // add the position vector to vertex 1 (x components = (100 + 100 = 200) & y component = (100 + 100 = 200)) 
    vertex(vertex1new.x, vertex1new.y, 0, 0); // added 2 extra coordinates to each vertex to get texture effect
    
    PVector vertex2new = PVector.add(position, vertex2); // new position = (x component is 100 + 100 & y component is 100 + 400)
    vertex(vertex2new.x, vertex2new.y, 0, 1); // call new x and y components
    
    PVector vertex3new = PVector.add(position, vertex3);
    vertex(vertex3new.x, vertex3new.y, 1, 1); // to access the x & y components use the dot method
    
    PVector vertex4new = PVector.add(position, vertex4);
    vertex(vertex4new.x, vertex4new.y, 1, 0);
    
  // CLOSE is needed to connect to last vertex to the first vertex
  endShape(CLOSE); // ending drawn shape
}
