class Timer {
  /*instance variables*/
  
  int timerStarted;
  int timerDuration;
  
   /*contructor*/
   Timer(int tempTimerDuration) {
     timerDuration = tempTimerDuration;
   }
  
  /*methods*/
  void startTimerEvent () {
    // timer starts based on the number of milliseconds since starting the game
    // milliseconds = 1000 seconds
    timerStarted = millis();
  }
  
  boolean timerIsFinished () {
    // calculate time passed  = current time - start time
    int timePassed = millis() - timerStarted;
    
    // if the time passed is greater than or equal to the set duration of the game
    if (timePassed >= timerDuration) {
      // computer say 'yes'
      return true;
    }
    else {
      // otherwise computer say 'no'
      return false;
    }
  }
  
  
}
