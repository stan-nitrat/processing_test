class PVector {
  
  float x;
  float y;
  
  
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
    
  }
  
  PVector() {
    x = random(2) - 1;
    y = random(2) - 1;
    norm();
  }
  
  void add(PVector v) {
    y = y + v.y;
    x = x + v.x;
  }
  
  void sub(PVector v) {
    y = y - v.y;
    x = x - v.x;
  }
  
  void mult(float f) {
    x = x * f;
    y = y * f;
  }
  
  void div(float f) {
    x = x / f;
    y = y / f;
  }
  
  float mag() {
    return (sqrt(x*x + y*y));
  }
  
  void norm() {
    float m = mag();
    if (m!=0) {
      div(m);
    }
  }
  
  void limit(float max) {
    if(mag() > max) {
      norm();
      mult(max);
    }
  }
  
}