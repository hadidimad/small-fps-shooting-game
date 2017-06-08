/*
  a small shooting game  

  controls:
  z:move Left
  x:move Right
  s: shoot
  c:sit
  key Left :move camera left
  key Right :move camera Right
  
  How to play:
  try to shoot red cubes on other side they are enemies 
  they will attack you by bombs you wont die while you are siting 
  but if a bomb explode near you and you was stand you will die

*/
int x, y, z;
int px, py, pz;
Player player;
Enemy enemy[]=new Enemy[7];
int standEnemy;
Bomb bomb;
boolean playerisLive=true;

void setup() {
  size(640, 360, P3D);
  //fullScreen(P3D, SPAN);
  player=new Player();
  int forz=-900;
  for (int i=0; i<enemy.length; i++) {
    enemy[i]=new Enemy(enemyDist+100, 0, forz, 100, 200, 100, false, color(100, 0, 0));
    enemy[i].stand();
    forz+=300;
  }
  standEnemy=floor(random(5));
  enemy[standEnemy].stand();
}

void draw() {
  background(0);
  if(playerisLive){
  camera(player.x, player.y, player.z, player.getPX(), player.getPY(), player.getPZ(), 0, 1, 0);
  darwObstacle();
  player.drawPointer();
  standOneEnemy(1000);
  for (int i=0; i<enemy.length; i++) {
    if (i != standEnemy) {
      enemy[i].sit();
    }
    enemy[i].bomber.handleBombs(player);
    enemy[i].draw();
  }
  keycontrol();
  }
}

void keycontrol() {
  if (keyPressed) {
    if (key == 'x') {
      player.z+=6;
    } else if (key == 'z') {
      player.z-=6;
    }

    if (keyCode == LEFT) {
      player.angle-=0.01;
    } else if (keyCode == RIGHT) {
      player.angle+=0.01;
    }
  }
}

void keyPressed() {
  if (key == 'c') {
    if (player.standing) {
      player.sit();
    } else {
      player.stand();
    }
  }
  if (key == 's') {
    for (int i=0; i<enemy.length; i++) {
      if (checkShoot(player, enemy[i]) && enemy[i].standing == true) {
        enemy[i].life=false;
        break;
      }
    }
  }
}

int time;
boolean timeset=false;
void standOneEnemy(int timeout) {
  int nowTime=millis();
  if (!timeset) {
    time=nowTime;
    timeset=true;
  }
  if (nowTime - time > timeout && timeset) {
    standEnemy=floor(random(enemy.length));
    enemy[standEnemy].stand();
    if (enemy[standEnemy].life) {
      enemy[standEnemy].bomber.makeBomb(atan((enemy[standEnemy].z-player.z)/(enemy[standEnemy].x-player.x))+radians(180), sqrt(sq(enemy[standEnemy].x-player.x)+sq(enemy[standEnemy].z-player.z))-70);
    }
    timeset=false;
  }
}