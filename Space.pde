//import ddf.minim.*;

//AudioPlayer player;
//Minim minim;//audio context

Mesh mesh;
Planet planet;
Planet planet1;
Planet planet2;
Planet planet3;
float x = 1;
int spawn =1;
int R = 100;
      void mousePressed() {
        spawn = spawn +1;
      }
      
       
      
      
      void keyPressed() {
      x= x +0.1;
        }
      
      
      
      

void setup()
{
    size(800,600, P3D);
    smooth();
    mesh = new Mesh ();
    /////////////////////
    planet = new Planet(50,10,0);
    planet.spawnMoons(1,1);
    //////////////////////
    planet1 = new Planet(30,10,0);
    planet1.spawnMoons(1,3);
    
        //////////////////////
    planet2 = new Planet(30,10,0);
    planet2.spawnMoons(1,3);
   
    Planet planet3;
    planet3 = new Planet(spawn,10,0);
}

void draw(){
  if(x>6)
{background(0,0,0);
}
//pushMatrix();
translate(width/2,height/2);
mesh.show();
//popMatrix();

pushMatrix();
//x/z/y
translate(width/2,(height+80)/2,(height-200)/2);
planet.show();
planet.orbit();
popMatrix();



  pushMatrix();
translate((width-600)/2,height/2,20);
planet1.show();
planet1.orbit();
popMatrix();    
      

  pushMatrix();
translate((width+400)/2,height/2,20);
planet2.show();
planet2.orbit();
popMatrix();    



beginCamera();
camera();
x = x + 0.005;
println(x);
//translate(R*cos(x),R*sin(x), R*sin(x));
//if((x/sin(x))<TWO_PI){
rotateX(sin(exp(x/2)));
endCamera();
  
      if(x>6)
      {
      planet.spawnMoons(50,0);
      }

}
