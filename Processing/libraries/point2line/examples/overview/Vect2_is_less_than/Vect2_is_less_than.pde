/**
*  using isLessThan() to test is the mouse is hovering circle.
*  this method is faster than a regular distance check.
*/

import point2line.*;

Vect2 mouse;
Vect2 center;
float radius, diameter;

void setup(){
  size( 200, 200 );
  smooth();
  
  mouse = new Vect2();
  center = new Vect2( width*0.5, height*0.5 );
  radius = width * 0.4;
  diameter = radius * 2;
}

void draw()
{
  // test for hover //
  mouse.set( mouseX, mouseY );
  mouse.subtract( center );
  boolean isHovering = mouse.isLessThan( radius );

  // display //
  background( 0 );
  if( isHovering ) fill( 0, 255, 0 );
   else fill( 255, 0, 0 );
  ellipse( center.x, center.y, diameter, diameter );
}
