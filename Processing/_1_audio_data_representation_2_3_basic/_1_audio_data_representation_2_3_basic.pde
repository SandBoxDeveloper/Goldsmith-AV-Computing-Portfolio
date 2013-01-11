// Andre Hitchman
// based on representation exercises

Radio[] buttons = new Radio[2];

AudioThread audioThread;
// we'll use this to store the audio data we read from the audio file
float[] audioData;
// we'll use this to remember our position in the audio data array
int readHead;

AudioThread audioTreadNew1;
float readHead2;
float[] audioData2;

AudioThread audioTreadNew2;
float readHead3;
float[] audioData3;



void setup() {
  size(500,400, P2D);
  buttons[0] = new Radio(33, 50, 30, color(255, 0, 0), color(0, 255, 0), 0, buttons);
  
  // the audio file we want to play, which should be in the data dir
  String audioFilename = "myk_hats_dub1.wav";
  String audioFilename2 = "Doumbek-Tek.wav";
  String audioFilename3 = "wah_fuzz.wav";
  // read the audio data into a float array using the AudioFileIn class
  audioData = new AudioFileIn(audioFilename, this).getSampleData();
  // new audio files imported
  audioData2 = new AudioFileIn(audioFilename2, this).getSampleData();
  audioData3 = new AudioFileIn(audioFilename3, this).getSampleData();
  // print how many samples we read
  println("Read "+audioData.length+" samples");
  // set the read head to zero, the first sample
  readHead = 0;
  // set the read head to zero, the addtional samples
  readHead2 = 0;
  readHead3 = 0;
  // start up the audio thread
  audioThread = new AudioThread();
  audioThread.start();
  
}
 
void draw() {
  background(255);
  fill(0);
  buttons[0].display();
 
}

void mousePressed() {
 buttons[0].press(mouseX, mouseY);
 println("ouch!");
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
    // copy data from the audio we read from the file (audioData)
    // into the buffer that gets sent to the sound card
    // to play mutiple sounds at once feed buffer with data from audios
    // casting is required to convert array audio data from a float to an int
    buffer[i] = audioData[(int)readHead] + audioData2[(int)readHead2] + audioData3[(int)readHead3];
    // move the read head along one, resetting to zero
    // if it goes to the end of the audioData array
    readHead ++;
    if (readHead >= audioData.length){
      readHead = 0;
    }
    
    readHead2 = (readHead + 1) % audioData.length * 2;
    if (readHead2 >= audioData2.length){ // second sound
      readHead2 = 0;
    }
    
    readHead3 = (readHead + 1) % audioData.length * 1.1;
    if (readHead >= audioData3.length){ // third sound
      readHead3 = 0;
    }
    
    // or do it the clever way with the modulo operator
    //readHead = (readHead + 1) % audioData.length;
  }
}
