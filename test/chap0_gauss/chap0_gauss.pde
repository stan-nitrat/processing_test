void setup() {
  size(640,400);
}

void draw() {
 float x = 320 + 60*(float) randomGaussian(); 
 float y = 200 + 60*(float) randomGaussian();
 
 float size = 16 + 6*(float) randomGaussian();
 
 noStroke();
 fill(100,50,50,50);
 ellipse(x,y,size,size);
}