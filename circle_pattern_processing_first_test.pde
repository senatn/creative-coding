int colArrayCounter;
color[] colArray = {
  color(66, 0, 117),
  color(92, 0, 163),
  color(117, 0, 209),
  color(143, 0, 255),
  color(163, 46, 255),
  color(183, 92, 255),
  };
  
void setup () {
  fullScreen();
  //size (900, 900);
  // surface.setLocation(987, 70);
  //noLoop();
  noStroke();
  //mouseX = 10;
  frameRate(15);
}

void draw() {
  background(#282828);
  
  translate(width/2, height/2);
  
  float rStep = 30;
  float rMax = 1200;
  //float rMin = mouseX;
  
  for (float r = 20; r < rMax; r += rStep) {
    
    float c = 2*PI*r;
    float cSegment = map(r , 0, rMax, rStep*3/4, rStep/2);
    float aSegment = floor(c/cSegment);
    float ellipseSize = map(r, 0, rMax, rStep*3/4-1, rStep/4);
    
    for (float a = 0; a < 360; a += 360 / aSegment) {
      colArrayCounter++;
      if(colArrayCounter > 5) colArrayCounter = 0;
      fill(colArray[colArrayCounter]);
      
      pushMatrix();
      rotate(radians(a));
      ellipse(r, 0, ellipseSize, ellipseSize/2);
      popMatrix();
    }
  }
  
  //saveFrame("test_####.png");
  
}

void keyPressed() {
  if(key == ' ') {
    background(#282828);
    redraw();
  }
}
