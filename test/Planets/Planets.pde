Mover[] movers = new Mover[5];
float fc;
float G;
PVector acceleration;

void setup() {
  size(640, 420);
  for (int i = 0; i < movers.length; i++) {
    float r = 5 + random(15);
    float m = r*r*0.5;
    float x = r + random(width - 2 * r);
    float y = r + random(width - 2 * r);
    movers[i] = new Mover(x, y, r, m);
  }
  fc = 0.1;
  G = 0.1;
}

void draw() {
  background(255);
  
  for (int i = 0; i < movers.length; i++) {
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = mouse.subStat(movers[i].location);
    
    dir.norm();
    dir. mult(2);
    
    if (mousePressed) {
      movers[i].applyForce(dir);
    }
    
    PVector gforce = new PVector(0,0);
    
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector f = movers[j].location.subStat(movers[i].location);
        float d = f.mag();
        
        if (d < 5) {
          d = 5;
        } else if (d > 50) {
          d = 50;
        }
        
        float gMag = G * movers[i].mass * movers[j].mass / (d * d);
        f.norm();
        f.mult(gMag);
        gforce.add(f);
      } 
    }
    
    
    
    movers[i].applyForce(gforce);
    
    movers[i].checkEdges();    
    movers[i].update();
    //movers[i].limit(8);
    movers[i].display();
  }
}