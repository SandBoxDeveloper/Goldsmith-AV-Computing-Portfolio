/*
  NOTE THIS IS NOT A CLASS
  THIS IS JUST AN TAB THAT HOLDS THE METHODS 
  FOR UPDATING THE GAME STATE
*/
  

  
 
  /*methods*/
  
  // method to display end of game screen
  void gameOverScreen () {
    // fill background
    fill(0, 129, 0, 50);
    textAlign(CENTER); // align text center
    textSize(40); // set font to 40 
    // this message prompts the user 
    text("GAME OVER!", (width/2), (height/2)); // display message 
    textSize(20);
    // this message prompt the user on what to do next
    text("Do you wish to play again?, press R to restart !", (width/ 2), 400); // display message
  }

