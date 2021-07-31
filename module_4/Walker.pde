class Walker
{
 public PVector position = new PVector();
 public PVector velocity = new PVector();
 public PVector acceleration = new PVector();
 public float scale;
 public float velocityLimit = 10;
 public float r = 255, g = 255, b = 255, a = 255;
 
 Walker(PVector acceleration)
 {
   this.acceleration = acceleration;
 }
 Walker(float x, float y, float scale)
 {
   position = new PVector(x, y);
   this.scale = scale;
 }
 
 Walker(PVector position, float scale)
 {
   this.position = position;
   this.scale = scale;
 }
 
 void render()
 {
  noStroke();
  fill(r,g,b,a);
  circle(position.x, position.y, scale); 
 }
 
 public void setColor(float r, float g, float b, float a)
 {
   this.r = r;
   this.g = g;
   this.b = b;
   this.a = a;
 }
 
 public void setPosition(PVector position)
 {
   this.position = position;
 }
 
 public void update()
 {
   this.velocity.add(this.acceleration);
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity);
 }
}
