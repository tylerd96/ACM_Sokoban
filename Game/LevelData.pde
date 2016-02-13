class LevelData {
  byte[][] grid = new byte[10][10];
                     
                     
  ArrayList<Box> boxes = new ArrayList<Box>();
  
  LevelData () {
    boxes.add(new Box(3, 2));
    boxes.add(new Box(8, 8));
  }
  
  boolean isOpen(int x, int y) {
    println("testing isOpen: " + x + ", " + y);
    if (x < 0 || x > 9 || y < 0 || y > 9)
      return false;
    return grid[x][y] == 1;
  }
  
  boolean isBox(int x, int y) {
    for (int i = 0; i < boxes.size(); i++) {
      if (boxes.get(i).xPosition == x && boxes.get(i).yPosition == y)
        return true;
    }
    return false;
  }
  
  int getTile(int x, int y) {
    return grid[x][y];
  }
}