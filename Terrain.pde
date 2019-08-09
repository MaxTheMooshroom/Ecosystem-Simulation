float tileGranularity = 10;
int tileRows = 200;
int tileCols = 200;
int heightScale = 100;
float noiseScale = 0.075;

float waterLevel = 0.3;

boolean isFlat = false;

ArrayList<ArrayList<Tile>> tiles;

class Tile
{
  PVector position;
  float resistance = 0;
  color colour;
  
  Tile(PVector pos)
  {
    position = pos;
    if (position.z / heightScale < waterLevel)
    {
      //position.z = heightScale * waterLevel;
      colour = color(0, 0, 128);
    }
    else
    {
      colour = color(0, 128, 0);
    }
  }
}

void GenTerrain()
{
  tiles = new ArrayList<ArrayList<Tile>>();
  
  for (int y = 0; y < tileRows; y++)
  {
    ArrayList<Tile> xList = new ArrayList<Tile>();
    for (int x = 0; x < tileCols; x++)
    {
      PVector pos = new PVector(x, y, noise(x * noiseScale, y * noiseScale) * heightScale);
      xList.add(new Tile(pos));
    }
    tiles.add(xList);
  }
}

void DrawTerrain()
{
  translate(-tileCols * tileGranularity / 2, -tileRows * tileGranularity / 2);
  
  for (int y = 0; y < tileRows - 1; y++)
  {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < tileCols - 1; x++)
    {
      fill(tiles.get(y).get(x).colour);
      vertex(x * tileGranularity, y * tileGranularity, isFlat ? 0 : tiles.get(y).get(x).position.z);
      vertex(x * tileGranularity, (y + 1) * tileGranularity, isFlat ? 0 : tiles.get(y + 1).get(x).position.z);
    }
    endShape();
  }
  
  translate(tileCols * tileGranularity / 2, tileRows * tileGranularity / 2);
}

void RecalculateColors()
{
  for (ArrayList<Tile> xList : tiles)
  {
    for (Tile tile : xList)
    {
      if (tile.position.z / heightScale < waterLevel)
      {
        tile.colour = color(0, 0, 128);
      }
      else
      {
        tile.colour = color(0, 128, 0);
      }
    }
  }
}
