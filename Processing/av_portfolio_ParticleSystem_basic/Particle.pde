
/*
 *  This class represents an individual particle within a particle system
 *
 *  It is a parameterized class in which different parameters control the behaviour of the class
 */

class Particle
{
   /*
    * These are the parameters that control the behaviour and appearance of the particle
    */ 
   PVector position; // position changes change over time
   PVector velocity; // velocity changes over time
   int size = 1; // size stays constant
   // damping
   float damping = 0.05; // should be set low overwise particles wll grid to a halt very quickly
   
   // This is an additional variable which tracks whether the particle 
   // should be kept in existance or it should be removed
   boolean alive;
  
    // the constructor doesn't set the parameters as there would be too many
    // they should be set separately on creation 
    Particle()
    {
      alive = true;
    }
    
    // This updates the position of the particle 
    // and manages its behaviour
    void update(float deltaTime)
    {
      // update the position based on the velocity
      // multiply velocity(change in speed in a given direction) to deltaTime(change in time)
      // add this result to PVector position
      position.add(PVector.mult(velocity, deltaTime));
      
      // add gravity (which is a global variable, not a class variable
      // this stores the result into velocity y component,
      // add damping
      // this reduces the velocity
      velocity.mult(1.0 - damping*deltaTime);
      velocity.y += gravity*deltaTime;
      
      
      // if the particle goes off screen, kill it
      if(position.x < 0 || position.x > width)
        alive = false; // kill
      if(position.y < 0 || position.y > height)
        alive = false; // kill
      
    }
    
    // this draws the graphical appearance of the particle
    // you can change this method to make it look different
    void draw()
    {
      if(!alive) // if not alive(dead = false)
        return;
      
      // use push style to apply a particular visual style to 
      // the particle and only the particle
      // (it works like pushMatrix but for style commands
      // like stroke and fill)
      // this function saves the current style settings
      // pushStyle() & popStyle() are always used together
      // one to save and one to revert
      pushStyle(); // start a new style
      ellipseMode(CENTER);
      
      // translate the particle to its position and draw it
      pushMatrix();
      translate(position.x, position.y);
      ellipse(0, 0, size, size);
      popMatrix();
      
      popStyle();// restore the prior settings
    }
  
}
