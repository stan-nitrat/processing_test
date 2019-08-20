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
  
  PVector addStat(PVector v) {
    PVector result = new PVector(x + v.x, y + v.y);
    return result;
  }
  
  void sub(PVector v) {
    y = y - v.y;
    x = x - v.x;
  }
  
  PVector subStat(PVector v) {
     PVector result = new PVector(x - v.x, y - v.y);
     return result;
  }
  
  void mult(float f) {
    x = x * f;
    y = y * f;
  }
  
  PVector multStat(float f) {
    PVector result = new PVector(x * f, y * f);
    return(result);
  }
  
  void div(float f) {
    x = x / f;
    y = y / f;
  }
  
  PVector divStat(float f) {
    PVector result = new PVector(x / f, y / f);
    return(result);
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
  
  PVector copy() {
     PVector newv = new PVector(x, y);
     return newv;
  }
  
}