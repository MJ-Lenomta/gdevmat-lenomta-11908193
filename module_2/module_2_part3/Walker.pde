class Walker
{
 float x;
 float y;
 float tx = 0, ty = 1000;
 float tScale = 10;
 float tColor1 = 0; //different starting point for colors for different colors to appear
 float tColor2 = 500; 
 float tColor3 = 1000; 

 void render()
 {
  noStroke();
   // i cant set the default value to 255 because it will only show color range from black to white
  float red = map(noise(tColor1), 0, 1, 0, 255);
  float green = map(noise(tColor2), 0, 1, 0, 255);
  float blue = map(noise(tColor3), 0, 1, 0, 255);
  fill(red, green, blue);
  circle(x, y, map(noise(tScale), 0, 1, 5, 150));
  
  tScale += 0.01;
  tColor1 += 0.1f;
  tColor2 += 0.1f;
  tColor3 += 0.1f;
 }
 
 void perlinWalk()
 {
   x = map(noise(tx), 0, 1, -640, 640);
   y = map(noise(ty), 0, 1, -360, 360);
   tx += 0.01f;
   ty += 0.01f;
 }
}
