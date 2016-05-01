import java.util.Scanner;
public class LevelData {
  byte[][] currentLevel = new byte[10][10];
  Scanner in;
  MapBlock mb;
  ArrayList<Item> items = new ArrayList<Item>();
  int playerX,playerY;
  Player player;
  
  public int[] offSwitches = new int[4];
  public ArrayList<MapBlock>[] gates = new ArrayList[4];
  
  LevelData() {
    try{
      in = new Scanner(new File(dataPath("singlePlayerLevels.txt")));
  }catch(Exception e){
    print(e); //<>// //<>// //<>//
  }
}
  MapBlock[][] loadNewLevel() { //<>// //<>//
    MapBlock[][] blocks = new MapBlock[10][10];
    offSwitches = new int[4];
    gates = new ArrayList[4];
    for (int i = 0; i < 4; i++) {
      offSwitches[i] = 0;
      gates[i] = new ArrayList<MapBlock>();
    }

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
    offSwitches = new int[4];
    gates = new ArrayList[4];
    for (int i = 0; i < 4; i++) {
      offSwitches[i] = 0;
      gates[i] = new ArrayList<MapBlock>();
    }
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
      case 2: mb = new MapBlock(i,j,"tile1.png", true,false);
              mb.addItem(new Finish(i,j)); return mb;
      case 3: player = new Player(i,j,"Circle.png");
              return new MapBlock(i,j,"tile1.png", true,false);
      case 4: mb = new MapBlock(i,j,"tile1.png",true,false); mb.addItem(new Box(i,j));
              return mb;
      case 5: mb = new MapBlock(i,j,"tile1.png",true,false);
              mb.addItem(new Switch(i,j,GateColor.BLUE, true,"tile5.png")); return mb;
      case 6: mb = new MapBlock(i,j,"tile1.png",true,false);
              mb.addItem(new Switch(i,j,GateColor.BLUE, false,"tile6.png"));
              offSwitches[GateColor.BLUE]++; return mb;
      case 7: mb = new MapBlock(i,j,"tile1.png",true,false);
              mb.addItem(new Switch(i,j,GateColor.GREEN, true,"tile7.png")); return mb;
      case 8: mb = new MapBlock(i,j,"tile1.png",true,false);
              mb.addItem(new Switch(i,j,GateColor.GREEN, false,"tile8.png"));
              offSwitches[GateColor.GREEN]++; return mb;
      case 9: mb = new MapBlock(i,j,"tile1.png",true,false);
              mb.addItem(new Switch(i,j,GateColor.RED, true,"tile9.png")); return mb;
      case 10: mb = new MapBlock(i,j,"tile1.png",true,false);
              mb.addItem(new Switch(i,j,GateColor.RED, false,"tile10.png"));
              offSwitches[GateColor.RED]++; return mb;
      case 11: mb = new MapBlock(i,j,"tile1.png",true,false);
               mb.addItem(new Switch(i,j,GateColor.YELLOW, true,"tile11.png")); return mb;
      case 12: mb = new MapBlock(i,j,"tile1.png",true,false);
               mb.addItem(new Switch(i,j,GateColor.YELLOW, false,"tile12.png"));
               offSwitches[GateColor.YELLOW]++; return mb;
      case 14: mb = new MapBlock(i,j,"tile1.png",false,false);
               mb.addItem(new Gate(i,j,GateColor.BLUE,"tile14.png"));
               gates[GateColor.BLUE].add(mb); return mb;
      case 16: mb = new MapBlock(i,j,"tile1.png",false,false);
               mb.addItem(new Gate(i,j,GateColor.GREEN,"tile16.png"));
               gates[GateColor.GREEN].add(mb); return mb;
      case 18: mb = new MapBlock(i,j,"tile1.png",false,false);
               mb.addItem(new Gate(i,j,GateColor.RED,"tile18.png"));
               gates[GateColor.RED].add(mb); return mb;
      case 20: mb = new MapBlock(i,j,"tile1.png",false,false);
               mb.addItem(new Gate(i,j,GateColor.YELLOW,"tile20.png"));
               gates[GateColor.YELLOW].add(mb); return mb;
      case 21: return new MapBlock(i,j,"tile21.png",false,true);
      case 23: return new MapBlock(i,j,"tile23.png",false,false);
      case 24: return new MapBlock(i,j,"tile24.png",false,false);
      case 25: return new MapBlock(i,j,"tile25.png",false,false);
      case 26: return new MapBlock(i,j,"tile26.png",false,false);
      case 27: return new MapBlock(i,j,"tile27.png",false,false);
      case 28: mb = new MapBlock(i,j,"tile1.png",true,false);
               mb.addItem(new Switch(i,j,GateColor.BLUE, true,"tile5.png"));
               mb.addItem(new Box(i,j)); return mb;
      case 29: mb = new MapBlock(i,j,"tile1.png",true,false);
              mb.addItem(new Switch(i,j,GateColor.BLUE, false,"tile6.png"));
              offSwitches[GateColor.BLUE]++; mb.addItem(new Box(i,j)); return mb;
      case 30: mb = new MapBlock(i,j,"tile1.png",true,false);
              mb.addItem(new Switch(i,j,GateColor.GREEN, true,"tile7.png"));
              mb.addItem(new Box(i,j)); return mb;
      case 31: mb = new MapBlock(i,j,"tile1.png",true,false);
              mb.addItem(new Switch(i,j,GateColor.GREEN, false,"tile8.png"));
              offSwitches[GateColor.GREEN]++; mb.addItem(new Box(i,j)); return mb;
      case 32: mb = new MapBlock(i,j,"tile1.png",true,false);
              mb.addItem(new Switch(i,j,GateColor.RED, true,"tile9.png"));
              mb.addItem(new Box(i,j)); return mb;
      case 33: mb = new MapBlock(i,j,"tile1.png",true,false);
              mb.addItem(new Switch(i,j,GateColor.RED, false,"tile10.png"));
              offSwitches[GateColor.RED]++; mb.addItem(new Box(i,j)); return mb;
      case 34: mb = new MapBlock(i,j,"tile1.png",true,false);
               mb.addItem(new Switch(i,j,GateColor.YELLOW, true,"tile11.png"));
               mb.addItem(new Box(i,j)); return mb;
      case 35: mb = new MapBlock(i,j,"tile1.png",true,false);
               mb.addItem(new Switch(i,j,GateColor.YELLOW, false,"tile12.png"));
               offSwitches[GateColor.YELLOW]++; mb.addItem(new Box(i,j)); return mb;
    }
    return null;
  }
  
  Player getPlayer() {
    return player;
  }
  
  void closeScanner() {
    in.close();
  }



}