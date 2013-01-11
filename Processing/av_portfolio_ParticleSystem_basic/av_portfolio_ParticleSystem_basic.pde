// Andre Hitchman
// Sketch based on particle system exercise

// importing the JAVA random library as it has more features than the proccesing one
import java.util.Random;
// keep track of the current time
float t = 0;

// The particles of the particle system are stored in an 
// ArrayList, which makes it easier to add and remove them 
// than a normal array
ArrayList particles;


// global parameters
float gravity = 4;
// probability of adding a new particle
float newParticleProbability = 0.4;
// mean and variance
float speedMean = 30.0;
float speedVariance = 20.0;
// play around with values
float angleMean = radians(5);
float angleVariance = radians(180);
// random object
Random rand;


void setup()
{
  size(640, 480);
  particles = new ArrayList();

  // random object initizalize
  // this is a random number generator
  rand = new Random();
}

// adds a new particle to the particle system and 
// sets it's parameters
void addParticle()
{
  
  float speed = speedVariance*((float)rand.nextGaussian()) + speedMean;
  float angle = angleVariance*((float)rand.nextGaussian()) + angleMean;
  Particle newParticle = new Particle();
  // change position with mouseX, mouseY
  // default width/2, height
  newParticle.position = new PVector(width/2, mouseX*((float)rand.nextGaussian()) + mouseX); // initialse postion in the middle of the sreen
  // newParticle.velocity = new PVector(0, -30); 
  // change -cos to + and sin to -
  newParticle.velocity = new PVector(sin(angle), -cos(angle));
  newParticle.velocity.mult(speed);
  newParticle.size = 3;
  particles.add(newParticle); //updates particle arraylistwith new particles
}

void draw()
{
  background(255);

  // the change in time since last frame
  float newTime   = millis()/1000.0;
  float deltaTime = newTime - t;
  t = newTime;

  // go through each particle in turn updating and drawing it. 
  // at the end we check if alive has been set to false, if so 
  // we remove the particle
  // Notice how we are looping through the ArrayList backwards, this 
  // is because we are deleting elements from the list
  for (int i = particles.size()-1; i >= 0; i--) { // starts from the very enbd of the arraylist
    // An ArrayList doesn't know what it is storing so we have 
    // to cast the object coming out
    Particle p = (Particle) particles.get(i); //The get() method returns the element at the specified position in the list. 
    p.update(deltaTime);
    p.draw();
    if (!p.alive) {
      // Items can be deleted with remove()
      particles.remove(i);
    }
  } 


  //addParticle();
  if (rand.nextFloat() < newParticleProbability)
    addParticle();
}

