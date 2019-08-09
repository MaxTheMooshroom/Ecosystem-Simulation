

class AgentTile extends Tile
{
  AgentTile parent;
  
  float g = 0;
  float h = 0;
  float f = 0;
  
  AgentTile(Tile t)
  {
    super(t.position);
  }
  
  AgentTile(Tile t, float _g, float _h)
  {
    super(t.position);
    g = _g;
    h = _h;
    f = g + h;
  }
}

class Agent
{
  float speed;      // as a base stat
  float trueSpeed;  // speed as influenced by other variables
  
  float size;       // influences speed and energy cost per movement
  
  float energy;
  float energyCostPerTick;
  float energyCostPerMovement; // influenced by speed, size, and terrain difficulty
  
  float lust;       // desire to procreate; increases exponentially
  float procreateEnergyCost;
  
  float sightRange; // influences energy cost per tick
  
  float hunger;     
  float maxHunger;  // dies when hunger reaches maxHunger
  
  PVector position;
  
  ASTAR as;
}

AgentTile TileToAgentTile(Tile t)
{
  return new AgentTile(t);
}
