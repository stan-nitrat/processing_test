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
  int x;
  int y;
  
  Walker() {
    x = width/2;
    y = height/2;
  }
  
  void Display() {
    stroke(0);
    point(x,y);
  }
  
  void Step() {
    //int choiceX = int(random(3))-1;
    //int choiceY = int(random(3))-1;
  
    float dx = 5*(float) randomGaussian(); 
    float dy = 5*(float) randomGaussian();
    
    float xNew = 0;
    float yNew = 0;
    
    if (x + dx < 0)
    {
      xNew = 0; 
    }
    else if (x + dx > width)
    {
      xNew = width;
    }
    else
    {
      xNew = x + dx;
    }
    
    if (y + dy < 0)
    {
      yNew = 0; 
    }
    else if (y + dy > height)
    {
      yNew = height;
    }
    else
    {
      yNew = y + dy;
    }
    
    line(x, y, xNew, yNew);
    
    x = (int)xNew;
    y = (int)yNew;
  }
}