int width = 500;
int height = 500;
int angle = 0;
int count = 0;

class Walker {
  float x, y, tx, ty, w, h;
  int inc = 0;
  int multColor = 1;
  int multSize = 1;
  int orX = width/2;
  int orY = orX;
  int rotSize = 100;
  
  Walker() {
    tx = 0;
    ty = 10000;
    w = h = 30;
  }
  
  void display() {
   noStroke();
   ellipse(x, y, w, h); 
   fill(255);
  }
  
  void step() {
    if (inc == 0) multColor = 1;
    if (inc == 255) multColor = -1;
    inc+=multColor;
    fill(inc);
    
    x = orX + sin(angle)*(rotSize+(inc/10));
    y = orY + cos(angle)*(rotSize+(inc/10));
    angle+=PI;
    
    int change = 4;
    if (w <= 200){
      w+=change*multSize;
      h+=change*multSize;
      if (w == 100){
      multSize = 1;
      }
    } 
    if (w == 200){
      multSize = -1;
    }   
  }
}



Walker w;

void setup() {
  size(width, height);
  w = new Walker();
  background(0);
}

float t = 3;

void draw() {
  //background(0);
  w.step();
  w.display();
  
}
