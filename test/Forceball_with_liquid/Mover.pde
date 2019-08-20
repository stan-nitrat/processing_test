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
    fill(200);
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
  
  /*void checkEdges() {
    if (location.x > width - radius) {
      PVector repel = new PVector(2, 0);
      repel.mult(location.x - (width - radius));
      applyForce(repel);
    } else if (location.x < radius) {
      PVector repel = new PVector(2, 0);
      repel.mult(radius - location.x);
      applyForce(repel);
    }
    if (location.y > height - radius) {
      PVector repel = new PVector(0, -2);
      repel.mult(location.y - (height - radius));
      applyForce(repel);
    } else if (location.y < radius) {
      PVector repel = new PVector(0, 2);
      repel.mult(radius - location.y);
      applyForce(repel);
    }    
  }*/
  
  void accelerate(PVector _a){
    acceleration = _a;
  }
  
  void applyForce(PVector _f){
    acceleration.add(_f.divStat(mass));
  }  
  void limit(float max) {
    velocity.limit(max); 
  }
  
  boolean isInside(Liquid l) {
    if (location.x > l.x && location.x <l.x + l.w && location.y>l.y && location.y<l.y+l.h) {
      return true;
    } else {
      return false;
    }
  }
  
  void drag(Liquid l) {
    PVector dForce = velocity.multStat(-1);
    float speed = velocity.mag();
    dForce.norm();
    dForce.mult(l.c * speed * speed * radius);
    
    applyForce(dForce);
  }
  
}