class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int radius;
  
  Mover() {
    location = new PVector(radius + random(width - radius), radius + random(height - radius));
    velocity = new PVector(random(-2,2),random(-2,2));
    acceleration = new PVector(0, 0);
    radius = 20;
  }
  
  Mover(float _x, float _y, float _vx, float _vy, float _ax, float _ay)
  {
    location = new PVector(_x, _y);
    velocity = new PVector(_vx, _vy);
    acceleration = new PVector(_ax, _ay);
    radius = 20;
  }
  
  void update() {
    location.add(velocity);
    velocity.add(acceleration);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, radius, radius);
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = location.x - width;
    } else if (location.x < 0) {
      location.x = width + location.x;
    }
    
    if (location.y > height) {
      location.y = location.y - height;
    } else if (location.y < 0) {
      location.y = height + location.y;
    }
  }
  
  void accelerate(PVector _a){
    acceleration = _a;
  }
  
  void limit(float max) {
    velocity.limit(max); 
  }
  
}