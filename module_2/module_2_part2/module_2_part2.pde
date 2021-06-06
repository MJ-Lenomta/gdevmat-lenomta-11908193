void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

int frame = 0; //makes it a global variable

void draw()
{
  if(frame != 300) // 0 - 299
  {
    paintSplatter();
    println(frame);
    frame++; // increment up to 300
  }
  else
  {
   background(255); // clear the screen
   frame = 0; //goes back to loop
  }
}

void paintSplatter()
{
  float gaussian = randomGaussian();
  float standardDeviation = 200;
  float mean = 0;
  float x = standardDeviation * gaussian + mean; // x coord
  float y = random(-360, 360); // y coord
   
  // circle with random colors
  noStroke();
  int alpha = int(random(50, 100));
  fill (random(255), random(255), random(255), alpha);
  
  //circle scale
  float gaussian2 = randomGaussian();
  float standardDeviation2 = 20;
  float mean2 = 10;
  float circleScale = standardDeviation2 * gaussian2 + mean2;
  circle(x, y, circleScale);
}
