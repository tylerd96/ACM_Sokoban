class LevelData {
  byte[][] grid = {{0,0,1,1,0,0,0,1,1,0},
                     {1,1,1,0,0,0,0,0,1,0},
                     {0,0,1,1,0,0,0,1,1,0},
                     {1,1,1,0,0,0,0,0,1,0},
                     {1,1,1,0,0,0,0,0,1,0},
                     {0,0,1,1,0,0,0,1,1,0},
                     {0,0,1,1,0,0,0,1,1,0},
                     {1,1,1,0,0,0,0,0,1,0},
                     {1,1,1,0,0,0,0,0,1,0},
                     {0,0,1,1,0,0,0,1,1,0}};
  
  LevelData () {}
  
  boolean isOpen(int x, int y) {
    println("testing isOpen: " + x + ", " + y);
    if (x < 0 || x > 9 || y < 0 || y > 9)
      return false;
    return grid[x][y] == 1;
  }
  
  boolean isBox(int x, int y) {
    return false;
  }
  
  int getTile(int x, int y) {
    return grid[x][y];
  }
}