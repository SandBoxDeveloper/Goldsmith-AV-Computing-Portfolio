// Andre Hitchman
// sketch based on presentation presented in labs that wos originally produced
// using the minim library
// to select album covers which on mouse pressed
// will play the associated sound.
// I attempted to reproduce the sketch in matthew's audioplay code
// promblems that i encountered was clipping noise when playing multiple sounds
// and contiouios play back
// of the different sounds
// as i dont know how to pause a sound


AudioThread audioThread0;
AudioThread audioThread1;
AudioThread audioThread2;
AudioThread audioThread3;
// we'll use this to store the audio data we read from the audio file
float[] audioData0;
float[] audioData1;
float[] audioData2;
float[] audioData3;
// we'll use this to remember our position in the audio data array
int readHead0;
int readHead1;
int readHead2;
int readHead3;
// music cover images
PImage untrue;
PImage rangers;
PImage jdilla;
PImage machinedrum;


void setup() {
  size(660,220, P2D);
  // load cover images
  untrue = loadImage("untrue.jpg");
  rangers = loadImage("rangers.jpg");
  jdilla = loadImage("jdilla.jpg");
  // the audio file we want to play, which should be in the data dir
  String audioFilename0 = "strings.wav";
  String audioFilename1 = "tralala.wav";
  String audioFilename2 = "seb.wav";
  //String audioFilename3 = "machinedrum.mp3";
  // read the audio data into a float array using the AudioFileIn class
  audioData0 = new AudioFileIn(audioFilename0, this).getSampleData();
  audioData1 = new AudioFileIn(audioFilename1, this).getSampleData();
  audioData2 = new AudioFileIn(audioFilename2, this).getSampleData();
 //audioData3 = new AudioFileIn(audioFilename3, this).getSampleData();
  // print how many samples we read
  println("Read "+audioData0.length+" samples");
  // set the read head to zero, the first sample
  readHead0 = 0;
  readHead1 = 0;
  readHead2 = 0;
  readHead3 = 0;
  // start up the audio thread
  
  
}
 
void draw() {
  background(255);
  fill(0);
  // display images
  image(untrue, 0, 0);
  image(rangers, 220, 0);
  image(jdilla, 440, 0);
  if(mousePressed) {
  audioThread0 = new AudioThread();
  audioThread0.start();
  println("check");
  }
 
  
}

// this function gets called when you press the escape key in the sketch
void stop(){
  // tell the audio to stop
  audioThread0.quit();
  // call the version of stop defined in our parent class, in case it does anything vital
  super.stop();
}


// this gets called by the audio thread when it wants some audio
// we should fill the sent buffer with the audio we want to send to the 
// audio output
void generateAudioOut(float[] buffer){
  for (int i=0;i<buffer.length; i++){
    // copy data from the audio we read from the file (audioData)
    // into the buffer that gets sent to the sound card
    buffer[i] = audioData0[readHead0];
    // move the read head along one, resetting to zero
    // if it goes to the end of the audioData array
    readHead0 ++;
    if (readHead0 >= audioData0.length){
      readHead0 = 0;
      
         if(keyCode == UP) {
           println("stopping");
   stop();
  }
    }
    // or do it the clever way with the modulo operator
    //readHead = (readHead + 1) % audioData.length;
  }
}



