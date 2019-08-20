Mover[] movers = new Mover[10];

PVector acceleration;

void setup() {
  size(640, 420);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(255);
  
  for (int i = 0; i < movers.length; i++) {
  
  PVector mouse = new PVector(mouseX, mouseY);
  PVector dir = mouse.subStat(movers[i].location);
  
  float d = dir.mag();
  
  dir.norm();
  
  dir. mult(0.5);
  
  movers[i].accelerate(dir);
  
  movers[i].update();
  movers[i].limit(8);
  movers[i].checkEdges();
  movers[i].display();
  }
}