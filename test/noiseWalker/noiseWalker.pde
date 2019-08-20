Walker w;

void setup() {
  size(640,360);
  w = new Walker();
  background(255);
}

void draw() {
  w.Step();
  w.Display();
}

class Walker {
  float x, y;
  float tx, ty;
  
  Walker() {
     tx = 0;
     ty = 10000;
  }
  
  void Step() {
    x = map(noise(tx), 0, 1, 0, width);
    y = map(noise(ty), 0, 1, 0, height);
    
    if (x < 0)
    {
      x = 0;
    } 
    else if (x > width)
    {
      x = width;
    }
    
    if (y < 0)
    {
      y = 0;
    }
    else if (y > height)
    {
      y = height;
    }
    
    tx += 0.01;
    ty += 0.01;
  }
  
  void Display() {
    background(255);
    noStroke();
    fill(255,100,50,200);
    ellipse(x,y,20,20);
  }
  
}