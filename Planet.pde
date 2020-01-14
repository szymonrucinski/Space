class Planet{
  float radius;
  float distance;
  float angle = random(3*TWO_PI);
  float orbitSpeed = random(0.0001,0.0002);
  public int shakex =15;
  
   final int red = (int)random(0,255);
    final int green = (int)random(0,255);
   final int blue = (int)random(0,255);

 Planet[] planets;

 Planet(float r, float d, float o){
 radius =r;
 distance =d;
 orbitSpeed=o;
 }

void spawnMoons(int total, int level)
{
planets = new Planet[total];
 // println(total);
if(planets!=null){
for(int i=0; i<planets.length;i++){
  float r = radius*0.6;
  float d = random(100,200);
  //println(r);
  float o = random (0.01, 0.02);
planets[i]= new Planet(r,d,o);
if(level<3)
      {
        int num = 1;
        planets[i].spawnMoons(num, level+1);
      }
}
}
}




void orbit()
{
angle = angle + orbitSpeed;
if(planets!=null){
for(int i =0; i<planets.length; i++)
{
planets[i].orbit();
}
}
}

void show()
{
  pushMatrix();
 // printArray(planets);
 rotate (angle);
translate(distance,0);
//stroke(red,green,blue);
//lightSpecular(red, green, blue);
fill(red,blue,green);
stroke(255,255,255);

noStroke();
//sphereDetail(15);
//shininess(15.0);
sphere(radius);
//printArray(planets);
if(planets != null)
  {
for(int i =0; i<planets.length; i++)
{
  
  planets[i].show();
  
}
  }

popMatrix();
}



}
