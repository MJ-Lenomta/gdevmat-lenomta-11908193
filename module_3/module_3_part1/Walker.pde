class Walker
{
 PVector position = new PVector();
 PVector speed = new PVector(5, 8);
 
 void render()
 {
  noStroke();
  circle(position.x, position.y, 50); 
 }
 
 void randomWalk()
 {
  int rng = int(random(8));
  
  if (rng == 0)
  {
    position.y+= speed.y;
  }
  else if (rng == 1)
  {
    position.y-= speed.y;
  }
  else if (rng == 2)
  {
    position.x += speed.x;
  }
  else if (rng == 3)
  {
    position.x -= speed.x;
  }
  else if (rng == 4)
  {
    position.y += speed.y;
    position.x += speed.x;
  }
  else if (rng == 5)
  {
    position.y+= speed.y;
    position.x -= speed.x;
  }
  else if (rng == 6)
  {
    position.y -= speed.y;
    position.x += speed.x;
  }
  else if (rng == 7)
  {
    position.y -= speed.y;
    position.x -= speed.x;
  }
 }
 
 void moveAndBounce()
 {
   position.add(speed);
   
   if((position.x > Window.right) || (position.x < Window.left))
   {
      speed.x *= -1; 
      fill(random(255), random(255), random(255)); // change color every time it bounce/hit the corner
   }
   
   if((position.y > Window.top) || (position.y < Window.bottom))
   {
      speed.y *= -1; 
      fill(random(255), random(255), random(255));
   }
 }
}
