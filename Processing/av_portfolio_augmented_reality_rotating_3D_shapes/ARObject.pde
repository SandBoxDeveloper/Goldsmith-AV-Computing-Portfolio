// class that defines the AROBject, both the AR detection and display are handled inside this class
class ARObject {
  int ID; // keep track of the current the ID of the object (corresponds with the ID i of the marker)
  PVector rot, speed; // in this example the cube has a certain rotation and rotates at a certain speed

    ARObject(int ID) {
    this.ID = ID; // set the ID
    rot = new PVector(random(TWO_PI), random(TWO_PI), random(TWO_PI)); // random x, y, z rotation
    speed = new PVector(random(-mS, mS), random(-mS, mS), random(-mS, mS)); // random x, y, z speed (within maxSpeed boundaries)
  }

  void run() {
    // always keep rotating (even when the marker is NOT detected)
    rot.add(speed);
    // checks the object's corresponding marker through the ID
    // if the marker is found, display the cube
    if (nya.isExistMarker(ID)) { 
      display();
    }
  }

  // the display in this example shows a colored, rotating RGBCube
  void display () {
    // get the Matrix for this marker and use it (through setMatrix)
    setMatrix(nya.getMarkerMatrix(ID));
    scale(1, -1); // turn things upside down to work intuitively for Processing users


    fill(0, 100, 129, 200);
    lights(); // turn on the lights! add shadows to 3d object to make look more 3D

    pushMatrix();
    // hover box above above the real-world marker image
    translate(0, 0, 30);
    // rotate on Y axis based on frame count
    rotateY(radians(frameCount));
     // rotate on X axis based on frame count
    rotateX(radians(frameCount));
    // rotate on Z axis based on frame count
    rotateZ(radians(frameCount));
    // draw box
    box(20);
    popMatrix();


    pushMatrix();
    //  translate((width/6) * 2, height/2, 40);
    translate(70, 0, 30);
    // rotate on Y axis based on frame count
    rotateY(radians(frameCount));
    // rotate on X axis based on frame count
    rotateX(radians(frameCount));
    // rotate on Z axis based on frame count
    rotateZ(radians(frameCount));
    // draw box
    box(30, 40, 100);
    popMatrix();


    noLights(); // i dont want shadow like effect on these
    pushMatrix();
    translate(140, 0, 30);
    // rotate on Y axis based on frame count
    rotateY(radians(frameCount));
    // rotate on X axis based on frame count
    rotateX(radians(frameCount));
    // rotate on Z axis based on frame count
    rotateZ(radians(frameCount));
    sphereDetail(30);
    // draw sphere
    sphere(20);
    popMatrix();


    pushMatrix();
   
    translate(210, 0, 30);
    // rotate on Y axis based on frame count
    rotateY(radians(frameCount));
    // rotate on X axis based on frame count
    rotateX(radians(frameCount));
    // rotate on Z axis based on frame count
    rotateZ(radians(frameCount));
    // adds detail to sphere by adjusting num vertices of sphere
    sphereDetail(6, 18); // formate(longitudinally detail, latitudinally detail)
    // draw sphere
    sphere(20);
    popMatrix();
  }
}

