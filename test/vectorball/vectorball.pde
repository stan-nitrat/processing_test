PVector location;
PVector velocity;

float radius;

void setup() {
  size(640, 480);
  location = new PVector(320, 240);
  velocity = new PVector(2.0, 3.0);
  radius = 30;
}

void iterate() {
  location.add(velocity);
  
  if ((location.x > width - radius) || (location.x < radius)) {
    velocity.x = velocity.x * -1;  
  }

  if ((location.y > height - radius) || (location.y < radius)) {
    velocity.y = velocity.y * -1;
  }
  
}

void draw() {
 background(255);
 
 iterate();
 
 stroke(0);
 fill(175);
 ellipse(location.x, location.y, radius, radius);
 
 
}