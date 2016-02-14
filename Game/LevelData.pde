import java.util.Scanner;
class LevelData {
  byte[][] currentLevel = new byte[10][10];
  byte[][] backupLevel = new byte[10][10];
                     
  ArrayList<Box> boxes = new ArrayList<Box>();
  
  LevelData () {
    
  }
  
  boolean isOpen(int x, int y) {
    //println("testing isOpen: " + x + ", " + y);
    if (x < 0 || x > 9 || y < 0 || y > 9)
      return false;
    int a = getTile(x, y);
    return a == 1 || a == 2;
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
        //currentLevel[i][j] = num;
        backupLevel[i][j] = num;
        //print(num);
      }
    }
    in.close();
    loadFromBackup();
    }
    catch(Exception e) {
      print(e);
    } finally{
      if(in!=null)in.close();
    }
    
  }
  
  void resetLevel() {
   loadFromBackup();
  }
  
  void loadFromBackup() {
    boxes = new ArrayList<Box>();
    for(int i=0;i<10;i++) {
      for(int j=0;j<10;j++) {
        byte tileValue = backupLevel[i][j];
        if (tileValue == 4) {
          boxes.add(new Box(i, j));
          currentLevel[i][j] = 1;
        } else if (tileValue == 3) {
          playerX = i;
          playerY = j;
          currentLevel[i][j] = 1;
        } else {
          currentLevel[i][j] = tileValue;
        }
      }
    }
  }
  
  boolean isBox(int x, int y) {
    for (int i = 0; i < boxes.size(); i++) {
      if (boxes.get(i).xPosition == x && boxes.get(i).yPosition == y)
        return true;
    }
    return false;
  }
  
  int getBoxID(int x, int y) {
    for (int i = 0; i < boxes.size(); i++) {
      if (boxes.get(i).xPosition == x && boxes.get(i).yPosition == y)
        return i;
    }
    return -1;
  }
  
  void moveBox(int boxID, int x, int y) {
    boxes.get(boxID).xPosition = x;
    boxes.get(boxID).yPosition = y;
  }
  
  int getTile(int x, int y) {
    return currentLevel[x][y];
  }
}