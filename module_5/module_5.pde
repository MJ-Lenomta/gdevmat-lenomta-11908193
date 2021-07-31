Walker[] matter = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initializeMatter();
}

void draw()
{
  background(80);
  for(Walker w : matter)
  {
    w.render();
    w.update();
    w.applyForce(wind);
    w.applyForce(gravity);
    
    if((w.position.x >= Window.right) || (w.position.x <= Window.left))
   {
     w.position.x = Window.right;
     w.velocity.x *= -1;
   }
   
   if((w.position.y >= Window.top) || (w.position.y <= Window.bottom))
   {
     w.position.y = Window.bottom;
     w.velocity.y *= -1;
   }
  }
}

void initializeMatter()
{
  for(int i = 0; i < 10; i++)
  {
    float x = -500;
    float y = 200;
    float mass = random(1, 10);
    matter[i] = new Walker(x, y, mass*15);
    matter[i].mass = mass;
    matter[i].setColor(random(255), random(255), random(255), random(155, 255));
  }
}
 
