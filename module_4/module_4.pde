void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initializeMatter();
  
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = - (mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

PVector direction = new PVector();
Walker[] matter = new Walker[100]; 
Walker mousy = new Walker(0, 0, 1);

void draw()
{
  PVector mouse = mousePos();
  background(0);
  moveMatter();
  update();
  drawMatter();
  mousy.setPosition(mouse);
}

void initializeMatter() //initialize 100 matter/walker
{
  for(int i = 0; i < 100; i++)
  {
    float x = random(-540, 540);
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
      PVector direction = PVector.sub(mousy.position, matter[i].position);
      matter[i].acceleration = direction.normalize().mult(0.2);
    }
 }
 
 void update()
 {
   for(int i = 0; i < 100; i++)
    {
      matter[i].update();
    }
 }
 
