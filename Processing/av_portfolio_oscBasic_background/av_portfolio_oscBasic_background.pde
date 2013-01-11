// Andre Hitchman
// this sketch using OSC to send message from an external device to manupulate
// the color of the backgroud of this sketch
// I used charlie robert'ss control (OSC + MIDI) app on my IPAD to control the sketch
// to download go to http://itunes.apple.com/gb/app/control-osc-+-midi/id413224747?mt=8


import oscP5.*;
import netP5.*;

// new OSCP5 type
OscP5 osc;



void setup () {
  size(500, 500);
  osc = new OscP5(this, 10000);// number of port where we are reciving messages
  // recieving message from the accelerometer of the OSC device preface screen
  osc.plug(this, "shake", "/accelerometer"); // everytime you recieve this message, excute this function
}

// not needed
void draw () {
}

void shake(float x, float y, float z) { // smartphone is recieving these three variables
  println(z);
  // change background based on three parameters recieved from osc message
  background(x * 2, y * 2, z * 2);
}

//done everytime we are reciving a message
//void oscEvent(OscMessage me) {
//  println(me.addrPattern() + " , " + me.typetag());
//}
