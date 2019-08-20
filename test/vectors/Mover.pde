class Mover {
  PVector location;
  PVector velocity;
  int radius;
  
  Mover() {
    location = new PVector(radius + random(width - radius), radius + random(height - radius));
    velocity = new PVector(random(-2,2),random(-2,2));
  }
  
  void update() {
    location.add(velocity);
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
  
}