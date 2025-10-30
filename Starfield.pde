Particle bob = new Particle();
Particle [] flight = new Particle[100];
void setup(){
size(500,500);
    flight[0] = new OddballParticle();
  for (int i = 1; i<flight.length; i++){
    flight[i] = new Particle();
  }
}
void draw(){
  background(0);
  bob.show();
  bob.move();
  for (int i = 0; i<flight.length; i++){
  flight[i].show();
  flight[i].move();
  }
}


class Particle{
  private double myX, myY, mySpeed, myAngle;
  private int myColor, myOpacity;
  
  public float getX(){
  return (float) myX;
  }
  public float getY(){
  return (float) myY;
  }
  public double getSpeed(){
  return mySpeed;
  }
  public double getAngle(){
  return myAngle;
  }
  public int getColor(){
  return myColor;
  }
  
  public void setX(double x){
  myX = x;
  }
  public void setY(double x){
  myY = x;
  }
  public void setSpeed(double x){
  mySpeed = x;
  }
  public void setAngle(double x){
  myAngle = x;
  }
  public void setColor(int x){
  myColor = x;
  }
  
Particle(){
  myX = 250;
  myY = 250;
  myAngle = Math.random()*2*Math.PI;
  mySpeed = Math.random()*5;
  myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  myOpacity = 0;
}
void show(){
  fill(myColor);
  noStroke();
  ellipse((float)myX, (float)myY, 10,10);
}
void move(){
  myX = myX + Math.cos(myAngle)*mySpeed;
  myY = myY + Math.sin(myAngle)*mySpeed;
  //restart if off screen
  if((575<myX)||(myX<-75)){
  myX = 250;
  myY=250;
  }
  if((575<myY)||(myY<-75)){
  myX = 250;
  myY = 250;
  }
  ////opacity
  //if((575<myX)||(myX<-75)){
  //myX = 250;
  //myY=250;
  //}
  //if((575<myY)||(myY<-75)){
  //myX = 250;
  //myY = 250;
  //}
}
} //end of Particle class

class OddballParticle extends Particle{
  int startX, endX, startY, endY;
  OddballParticle(){
  startX = 200;
  startY=200;
  setX(250);
  setY(250);
  setAngle(Math.random()*2*Math.PI);
  setSpeed(Math.random()*10);
  setColor(color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256)));
  }
  void move(){
    endX = startX + (int)(Math.random()*7-3);
    endY = startY + (int)(Math.random()*7-3);
    startX=endX;
    startY = endY;
  }
  void show(){
    ellipse(startX, endY, 50, 50);
  }

}// end of OddballParticle
