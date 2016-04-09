import java.util.Scanner;
public class LevelData {
  byte[][] currentLevel = new byte[10][10];
  Scanner in;
  MapBlock mb;
  ArrayList<Item> items = new ArrayList<Item>();
  int playerX,playerY;
  Player player;
  
  LevelData() {
    try{
      in = new Scanner(new File(dataPath("singlePlayerLevels.txt")));
  }catch(Exception e){
    print(e);
  }
}
  MapBlock[][] loadNewLevel() { //<>//
    MapBlock[][] blocks = new MapBlock[10][10];
    try{
      for(int i=0;i<10;i++) {
        for(int j=0;j<10;j++) {
          byte num = in.nextByte();
          currentLevel[i][j] = num;
          blocks[i][j] = loadBlock(num, i, j);
        }
      }
      
    }catch(Exception e) {
      print(e);
    }
    return blocks;
  }
  
  MapBlock[][] resetLevel() {
    MapBlock[][] blocks = new MapBlock[10][10];
    for(int i=0; i<10;i++) {
      for(int j=0;j<10;j++) {
        blocks[i][j] = loadBlock(currentLevel[i][j], i, j);
      }
    }
    return blocks;
  }
  
  MapBlock loadBlock(byte tileID, int i, int j) {
    switch(tileID) {
      case 0: return new MapBlock(i,j,"tile0.png", false,false);
      case 1: return new MapBlock(i,j,"tile1.png",true,false);
      case 2: return new MapBlock(i,j,"tile2.png", true,false);
      case 3: player = new Player(i,j,"Circle.png");
              return new MapBlock(i,j,"tile1.png", true,false);
      case 4: mb = new MapBlock(i,j,"tile1.png",true,false); mb.addItem(new Box(i,j));
              return mb;
      case 14: mb = new MapBlock(i,j,"tile1.png",false,false);
               mb.addItem(new Gate(i,j,GateColor.BLUE)); return mb;
      case 16: mb = new MapBlock(i,j,"tile1.png",false,false);
               mb.addItem(new Gate(i,j,GateColor.GREEN)); return mb;
      case 18: mb = new MapBlock(i,j,"tile1.png",false,false);
               mb.addItem(new Gate(i,j,GateColor.RED)); return mb;
      case 20: mb = new MapBlock(i,j,"tile1.png",false,false);
               mb.addItem(new Gate(i,j,GateColor.YELLOW)); return mb;
      case 21: return  new MapBlock(i,j,"tile21.png",false,true);
    }
    return null;
  }
  
  Player getPlayer() {
    return player;
  }



}