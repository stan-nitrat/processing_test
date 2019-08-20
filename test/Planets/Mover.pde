class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  float mass;
  
  Mover() {
    location = new PVector(radius + random(width - radius), radius + random(height - radius));
    velocity = new PVector(random(-2,2),random(-2,2));
    acceleration = new PVector(0, 0);
    radius = 20;
    mass = 10;
  }
  
  Mover(float _x, float _y, float _r, float _m) {
    location = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    radius = _r;
    mass = _m;
  }
  
  Mover(float _x, float _y, float _vx, float _vy, float _ax, float _ay)
  {
    location = new PVector(_x, _y);
    velocity = new PVector(_vx, _vy);
    acceleration = new PVector(_ax, _ay);
    radius = 20;
    mass = 10;
  }
  
  void update() {
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, radius*2, radius*2);
  }
  
  void checkEdges() {
    if (location.x > width - radius) {
      location.x = 2*(width - radius) - location.x;
      velocity.x = velocity.x * -1;
    } else if (location.x < radius) {
      location.x = 2*radius - location.x;
      velocity.x = velocity.x * -1;
    }
    
    if (location.y > height - radius) {
      location.y = 2*(height - radius) - location.y;
      velocity.y = velocity.y * -1;
    } else if (location.y < radius) {
      location.y = 2*radius - location.y;
      velocity.y = velocity.y * -1;
    }
  }
  
  void accelerate(PVector _a){
    acceleration = _a;
  }
  
  void applyForce(PVector _f){
    acceleration.add(_f.divStat(mass));
  }  
  void limit(float max) {
    velocity.limit(max); 
  }
  
}