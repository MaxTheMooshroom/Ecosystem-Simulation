float H_V_D_COST = 10;
float DIAG_COT = 14;

enum PathMode
{
  AUTO,
  ON_DRAW
}

class ASTAR
{
  ArrayList<AgentTile> openSet;
  ArrayList<AgentTile> closedSet;
  
  public PathMode mode = PathMode.AUTO;
  
  AgentTile start;
  AgentTile stop;
  
  void RemoveAtIndex(ArrayList arr, int index)
  {
    ArrayList t = new ArrayList();
    for (int i = 0; i < arr.size(); i++)
    {
      if (i == index) i++;
      
      t.add(arr.get(i));
    }
    arr = t;
  }
  
  void Splice(ArrayList<AgentTile> arr, AgentTile at)
  {
    for (int i = arr.size() - 1; i >= 0; i--)
    {
      if (arr.get(i) == at)
      {
        RemoveAtIndex(arr, i);
      }
    }
  }
  
  void AStar(Agent agent, PVector targetPos)
  {
    start = TileToAgentTile(tiles.get((int)agent.position.y).get((int)agent.position.x));
    stop = TileToAgentTile(tiles.get((int)targetPos.y).get((int)targetPos.x));
    
    openSet = new ArrayList<AgentTile>();
    closedSet = new ArrayList<AgentTile>();
    
    if (mode == PathMode.AUTO)
    {
      if (!openSet.isEmpty()) // if there are still unchecked tiles
      {
        int winner = 0;
        for (int i = 0; i < openSet.size(); i++)
        {
          if (openSet.get(i).f < openSet.get(winner).f)
          {
            winner = i;
          }
        }
        AgentTile current = openSet.get(winner);
        
        if (openSet.get(winner) == stop)
        {
          // done
        }
        
        Splice(openSet, current);
        closedSet.add(current);
        
      }
      else
      {
        // no path
      }
    }
    
    openSet.add(start);
  }
}
