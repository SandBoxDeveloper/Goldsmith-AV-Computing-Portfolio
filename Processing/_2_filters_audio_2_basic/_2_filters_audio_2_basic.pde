// Andre Hitchman
// based on filters and transformation exercises
// move mouse horizontalling across the screen for audio and visual effect

AudioThread audioThread;
// we'll use this to store the audio data we read from the audio file
float[] audioData;
// delay line array
float [] delayLine;
// we'll use this to remember our position in the audio data array in the main audio buffer
int readHead;
// read and write postions on the delay line
int delayReadHead, delayWriteHead;
// the size of the delay line
int maxDelayTime;


void setup() {
  size(500, 400, P2D);
  // the audio file we want to play, which should be in the data dir
  String audioFilename = "myk_hats_dub1.wav";
  // read the audio data into a float array using the AudioFileIn class
  audioData = new AudioFileIn(audioFilename, this).getSampleData();
  // maxDelayTime initializsed in setup
  maxDelayTime = 22050;
  // DelayLine initializsed in setup
  delayLine = new float[maxDelayTime];
  // start writing to head at the start
  delayWriteHead = 0;
  // start reading from the end 
  // maximum delay
  delayReadHead = maxDelayTime - 1;
  // set the read head to zero, the first sample
  readHead = 0; 
  // print how many samples we read
  println("Read "+audioData.length+" samples");
  // set the read head to zero, the first sample
  // start up the audio thread
  audioThread = new AudioThread();
  audioThread.start();
  
}
 
void draw() {
  background(255);
  fill(0);
  printMouse();
  toggle();
  //feedback();
}

// this function gets called when you press the escape key in the sketch
void stop(){
  // tell the audio to stop
  audioThread.quit();
  // call the version of stop defined in our parent class, in case it does anything vital
  super.stop();
}


// this gets called by the audio thread when it wants some audio
// we should fill the sent buffer with the audio we want to send to the 
// audio output
void generateAudioOut(float[] buffer){
  float delayTimeF;
  int delayTime;
  for (int i = 0; i < buffer.length; i++){
    if (pmouseX != mouseX) {
      // user moved the mouse, update the delay time
      delayTimeF = (float)mouseX/ (float)width * (float) maxDelayTime;
      // cast to an int needed
      delayTime = (int)delayTimeF;
      if (delayWriteHead - delayTime < 0) {
        // wrap round to the end
        delayReadHead = maxDelayTime - delayTime + delayWriteHead;
      }
      else {
        delayReadHead = delayWriteHead - delayTime;
      }
    }
    // write into the delayLine
    delayLine[delayWriteHead] = audioData[readHead];
    // write the original signal to the buffer
    buffer[i] = audioData[readHead];
    // write the delayed signal to the buffer
    buffer[i] += delayLine[delayReadHead];
    // now move the various read and write heads
    delayWriteHead = (delayWriteHead + 1) % delayLine.length;
    delayReadHead = (delayReadHead + 1) % delayLine.length;
    readHead = (readHead + 1) % audioData.length;
    }
  }
  
  void printMouse () {
    println("current mouseX position is " +mouseX);
   
  }
  
  void toggle() {
    
     if(mouseX <= 100) {
       background(255, 0, 0);
      }
      
      if (mouseX >= width/2) {
        background(0, 255, 0);
      }
      
      if (mouseX >= 400) {
        background(0, 0, 255);
      }
  }
  
     

  
//  void feedback () {
//    if(delayWriteHead - delayTime < 0) {
//      println("wrapping round to the end");
//    } 
//  }

