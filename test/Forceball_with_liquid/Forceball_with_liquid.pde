Mover[] movers = new Mover[10];
float fc;
Liquid liquid;

PVector acceleration;

void setup() {
  size(640, 420);
  for (int i = 0; i < movers.length; i++) {
    float r = 5 + random(15);
    float m = r * r;
    float x = r + random(width - 2 * r);
    float y = r + random(width - 2 * r);
    movers[i] = new Mover(x, y, r, m);
  }
  fc = 0.1;
  
  liquid = new Liquid(0, height/2, width, height/2, 0.2);
}

void draw() {
  background(255);
  
  liquid.display();
  
  for (int i = 0; i < movers.length; i++) {
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = mouse.subStat(movers[i].location);
    
    dir.norm();
    
    dir. mult(20);
    
    PVector gravity = new PVector(0, 0.1);
    gravity.mult(movers[i].mass);
    
    if (mousePressed) {
      movers[i].applyForce(dir);
    }
    
    if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid);  
    }
    
    movers[i].applyForce(gravity);
    
    PVector friction = movers[i].velocity.multStat(fc * -1);
    movers[i].applyForce(friction);
    
    movers[i].checkEdges();    
    movers[i].update();
    //movers[i].limit(8);
    movers[i].display();
  }
}