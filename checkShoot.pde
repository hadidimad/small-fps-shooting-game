class Point2D {
  Point2D() {
  }
  float x=0, z=0;
};

boolean checkShoot(Player shooter, Enemy goal) { /// this void will ckeck that if player shoot will it kill enemy or not base on y=ax+b formula
  //set shoot line a and b
  float ap=tan(shooter.angle);
  float ab=shooter.z-(ap*shooter.x);
  //set Point to compare shoot line with
  Point2D ep1=new Point2D();
  ep1.x=goal.x;
  ep1.z=goal.z-goal.d/2;
  Point2D ep2=new Point2D();
  ep2.x=goal.x+goal.w/2;
  ep2.z=goal.z;
  Point2D ep3=new Point2D();
  ep3.x=goal.x;
  ep3.z=goal.z+goal.d/2;
  Point2D ep4=new Point2D();
  ep4.x=goal.x-goal.w/2;
  ep4.z=goal.z;
  //make line from points
  float eb1=ep1.z-(ap*ep1.x);
  float eb2=ep2.z-(ap*ep2.x);
  float eb3=ep3.z-(ap*ep3.x);
  float eb4=ep4.z-(ap*ep4.x);
  //ckeck that shoot line is between other lines
  if(ab < eb3 && ab > eb1 || ab >eb2 && ab < eb4){
    return true;
  }
  return false;
}