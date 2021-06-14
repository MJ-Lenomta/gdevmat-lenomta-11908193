void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  fill(0);
}

Walker bouncingWalker = new Walker();
Walker normalWalker = new Walker();

void draw()
{
  background(255);
  // for bouncing
  bouncingWalker.render();
  bouncingWalker.moveAndBounce();
  
  //for walking
  normalWalker.render();
  normalWalker.randomWalk();
}
