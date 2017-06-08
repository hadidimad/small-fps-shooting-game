class Bomb {
  float x, y, z, sx, sy, sz;
  float angle;
  float explodeDist;
  float speed;
  boolean seted;
  boolean exploded;
  float explodeR,maxExplodeR,explodeSpeed; 
  Bomb() {
    x=0;
    y=0;
    z=0;
    sx=0;
    sy=0;
    sz=0;
    angle=0;
    explodeDist=100;
    speed=10;
    seted=false;
    exploded=false;
    explodeR=0;
    maxExplodeR=40;
    explodeSpeed=1;
  }
  void setBomb(float inx, float iny, float inz, float inangle, float inexplodeDist) {
    x=inx;
    y=iny;
    z=inz;
    sx=inx;
    sy=iny;
    sz=inz;
    angle=inangle;
    explodeDist=inexplodeDist;
    seted=true;
    exploded=false;
    explodeR=0;
  }
  void move(Player player) {
    if (seted) {
      if (!exploded) {
        if (sqrt(sq(x-sx)+sq(z-sz)) >=explodeDist) {
          exploded=true;
        } else {
          x+=cos(angle)*speed;
          z+=sin(angle)*speed;
        }
      } else {
        if(explodeR < maxExplodeR){
        explodeR+=explodeSpeed;
        }else{
          seted=false;
          if(player.x < x+explodeR+70 && player.x>x-explodeR-70 && player.z < z+explodeR+70 && player.z>z-explodeR-70 && player.standing){
            playerisLive=false;
            println("you Died",x,y,z);
          }
        }
      }
    }
  }
  void draw() {
    if (seted) {
      if (!exploded) {
        pushMatrix();
        translate(x, y, z);
        rotateY(-angle);
        fill(color(0, 100, 0));
        box(10, 5, 5);
        popMatrix();
      }else{
        pushMatrix();
        translate(x, y, z);
        fill(color(200, 100, 0));
        noStroke();
        sphere(explodeR);
        popMatrix();
      }
    }
  }
};