void GUI () {
//------------------------
// YOU WON DISPLAY
//------------------------
if(youWon == true) {
  background(255);
  fill(0, 129, 0, 50);
  textAlign(CENTER); // align text center
  textSize(40); // set font to 40 
  // this message prompts the user 
  text("YOU'VE WON!", (width/2), (height/2)); // display message
  text("YOUR SCORE WAS ", (width/2), (height/2 + 50));
  
}

//------------------------
// GAME OVER DISPLAY
//------------------------
if(gameOver == true) {
  background(255);
  fill(0, 129, 0, 50);
  textAlign(CENTER); 
  textSize(40); 
  text("GAME OVER!", (width/2), (height/2)); 
  textSize(20);
  text("Do you wish to play again?, press R to restart !", (width/ 2), 400); // display message
}

//------------------------
// GAME PAUSED DISPLAY
//------------------------
if(gamePaused == true) {
  background(255);
  fill(0, 129, 0, 50);
  textAlign(CENTER); // align text center
  textSize(40); // set font to 40 
  // this message prompts the user 
  text("GAME PAUSED", (width/2), (height/2)); // display message
  text("Press C to resume game", (width/2), (height/2 + 50));
  text("Press R to restart game", (width/2), (height/2) + 90);
}

}
