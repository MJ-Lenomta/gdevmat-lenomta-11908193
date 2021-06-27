void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = - (mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

Walker blackHole = new Walker(0, 0, 50);
Walker[] matter = new Walker[100];
int frames = 0;

void draw()
{
  PVector mouse = mousePos();
  
  background(0);
  if(matter[0] == null)
  {
    initializeMatter(); // initialize new set of matter
  }
  else if(frames != 200) // only up to 200 frames
  {
    moveMatter();
    drawMatter();
    blackHole.render();
    blackHole.setColor(255, 255, 255, 255);
    blackHole.setPosition(mouse);
    frames++;
  }
  else
  {
    resetArray(); //reset matter or set walker array to null
    //blackHole.setPosition(random(-540, 540), random(-360, 360)); // change blackhole's position
    background(0);
    frames = 0; //reset frames to 0
  }
}

void initializeMatter() //initialize 100 matter/walker
{
  float standardDeviation = 200;
  float mean = 0;
  
  for(int i = 0; i < 100; i++)
  {
    float gaussian = randomGaussian();
    float x = standardDeviation * gaussian + mean;
    float y = random(-360, 360);
    matter[i] = new Walker(x, y, random(2, 35));
    matter[i].setColor(random(255), random(255), random(255), random(255));
  }
}

void drawMatter() //render walkers
{
  for(int i = 0; i < 100; i++)
  {
    matter[i].render();
  }
}

void moveMatter() //move walkers
 {
   for(int i = 0; i < 100; i++)
    {
      PVector direction = PVector.sub(blackHole.position, matter[i].position);
      matter[i].position.add(direction.normalize().mult(5));
    }
 }
 
void resetArray()
{
  for(int i = 0; i < 100; i++)
   {
      matter[i] = null;
   }
}
