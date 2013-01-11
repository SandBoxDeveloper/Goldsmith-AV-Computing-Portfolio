class Panel {
  float panelWidth;
  float panelHeight;
  float panelX;
  float panelY;
  float space;
  float cbpX; //ChooseBrushPanel X
  float cbpY; //ChooseBrushPanel Y
  float cbpH; //ChooseBrushPanel Height
  float cbpW; //ChooseBrushPanel Width
  
  Panel(float screenW, float screenH){
    panelWidth = 50;
    panelHeight = 50;
    panelX = 0;
    panelY = screenH;
    cbpX = screenW;
    cbpY = panelY-panelHeight;
    cbpW = panelWidth;
    cbpH = panelHeight;
  }// Panel
  
  void currentBrush(int state, color c){
    rectMode(CORNER);
    strokeWeight(2);
    stroke(255);
    fill(0);
    rect(0, panelY-panelHeight, panelWidth, panelHeight);// Cell
    // check the state and draw a fiqure
    rectMode(CENTER);
    if(state == 1){// point
    strokeWeight(10);
    stroke(c);
    point(panelWidth/2, panelY-panelHeight/2);
    }
    else if (state == 2){// sqaure
    rectMode(CENTER);
    fill(c);
    stroke(c);
    strokeWeight(1);
    rect(25, panelY-panelHeight/2, 20, 20);
    }
    else if (state == 3){// triangle
    rectMode(CENTER);
    fill(c);
    stroke(c);
    strokeWeight(0);
    triangle(panelX+panelWidth/2, panelY-panelHeight/2-15,
      panelX+panelWidth/2-15, panelY-panelHeight/2+15,
      panelX+panelWidth/2+15, panelY-panelHeight/2+15);
    }
    else if (state == 4){// rectangle
    rectMode(CENTER);
    fill(c);
    stroke(c);
    strokeWeight(0);
    rect(25, panelY-panelHeight/2, 20, 5);
    }
    else if (state == 5){// eraser
      //rectMode(CENTER);
      //fill(c);
      stroke(129);
      line(0+space, panelY-panelHeight+space, panelWidth-space, panelY-space);
      line(panelWidth-space, panelY-panelHeight+space, 0+space, panelY-space);
    }
    
    
  } 



void chooseBrushPanel(int state){
  // if user chooses circle brush
  if (state == BRUSH_CIRCLE){
    fill(150, 200, 110);// lime green
  }
  else { 
    fill(0);
  }
  stroke(255);
  strokeWeight(3);
  rectMode(CORNER);
  rect(cbpX-cbpW, cbpY, cbpW, cbpH);// brushcell
  fill(150, 100, 200); //purple
  strokeWeight(10);
  stroke(255);
  point(cbpX-cbpW/2, cbpY+cbpH/2);
  
  // if user chooses square brush
  if (state == BRUSH_SQUARE){
    fill(150, 200, 110);// lime green
  }
  else {
    fill(0);
  }
     stroke(255); //cellstroke
     strokeWeight(3);
     rectMode(CORNER);
     rect(cbpX-cbpW*2, cbpY, cbpW, cbpH);//brushCell
     fill(255,255,255); //colour: white
     noStroke();
     rectMode(CENTER);
     rect(cbpX-cbpW-cbpW/2, cbpY+cbpH/2, 20, 20);
  
  
  // if user chooses triangle brush
  if (state == BRUSH_TRIANGLE){
    fill(150, 200, 110);// lime green
  }
  else {
    fill(0);
  }
     stroke(255); //cellstroke
      strokeWeight(3);
      rectMode(CORNER);
      rect(cbpX-cbpW*3, cbpY, cbpW, cbpH);//brushCell
      fill(255,255,255); //colour: white
      noStroke();
      rectMode(CENTER);
      triangle((cbpX-cbpW*2-cbpW/2), (cbpY+cbpH/2)-10,
              (cbpX-cbpW*2-cbpW/2)-10, (cbpY+cbpH/2)+10,
              (cbpX-cbpW*2-cbpW/2)+10, (cbpY+cbpH/2)+10);
  
  
  // if user chooses rectangle brush
  if (state == BRUSH_RECTANGLE){
    fill(150, 200, 110);// lime green
  }
  else{
    fill(0);
  }
     stroke(255); //cellstroke
     strokeWeight(3);
     rectMode(CORNER);
     rect(cbpX-cbpW*4, cbpY, cbpW, cbpH);//brushCell
     fill(255,255,255); //colour: white
     noStroke();
     rectMode(CENTER);
     rect(cbpX-cbpW*4+cbpW/2, cbpY+cbpH/2, 20, 5);
  
  
  // if user chooses eraser brush
  if (state == BRUSH_ERASER){
    fill(150, 200, 110);// lime green
  }
  else {
    fill(0);
  }
      stroke(255); //cellstroke
      strokeWeight(3);
      rectMode(CORNER);
      rect(cbpX-cbpW*5, cbpY, cbpW, cbpH);//brushCell
      stroke(255, 255, 255); //colour: white
      strokeWeight(2);
      line(cbpX-cbpW*5+space, cbpY+cbpH-space, //left-bottom
           cbpX-cbpW*5+cbpW-space, cbpY+space); //left-top
      line(cbpX-cbpW*5+cbpW-space, cbpY+cbpH-space, //right-bottom
           cbpX-cbpW*5+space, cbpY+space); //right-top
       
}// chooseBrushPanel

}
