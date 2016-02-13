//Render levelDrawer;
int levelIndex, moveLength,lastMove;
String playerName;
PImage playerImage;
LevelData levelData;

PImage[] tiles;
PImage boxImage;
int originX;
int originY;
int tileSize;

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
  tiles = new PImage[3];
  boxImage = loadImage("box.png");
  for (int i = 0; i < 3; i++)
    tiles[i] = loadImage("tile" + i + ".png");
  print("hello world");
  playerName = "Circle.png";
  playerImage = loadImage(playerName);
  levelIndex = 2;
  
  //levelDrawer = new Render(levelIndex, playerName);
  //levelDrawer.playerPosition(playerX, playerY);
  tileSize = (int) (height * 0.07);
  originX = (int) (width * 0.5 - height * 0.35);
  originY = (int) (height * 0.15);
  
  //moveLength = levelDrawer.getMoveLength();
  //print(moveLength);
  levelData = new LevelData();
  background(255,0,0);
  drawLevel();
  drawPlayer();
}

void drawLevel() {
  for (int row = 0; row < 10; row++) {
    for (int column = 0; column < 10; column++) {
      image(tiles[levelData.getTile(row, column)], originX + column * tileSize, originY + row * tileSize, tileSize, tileSize);
      if (levelData.isBox(row, column))
        image(boxImage, originX + column * tileSize, originY + row * tileSize, tileSize, tileSize);
    }
  }
}

void drawTile(int x, int y) {
  image(tiles[levelData.getTile(x, y)], originX + y * tileSize, originY + x * tileSize, tileSize, tileSize);
}

void drawPlayer() {
  image(playerImage, originX + playerY * tileSize, originY + playerX * tileSize, tileSize, tileSize);
}

void draw () {
  frameCount++;
  //println(frameCount);
  //background(255,0,0);
  //levelDrawer.drawLevel();
  //levelDrawer.move(moveLength);
  if(millis()-lastMove>500){
    keyPressed();
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
  drawPlayer();
  drawTile(playerX - addX, playerY - addY);
  //levelDrawer.playerPosition(playerX, playerY);
}
void keyPressed() {
 if (allowInput && keyPressed) { // player input
    //print(key);
    switch (key) {
      case MOVE_UP:
        tryToMove(-1, 0);
        break;
      case MOVE_DOWN:
        tryToMove(1, 0);
        break;
      case MOVE_LEFT:
        tryToMove(0, -1);
        break;
      case MOVE_RIGHT:
        tryToMove(0, 1);
        break;
    }
  } 
  lastMove = millis();
}