class Player {
  float x, y, z;
  float px, py, pz;
  float angle;
  boolean standing;
  boolean life;

  Player() {
    x=0;
    y=0;
    z=0;
    px=0;
    py=0;
    pz=0;
    angle=0;
    standing=false;
    stand();
    life=true;
  }

  float getPX() {
    return x+cos(angle);
  }
  float getPY() {
      return y;
  }
  float getPZ() {
    return z+sin(angle);
  }
  void sit(){
    standing=false;
    y=+150;
  }
  
  void stand(){
    standing=true;
    y=0;
  }
  
  void drawPointer(){
    pushMatrix();
    translate(x+(100*cos(angle)),y,z+(100*sin(angle)));
    rotateY(-angle);
    box(0.2,0.2,25);
    box(0.2,25,0.2);
    popMatrix();
  }
};