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

void draw()
{
   background(130);
   PVector mouse = mousePos();
   
   mouse.normalize().mult(400);
   
   //red outer glow (high thickness)
   stroke(255, 0, 0);
   strokeWeight(20);
   strokeCap(ROUND);
   line(0, 0, -mouse.x, -mouse.y);
   line(mouse.x, mouse.y, 0, 0);
   
   // white inner glow (low thickness)
   strokeWeight(5);
   stroke(255);
   strokeCap(ROUND);
   line(0, 0, -mouse.x, -mouse.y);
   line(mouse.x, mouse.y, 0, 0);
   
   //black handle (mid thickness)
   stroke(0);
   strokeWeight(20);
   mouse.normalize().mult(100);
   line(0, 0, mouse.x, mouse.y);
   line(0, 0, -mouse.x, -mouse.y);
}
