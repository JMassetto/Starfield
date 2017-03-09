NormalParticle parti;
Particle[] colony;
void setup()
{
  parti = new NormalParticle();
  colony = new Particle[100];
  for(int row = 0; row < 100; row++){
    colony[row] = new NormalParticle();
  }
  for(int var = 0; var < 100; var += 10){
    colony[var] = new OddballParticle();
  }
  for(int vari = 1; vari < 100; vari += 30){
    colony[vari] = new JumboParticle();
  }
  size(501,501);
  background(0,0,0);
}
void draw()
{
  noStroke();
  fill(0,0,0,33);
  rect(0,0,500,500);
  parti.show();
  //parti.move();
  for(int row = 0; row < 100; row++){
    colony[row].show();
    colony[row].move();
  }
}
void mouseClicked(){
  for(int wer = 0; wer < 100; wer++){
    colony[wer].mouse();
  }
}


class NormalParticle implements Particle
{
  double myX, myY, myX2, myY2, myX3, myY3, myAngle, mySpeed;
  int color1, color2, color3;
  public NormalParticle(){
    myX = 251;
    myY = 251;
    myAngle = (Math.random()*(2*Math.PI));
    mySpeed = (Math.random()*5);
    color1 = (int)(Math.random()*256);
    color2 = (int)(Math.random()*256);
    color3 = (int)(Math.random()*256);
  }
  public void show(){
    fill(color1,color2,color3);
    //triangle((float)myX,(float)myY,(float)myX2,(float)myY2,(float)myX3,(float)myY3);
    ellipse((float)myX,(float)myY,10,10);
  }
  public void move(){
    myX += mySpeed*Math.cos(myAngle);
    myY += mySpeed*Math.sin(myAngle);
    if (myX > 500 || myX < 0 || myY > 500 || myY < 0){
      myX = 251;
      myY = 251;
    }
    myAngle += 0.05;
  }
  public void mouse(){
    myX = 250;
    myY = 250;
  }
}


interface Particle
{
  public void show();
  public void move();
  public void mouse();
}


class OddballParticle implements Particle //uses an interface
{
  double myX, myY, myAngle, mySpeed;
  int color1, color2, color3;
  public OddballParticle(){
    myX = mouseX;
    myY = mouseY;
    myAngle = (Math.random()*(2*Math.PI));
    mySpeed = (Math.random()*5)+1;
    color1 = (int)(Math.random()*256);
    color2 = (int)(Math.random()*256);
    color3 = (int)(Math.random()*256);
  }
  public void show(){
    fill(color1,color2,color3);
    rect((float)myX,(float)myY,15,15);
  }
  public void move(){
    myX += mySpeed*Math.cos(myAngle);
    myY += mySpeed*Math.sin(myAngle);
    if (myX > 500 || myX < 0 || myY > 500 || myY < 0){
      myX = mouseX;
      myY = mouseY;
    }
    //myAngle += 0.1;
  }
  public void mouse(){
    myX = 250;
    myY = 250;
  }
}


class JumboParticle extends NormalParticle //uses inheritance
{
  double myX, myY, myAngle, mySpeed;
  int color1, color2, color3;
  public JumboParticle(){
    myX = 250;
    myY = 250;
    myX2 = 240;
    myY2 = 240;
    myX3 = 260;
    myY3 = 260;
    myAngle = (Math.random()*(2*Math.PI));
    mySpeed = (Math.random()*4)+1;
    color1 = (int)(Math.random()*256);
    color2 = (int)(Math.random()*256);
    color3 = (int)(Math.random()*256);
  }
  public void show(){
    fill(color1,color2,color3);
    //triangle((float)myX,(float)myY,(float)myX2,(float)myY2,(float)myX3,(float)myY3);
    ellipse((float)myX,(float)myY,50,50);
  }
  public void move(){
    myX += mySpeed*Math.cos(myAngle);
    myY += mySpeed*Math.sin(myAngle);
    if (myX > 500 || myX < 0 || myY > 500 || myY < 0){
      myX = (Math.random()*501);
      myY = (Math.random()*501);
    }
    myAngle += 0.05;
  }
  public void mouse(){
    myX = 250;
    myY = 250;
  }
}
