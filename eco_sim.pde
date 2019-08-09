import peasy.*;
PeasyCam cam;

long seed;

void setup()
{
  size(600, 600, P3D);
  cam = new PeasyCam(this, 2000);
  seed = (long)random(1000000);
  noiseSeed(seed);
  
  GenTerrain();
  
  GenPlants(750);
  
  //GenPrey();
  
  //GenPredators();
}

void keyPressed()
{
  if (key == keyCode) if (keyCode == TAB) 
  {
    seed = (long)random(1000000);
    noiseSeed(seed);
  
    GenTerrain();
    
    GenPlants(750);
  }
  
  if (key == 'w')
  {
    waterLevel += 0.01;
    RecalculateColors();
  }
  else if (key == 's')
  {
    waterLevel -= 0.01;
    RecalculateColors();
  }
}

void draw()
{
  background(0);
  lights();
  noStroke();
  
  DrawTerrain();
  
  DrawPlants();
  
  cam.beginHUD();
  fill(255);
  text("seed: " + seed, 10, 10);
  text("waterLevel: " + waterLevel, 10, 50);
  cam.endHUD();
}
