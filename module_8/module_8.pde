Walker[] matter = new Walker[10];

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initializeMatter();
}

void draw()
{
  background(255);
  for(Walker a : matter)
  {
    a.update();
    a.render();
    for(Walker b : matter)
    {
      if(a != b)
      {
        a.applyForce(b.calculateAttraction(a));
      }
    }
  }
}

void initializeMatter()
{
  for(int i = 0; i < 10; i++)
  {
    matter[i] = new Walker();
    matter[i].position = new PVector(random(-540, 540), random(-320, 320));
    matter[i].mass = random(1, 10);
    matter[i].scale = matter[i].mass * 15;
    matter[i].setColor(random(255), random(255), random(255), random(150, 255));
  }
}

void mousePressed()
{
  background(255);
  initializeMatter();
}
