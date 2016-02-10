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
    if (x < 0 || x > 10 || y < 0 || y > 10)
      return false;
    return grid[x][y] == 0;
  }
  
  boolean isBox(int x, int y) {
    return false;
  }
}