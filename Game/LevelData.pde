import java.util.Scanner;
public class LevelData {
  byte[][] currentLevel,backupLevel = new byte[10][10];
  Scanner in;
  MapBlock mb;
  ArrayList<Item> items = new ArrayList<Item>();
  
  LevelData() {
    try{
      in = new Scanner(new File(dataPath("singlePlayerLevels.txt")));
  }catch(Exception e){
    print(e);
  }
}
  void loadNewLevel() {
    try{
      for(int i=0;i<10;i++) {
        for(int j=0;j<10;j++) {
          byte num = in.nextByte();
          backupLevel[i][j] = num;
          if(num == 4) {
             items.add(new Box(i,j));
             currentLevel[i][j] =1;
          }
          else if(num ==3) {
             playerX = i;
             playerY = j;
            currentLevel[i][j] = 1;
          }
          else
            currentLevel[i][j] = 1;
        }
      }
      
    }catch(Exception e) {
      print(e);
    }
  }
  
  void loadFromBackup() {
    for(int i=0; i<10;i++) {
      for(int j=0;j<10;j++) {
        byte num = backupLevel[i][j];
        if(num == 4) {
             items.add(new Box(i,j));
             currentLevel[i][j] =1;
          }
          else if(num ==3) {
             playerX = i;
             playerY = j;
            currentLevel[i][j] = 1;
          }
          else
            currentLevel[i][j] = 1;
      }
    }
    
  }





}