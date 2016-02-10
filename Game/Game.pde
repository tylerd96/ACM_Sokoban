Render levelDrawer;
int levelIndex, moveLength;
String playerName;
LevelData levelData;

int playerX = 2;
int playerY = 2;
// for this game, x represents which row (0-9) and y represents which column (0-9)

// controls:
final char MOVE_UP = 'w';
final char MOVE_DOWN = 's';
final char MOVE_LEFT = 'a';
final char MOVE_RIGHT = 'd';

boolean allowInput = true; // we may need to set this to false during animations

int frameCount = 0;

void setup() {
  size(displayWidth,displayHeight);
  print("hello world");
  playerName = "Circle.png";
  levelIndex = 2;
  
  levelDrawer = new Render(levelIndex, playerName);
  levelDrawer.playerPosition(playerX, playerY);
  
  moveLength = levelDrawer.getMoveLength();
  print(moveLength);
  levelData = new LevelData();
}

void draw () {
  frameCount++;
  println(frameCount);
  background(255,0,0);
  //levelDrawer.drawLevel();
  //levelDrawer.move(moveLength);
  if (allowInput && keyPressed) { // player input
    //print(key);
    switch (key) {
      case MOVE_UP:
        tryToMove(0, -1);
        break;
      case MOVE_DOWN:
        tryToMove(0, 1);
        break;
      case MOVE_LEFT:
        tryToMove(-1, 0);
        break;
      case MOVE_RIGHT:
        tryToMove(1, 0);
        break;
    }
  }
  
}

void tryToMove(int addX, int addY) {
  if (levelData.isOpen(playerX + addX, playerY + addY)) {
    println("move there!");
    move(addX, addY, false);
  }
  else if (levelData.isBox(playerX + addX, playerY + addY) && levelData.isOpen(playerX + addX * 2, playerY + addY * 2)) {
    println("push box and move");
    move(addX, addY, true);
  }
  else
    println("can't move");
}

void move(int addX, int addY, boolean isPushing) {
  // check for pulling
  
  playerX += addX;
  playerY += addY;
  levelDrawer.playerPosition(playerX, playerY);
}