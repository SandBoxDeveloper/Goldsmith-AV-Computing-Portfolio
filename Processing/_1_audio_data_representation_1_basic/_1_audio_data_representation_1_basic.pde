// Andre Hitchman
// based on representation exercises

AudioThread audioThread;
 
void setup() {
  size(500,400, P2D);
// Create the AudioThread object, which will connect to the audio 
// interface and get it ready to use
  audioThread = new AudioThread();
// Start the audioThread, which will cause it to continually call 'getAudioOut' (see below)
  audioThread.start();
}
 
void draw() {
  background(255);
  fill(0);
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
  for (int i=0;i<buffer.length; i++){
    // generate white noise
    buffer[i] = random(-0.8, 0.8); // changing the random floats alters the sound
                                   // the higher the it is, the louder the sound
  }
}
 
