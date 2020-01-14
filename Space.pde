import ddf.minim.*;
import processing.sound.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer player;
FFT fft;
AudioIn in;
int bands = 512;
Mesh mesh;
Planet planet;
Planet planet1;
Planet planet2;
Planet planet3;

float x = 1;
int spawn =1;
int R = 100;

      
      

void setup()
{
    size(800,600, P3D);
    Minim minim = new Minim(this);
    player = minim.loadFile("song.mp3");
      fft = new FFT(this, bands);
      in = new AudioIn(this, 0);
      in.start();
      // p
      fft.input(in);
    
    //Plan
   
    mesh = new Mesh(player);
    /////////////////////
    planet = new Planet(50,10,0);
    planet.spawnMoons(1,1);
    //////////////////////
    planet1 = new Planet(30,10,0);
    planet1.spawnMoons(1,3);
    
        //////////////////////
    planet2 = new Planet(30,10,0);
    planet2.spawnMoons(1,3);
   
    //Planet planet3;
    //planet3 = new Planet(spawn,10,0);
}
public void draw(){
  player.play();
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

translate((width+400)/2,height/2,20);
planet2.show();
planet2.orbit();

popMatrix();    

    float leftLevel = player.left.level()*25; 

     mesh.shakex = (int)leftLevel *3;
     planet.shakex = (int)leftLevel* 5;

    beginCamera();
camera();
//x = x + 0.005;
//rotateX(leftLevel);
//translate(sin());
endCamera();
 
}

      
