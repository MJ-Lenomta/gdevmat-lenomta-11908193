void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}
void draw()
{
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawCircle();
  drawSineWave();
}

void drawCartesianPlane()
{
  background(255);
  circle(0, 0, 5);
  
  strokeWeight(2);
  color black = color(0, 0, 0);
  fill(black);
  stroke(black);
  line(-300, 0, 300, 0);
  line(0, -300, 0, 300);
  
  for(int i = -300; i <= 300; i+= 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{
  //f(x) =−5x +30(purple color)
  color purple = color(255, 0, 255);
  fill(purple);
  noStroke();
  for (float x = -200; x <= 200; x+=0.1f)
  {
    circle(x, (x * -5) + 30, 3);
  }
}

void drawQuadraticFunction()
{
 // f(x) = x^2 - 15x - 3 (yellow) 
 
 color yellow = color(255, 255, 0);
 fill(yellow);
 stroke(yellow);
 noStroke();
  
  for (float x = -300; x<= 300; x+=0.1f)
  {
   circle(x, (float)Math.pow(x, 2) + (x * -15) - 3, 3); 
  }
}

void drawCircle()
{
 color yellow = color(255, 255, 0);
 fill(yellow);
 stroke(yellow);
 noStroke();
 float radius = 50;
 
 for (int x = 0; x<= 360; x++)
 {
  circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 3); 
 }
}

void drawSineWave()
{
 //sine wave y = sin x
 
  color blue = color(0, 0, 255);
 fill(blue);
 stroke(blue);
 noStroke();
 float amplitude = 20.0;
 float frequency = 0.1;
 
 for (float x = -300; x<= 300; x+= 0.001f)
 {
  circle(x, (float)Math.sin(x * frequency) * amplitude, 3); 
 }
}
