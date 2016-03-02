import java.util.Scanner;
class LevelData {
  byte[][] currentLevel = new byte[10][10];
  byte[][] backupLevel = new byte[10][10];
  Scanner in;           
  ArrayList<Box> boxes = new ArrayList<Box>();
  
  // switch-related variables. color indices: blue = 0, green = 1, red = 2, yellow = 3
  byte[] offSwitches = new byte[4];
  int[] gateCoordsX = new int[4];
  int[] gateCoordsY = new int[4];
  
  LevelData () {
    try{
    in = new Scanner(new File(dataPath("singlePlayerLevels.txt")));
    } catch (Exception e){
      print(e);
    }
  }
  
  boolean isOpen(int x, int y) {
    //println("testing isOpen: " + x + ", " + y);
    if (x < 0 || x > 9 || y < 0 || y > 9)
      return false;
    int a = getTile(x, y);
    return !(a == 0 || a == 14 || a == 16 || a == 18 || a == 20 || a == 21 || a > 22);
  }
  
  boolean isOpenForBox(int x, int y) {
    if (x < 0 || x > 9 || y < 0 || y > 9)
      return false;
    int a = getTile(x, y);
    return !(a == 0 || a == 14 || a == 16 || a == 18 || a == 20 || a > 22);
  }
  
  void loadNewLevel() {
    
    try {
    for(int i=0;i<10;i++) {
      for(int j=0;j<10;j++) {
        byte num = in.nextByte();
        //currentLevel[i][j] = num;
        backupLevel[i][j] = num;
        //print(num);
      }
    }
    //in.close();
    loadFromBackup();
    }
    catch(Exception e) {
      print(e);
    } finally{
      //if(in!=null)in.close();
    }
    
  }
  
  void resetLevel() {
   loadFromBackup();
  }
  
  void loadFromBackup() {
    boxes = new ArrayList<Box>();
    offSwitches[0] = 0; offSwitches[1] = 0; offSwitches[2] = 0; offSwitches[3] = 0;
    for(int i=0;i<10;i++) {
      for(int j=0;j<10;j++) {
        byte tileValue = backupLevel[i][j];
        currentLevel[i][j] = tileValue;
        switch (tileValue) {
          case 3:
            playerX = i;
            playerY = j;
            currentLevel[i][j] = 1;
            break;
          case 4:
            boxes.add(new Box(i, j));
            currentLevel[i][j] = 1;
            break;
          case 6:
            offSwitches[0]++;
            break;
          case 8:
            offSwitches[1]++;
            break;
          case 10:
            offSwitches[2]++;
            break;
          case 12:
            offSwitches[3]++;
            break;
          case 14:
            gateCoordsX[0] = i;
            gateCoordsY[0] = j;
            break;
          case 16:
            gateCoordsX[1] = i;
            gateCoordsY[1] = j;
            break;
          case 18:
            gateCoordsX[2] = i;
            gateCoordsY[2] = j;
            break;
          case 20:
            gateCoordsX[3] = i;
            gateCoordsY[3] = j;
            break;
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
  
  void destroyBox(int boxID) {
    boxes.remove(boxID);
  }
  
  int getTile(int x, int y) {
    return currentLevel[x][y];
  }
  
  void setTile(int x, int y, int value) {
    currentLevel[x][y] = (byte) value;
  }
}