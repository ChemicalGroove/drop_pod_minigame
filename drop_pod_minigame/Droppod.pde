class Droppod {
  PVector pos;
  PVector vel= new PVector(0,0);
  PVector acc= new PVector(0,0);
  float mx;
  float mn;
  
  
  Droppod(float x, float y, float _mx, float _mn) {
    pos= new PVector(x,y);
    mx = _mx;
    mn = _mn;
  }
  
  void addForce(float x, float y) {
    this.acc.add(new PVector(x, y));
  }
  
  void update() {
    this.vel.add(acc);
    this.vel.limit(20);
    this.vel.mult(0.6);
    this.pos.add(vel);
    this.acc.mult(0.1);
    
    if (this.pos.x >= mx) {
      this.pos.x = mn+1;
    }
    
    if (this.pos.x <= mn) {
      this.pos.x = mx-1;
    }
  
  }
  
  void show() {
   
    ellipse(this.pos.x,this.pos.y,40,40);
  }
}