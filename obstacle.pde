int enemyDist=1500;
void darwObstacle() {
  pushMatrix();
  translate(210, 180, 0);
  stroke(255);
  fill(color(100, 100, 100));
  box(100, 200, 2000);
  popMatrix();
  pushMatrix();
  translate(enemyDist, 180, 0);
  stroke(255);
  fill(color(100, 100, 100));
  box(100, 200, 2000);
  popMatrix();
}