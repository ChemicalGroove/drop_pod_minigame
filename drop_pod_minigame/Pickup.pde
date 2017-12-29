class Pickup {
  PVector pos;
  PVector vel = new PVector(0,0);
  PVector acc = new PVector(0,0);
  
  Pickup (float x, float y) {
    this.pos = new PVector(x, y);
  }
  
  void update() {
    this.vel.add(acc);
    this.vel.limit(20);
    this.vel.mult(0.99);
    this.pos.add(vel);
  }
  
  void show() {
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(PI/4);
    rect(0,0,20,20);
    popMatrix();
  }
  
  boolean scored(Droppod d) {
    if (dist(d.pos.x, d.pos.y, this.pos.x, this.pos.y) <= dropSize){
      return true;
    }
    return false;
  }

}