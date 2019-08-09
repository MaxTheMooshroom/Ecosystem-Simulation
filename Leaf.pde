ArrayList<Leaf> leaves;

class Leaf
{
  PVector position;
  
  Leaf(PVector pos)
  {
    position = pos;
  }
}

void GenPlants(int num)
{
  leaves = new ArrayList<Leaf>();
  for (int i = 0; i < num; i++)
  {
    int x = (int)random(tileCols);
    int y = (int)random(tileRows);
    if (!isFlat) 
    {
      while (tiles.get(y).get(x).position.z / heightScale < waterLevel)
      {
        x = (int)random(tileCols);
        y = (int)random(tileRows);
      }
      leaves.add(new Leaf(new PVector(x * tileGranularity, y * tileGranularity, tiles.get(y).get(x).position.z)));
    }
    else
    {
      while (noise(x,y) < waterLevel)
      {
        x = (int)random(tileCols);
        y = (int)random(tileRows);
      }
      leaves.add(new Leaf(new PVector(x * tileGranularity, y * tileGranularity, 0)));
    }
  }
}

void DrawPlants()
{
  translate(-tileCols * tileGranularity / 2, -tileRows * tileGranularity / 2);
  for (Leaf leaf : leaves)
  {
    translate(leaf.position.x, leaf.position.y, leaf.position.z);
    fill(255, 204, 153);
    sphere(10);
    translate(-leaf.position.x, -leaf.position.y, -leaf.position.z);
  }
  translate(tileCols * tileGranularity / 2, tileRows * tileGranularity / 2);
}
