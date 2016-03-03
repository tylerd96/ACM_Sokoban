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
  ArrayList<MapBlock> loadNewLevel() {
    MapBlock mb; //<>//
    ArrayList<MapBlock> blocks = new ArrayList<MapBlock>();
    try{
      for(int i=0;i<10;i++) {
        for(int j=0;j<10;j++) {
          byte num = in.nextByte();
          currentLevel[i][j] = num;
          switch(num) {
            case 0: blocks.add(new MapBlock(i,j,"tile0.png", false)); break;
            case 1: blocks.add(new MapBlock(i,j,"tile1.png",true)); break;
            case 2: blocks.add(new MapBlock(i,j,"tile2.png", true)); break;
            case 3: blocks.add(new MapBlock(i,j,"tile1.png", true)); 
                    player = new Player(i,j,"Circle.png"); break;
            case 4: mb = new MapBlock(i,j,"tile1.png",true); mb.addItem(new Box(i,j));
                    blocks.add(mb); break;
          }
        }
      }
      
    }catch(Exception e) {
      print(e);
    }
    return blocks;
  }
  
  ArrayList<MapBlock> resetLevel() {
    ArrayList<MapBlock> blocks = new ArrayList<MapBlock>();
    MapBlock mb;
    for(int i=0; i<10;i++) {
      for(int j=0;j<10;j++) {
        switch(currentLevel[i][j]) {
          case 0: blocks.add(new MapBlock(i,j,"tile0.png", false)); break;
          case 1: blocks.add(new MapBlock(i,j,"tile1.png",true)); break;
          case 2: blocks.add(new MapBlock(i,j,"tile2.png", true)); break;
          case 3: blocks.add(new MapBlock(i,j,"tile1.png", true)); playerX=i;
                  playerY=j; break;
          case 4: mb = new MapBlock(i,j,"tile1.png",true); mb.addItem(new Box(i,j));
                  blocks.add(mb); break;
        }
      }
    }
    return blocks;
  }
  int getPlayerX() {
    return playerX;
  }
  int getPlayerY() {
    return playerY;
  }
  Player getPlayer() {
    return player;
  }



}