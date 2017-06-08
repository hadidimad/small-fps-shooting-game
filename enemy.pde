class Enemy {
  float x, y, z;
  float w, h, d;
  boolean standing;
  color  col;
  boolean life;
  BombHandler bomber=new BombHandler();

  class BombHandler {
    Bomb bombs[]=new Bomb[5];
    BombHandler() {
      for (int i=0; i<bombs.length; i++) {
        bombs[i]=new Bomb();
      }
    }
    void makeBomb(float inangle, float dist) {
      for (int i=0; i<bombs.length; i++) {
        if (!bombs[i].seted) {
          bombs[i].setBomb(x, y, z, inangle, dist);
          break;
        }
      }
    }
    void handleBombs(Player player) {
      for (int i=0; i<bombs.length; i++) {
        bombs[i].move(player);
        bombs[i].draw();
      }
    }
  };
  Enemy(float inx, float iny, float inz, float inw, float inh, float ind, boolean instanding, color incol) {
    x=inx;
    y=iny;
    z=inz;
    w=inw;
    h=inh;
    d=ind;
    standing=instanding;
    col=incol;
    sit();
    life=true;
  }
  void sit() {
    standing=false;
    y=150;
  }
  void stand() {
    standing=true;
    y=0;
  }
  void draw() {
    if (life) {
      pushMatrix();
      translate(x, y, z);
      fill(col);
      stroke(255);
      box(w, h, d);
      popMatrix();
    }
  }
};