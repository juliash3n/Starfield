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
  double myX, myY, mySpeed, myAngle;
  int myColor;
  
Particle(){
  myX = 250;
  myY = 250;
  myAngle = Math.random()*2*Math.PI;
  mySpeed = Math.random()*5;
  myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));

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
  if(dist((float)myX,(float)myY,mouseX,mouseY)<10){
    mySpeed = 0;
    //for (int i = 0; i<flight.length; i++){
    //flight[i].mySpeed = 0;
  }
 }
} //end of Particle class

class OddballParticle extends Particle{
  int startX, endX, startY, endY;
  OddballParticle(){
  startX = 250;
  startY = 250;
  }
  void move(){
    endX = startX + (int)(Math.random()*7-3);
    endY = startY + (int)(Math.random()*7-3);
    startX = endX;
    startY = endY;
    
      if((575<startX)||(startX<-75)){
      startX = 250;
      startY=250;
      }
      if((575<startY)||(startY<-75)){
      startX = 250;
      startY = 250;
      }
     
  }
  void show(){
    ellipse(startX, endY, 50, 50);
  }

}// end of OddballParticle
