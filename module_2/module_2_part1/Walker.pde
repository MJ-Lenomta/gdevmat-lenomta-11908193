class Walker
{
 float x;
 float y;
 
 void render()
 {
   noStroke();
  int alpha = int(random(50, 100));
  fill(random(255), random(255), random(255), alpha);
  circle(x, y, 20); 
 }
 
 void randomWalk()
 {
  int rng = int(random(8));
  
  if (rng == 0)
  {
    y+=5;
  }
  else if (rng == 1)
  {
    y-=5;
  }
  else if (rng == 2)
  {
    x+=5;
  }
  else if (rng == 3)
  {
    x-=5;
  }
  else if (rng == 4)
  {
    y+=5;
    x+=5;
  }
  else if (rng == 5)
  {
    y+=5;
    x-=5;
  }
  else if (rng == 6)
  {
    y-=5;
    x+=5;
  }
  else if (rng == 7)
  {
    y-=5;
    x-=5;
  }
 }
 
 void randomWalkBiased()
 {
  int rng = int(random(10)); //biased upward
  if (rng <= 4)
  {
    y+=5;
  }
  else if (rng <= 6)
  {
    y-=5;
  }
  else if (rng <= 8)
  {
    x+=5;
  }
  else if (rng <= 10)
  {
    x-=5;
  } 
 }
}
