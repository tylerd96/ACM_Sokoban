import java.util.Scanner;
class LevelData {
  byte[][] currentLevel = new byte[10][10];
  byte[][] backupLevel = new byte[10][10];
                     
  ArrayList<Box> boxes = new ArrayList<Box>();
  
  LevelData () {
    boxes.add(new Box(3, 2));
    boxes.add(new Box(8, 8));
  }
  
  boolean isOpen(int x, int y) {
    println("testing isOpen: " + x + ", " + y);
    if (x < 0 || x > 9 || y < 0 || y > 9)
      return false;
    return currentLevel[x][y] == 1;
  }
  
  boolean isFinish(int x,int y) {
    return currentLevel[x][y] == 2;
  }
  
  void loadNewLevel() {
    Scanner in = null;
    try {
    in = new Scanner(new File(dataPath("singlePlayerLevels.txt")));
    for(int i=0;i<10;i++) {
      for(int j=0;j<10;j++) {
        byte num = in.nextByte();
        currentLevel[i][j] = num;
        backupLevel[i][j] = num;
        print(num);
      }
    }
    in.close();
    
    }
    catch(Exception e) {
      print(e);
    } finally{
      if(in!=null)in.close();
    }
    
  }
  boolean isBox(int x, int y) {
    for (int i = 0; i < boxes.size(); i++) {
      if (boxes.get(i).xPosition == x && boxes.get(i).yPosition == y)
        return true;
    }
    return false;
  }
  
  int getTile(int x, int y) {
    return currentLevel[x][y];
  }
}