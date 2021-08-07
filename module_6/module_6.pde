Walker[] matter = new Walker[8];
PVector wind = new PVector(0.15, 0);

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initializeMatter();
}

void draw()
{
  background(255);
  stroke(0);
  strokeWeight(5);
  line(0, 340, 0, -340);
  for(Walker w : matter)
  {
    //Friction = -1 * mew * N * v
    float normal = 1;
    float mew = 0.01f;
    if(w.position.x > 0)
    {
      mew = 0.4f;
    }
    float frictionMagnitude = mew * normal; //, * n
    PVector friction = w.velocity.copy();
    friction.mult(-1); // v * -1
    friction.normalize();
    friction.mult(frictionMagnitude); 
    //friction.mult(w.mass);
    PVector forceToRight = new PVector(0.2, 0);
   
    w.applyForce(forceToRight);
    w.applyForce(friction);
    w.update();
    w.render();
    
    if((w.position.x >= Window.right) || (w.position.x <= Window.left))
    {
      w.position.x = Window.right;
    }
 }
}

void initializeMatter()
{
  int posY = 0;
  for(int i = 0; i < 8; i++)
  {
    posY =(Window.windowHeight / 8) * (i - 4);
    matter[i] = new Walker();
    matter[i].position = new PVector(-500, posY);
    matter[i].mass = 8 - i + 1;
    matter[i].scale = matter[i].mass * 15;
    matter[i].setColor(random(255), random(255), random(255), random(150, 255));
  }
}

void mousePressed()
{
  background(255);
  initializeMatter();
}
