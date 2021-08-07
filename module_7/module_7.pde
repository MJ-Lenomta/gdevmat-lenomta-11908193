Walker[] matter = new Walker[10];
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initializeMatter();
}

void draw()
{
  background(255);
   
  ocean.render();
  for(Walker w : matter)
  {
    //Friction = -1 * mew * N * v
    float normal = 1;
    float mew = 0.1f;
    float frictionMagnitude = mew * normal; //, * n
    PVector friction = w.velocity.copy();
    friction.mult(-1); // v * -1
    friction.normalize();
    friction.mult(frictionMagnitude);
    PVector gravity = new PVector(0, -0.15f * w.mass);
    PVector wind = new PVector(0.1, 0);

    w.applyForce(gravity);
    w.applyForce(friction);
    
    w.update();
    w.render();
    w.applyForce(wind);
    
    if(ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
      // denying wind force because there is no wind under water
      w.velocity.x *= 0;
    }
        
    if(w.position.x >= Window.right)
    {
      w.position.x = Window.right;
      w.velocity.x *= -1;
    }
    
    if(w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
  }
}

void initializeMatter()
{
  int posX = 0;
  for(int i = 0; i < 10; i++)
  {
    posX =(Window.windowWidth / 10) * (i - 5);
    matter[i] = new Walker();
    matter[i].position = new PVector(posX, 300);
    matter[i].mass = random(1, 10);
    matter[i].setColor(random(255), random(255), random(255), random(150, 255));
    println(matter[i].mass);
  }
  println("==============");
  //sort walkers on mass "bubble sort"
  for(int a =  matter.length -1; a > 0; a--)
  {
    for(int i = 0; i < a; i++)
    {
      if(matter[i].mass < matter[i+1].mass)
      {
        float temp = matter[i].mass;
        matter[i].mass = matter[i+1].mass;
        matter[i+1].mass = temp;
      }
    }
  }
  // apply their scales/size according to mass their scales/size
  for(int i = 0; i < 10; i++)
  {
    matter[i].scale = matter[i].mass * 15;
    println(matter[i].mass);
  }
}

void mousePressed()
{
  background(255);
  initializeMatter();
}
