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
    
    int choiceX;
    int choiceY;
    
    int rX = int(random(100));
    int rY = int(random(100));
    
    if (rX < 20) {
      choiceX = 0;
    } else if (rX < 40) {
      choiceX = 1;
    } else if (rX < 60) {
      choiceX = -1;
    } else {
       if (mouseX > x) {
         choiceX = 1;
       } else if (mouseX == x) {
         choiceX = 0;
       } else {
         choiceX = -1;
       }
           
    }
    
    if (rY < 20) {
      choiceY = 0;
    } else if (rY < 40) {
      choiceY = 1;
    } else if (rY < 60) {
      choiceY = -1;
    } else {
       if (mouseY > y) {
         choiceY = 1;
       } else if (mouseY == y) {
         choiceY = 0;
       } else {
         choiceY = -1;
       }
           
    }
    
    x = x + choiceX;
    y = y + choiceY;
  }
}