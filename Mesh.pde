import ddf.minim.*;

class Mesh{
int scl = 10;
int cols;
int rows;


public int shakex;

float [][] terrain;
PImage glow = loadImage("glow.jpg");
AudioPlayer player;


    public Mesh(AudioPlayer player1)
    {
      player = player1;
      cols = height/scl;
      rows =width/scl;
      glow.resize(width,height);
      terrain =  new float [rows][cols];
      
    }

    int index(int x, int y){
      
    return x+y * glow.width;
    }
    
void show()
{        
  
  
   pointLight(0, 255, 255,width/2,height/2, 60);

    directionalLight(255, 255, 255, width/2, height/2, 20);
    spotLight(255, 255, 255, 80, 20, 40, -1, 0, 0, PI/2, 2);


                             stroke(0,255,255);
                             fill(255,0);
                           background(255,255,255);
                            //star.shix();
  
              for(int y=0;y<cols;y++){
              beginShape(TRIANGLE_STRIP);
              for(int x =0; x < rows ; x++){
              color pix = glow.pixels[index(x*scl,y*scl)];
              float oldG = red(pix);
              terrain[x][y] = map(oldG,0,200+shakex,-60+shakex,50);
              
              }
              }
              
              translate(width/2,height/2);
              rotateX(PI/4);
              translate(-width,-height);
              translate(0,-100);
              
                
              
              
              for(int y=0; y< cols-1;y++){
                beginShape(TRIANGLE_STRIP);
                for(int x=0;x<rows;x++){
                  vertex(x*scl,y*scl,terrain[x][y]);
                  vertex(x*scl,(y+1)*scl,terrain[x][y+1]);
                }
                endShape();
                }
                   
                
    
              
}

}
