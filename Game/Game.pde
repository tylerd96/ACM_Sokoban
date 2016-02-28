//Render levelDrawer;
import java.io.FileNotFoundException;
int moveLength,lastMove;
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
final char NEXT = ' ';
final char BACK = '\b';
final char RESET_LEVEL = 'r';

// game manager:
int menuPage = 1; // 0 is in game, 1 is main menu, 2 is restart level?, 3 is level complete
int levelIndex = -1;

boolean allowInput = true; // we may need to set this to false during animations

void setup() {
  size(displayWidth,displayHeight);
  frameRate(60);
  tiles = new PImage[21];
  boxImage = loadImage("box.png");
  for (int i = 0; i < 21; i++) {
    if (i != 3 || i != 4)
      tiles[i] = loadImage("tile" + i + ".png");
  }
  //print("hello world");
  playerName = "Circle.png";
  playerImage = loadImage(playerName);
  
  //levelDrawer = new Render(levelIndex, playerName);
  //levelDrawer.playerPosition(playerX, playerY);
  tileSize = (int) (height * 0.07);
  originX = (int) (width * 0.5 - height * 0.35);
  originY = (int) (height * 0.15);
  
  //moveLength = levelDrawer.getMoveLength();
  //print(moveLength);
  levelData = new LevelData();
  drawMenu(1);
}

void drawLevel() {
  //levelData.loadNewLevel();
  for (int row = 0; row < 10; row++) {
    for (int column = 0; column < 10; column++) {
      image(tiles[levelData.getTile(row, column)], originX + column * tileSize, originY + row * tileSize, tileSize, tileSize);
      if (levelData.isBox(row, column))
        image(boxImage, originX + column * tileSize, originY + row * tileSize, tileSize, tileSize);
    }
  }
}

void drawMenu(int drawPage) {
  background(127, 127, 255);
  textSize(height / 20);
  switch (drawPage) {
    case 0:
      drawLevel();
      drawPlayer();
      fill(0, 0, 0);
      text("Level " + (levelIndex + 1), 20, height / 20);
      break;
    case 1:
      fill(0, 0, 0);
      text("ACM Grid Game - Main Menu", (width - textWidth("ACM Grid Game - Main Menu")) / 2, height / 3);
      text("New game: SPACE", (width - textWidth("New game: SPACE")) / 2, 2 * height / 3);
      break;
    case 2:
      fill(0, 0, 0);
      text("Reset level?", (width - textWidth("Reset level?")) / 2, height * 0.25);
      text("Reset: SPACE", (width - textWidth("Reset: SPACE")) / 2, height * 0.5);
      text("Cancel: BACKSPACE", (width - textWidth("Cancel: BACKSPACE")) / 2, height * 0.75);
      break;
    case 3:
      text("Level complete!", (width - textWidth("Level complete!")) / 2, height / 3);
      text("Next level: SPACE", (width - textWidth("Next level: SPACE")) / 2, 2 * height / 3);
      break;
  }
  menuPage = drawPage;
}

void drawTile(int x, int y) {
  image(tiles[levelData.getTile(x, y)], originX + y * tileSize, originY + x * tileSize, tileSize, tileSize);
}

void drawBox(int x, int y) {
  image(boxImage, originX + y * tileSize, originY + x * tileSize, tileSize, tileSize);
}

void drawPlayer() {
  image(playerImage, originX + playerY * tileSize, originY + playerX * tileSize, tileSize, tileSize);
}

void draw () {
  //background(255,0,0);
  //levelDrawer.drawLevel();
  //levelDrawer.move(moveLength);
  
  fill(127, 127, 255);
  rect(0, height * 0.85, width, height * 0.15);
  fill(255, 255, 255);
  text("Framerate: " + Math.round(frameRate) + " fps", height * 0.1, height * 0.9);
  
  if(menuPage == 0 && millis()-lastMove>500){
    keyPressed();
  }
  
}

void tryToMove(int addX, int addY) {
  if (levelData.isOpen(playerX + addX, playerY + addY)) {
    int boxThere = levelData.getBoxID(playerX + addX, playerY + addY);
    if (boxThere == -1) { // no box in the way
      move(addX, addY, -1);
      println("normal move");
    }
    else if (levelData.isOpen(playerX + addX * 2, playerY + addY * 2) && !levelData.isBox(playerX + addX * 2, playerY + addY * 2)) { // box in the way, but it can be pushed
      move(addX, addY, boxThere);
      println("box pushing move");
    }
    else { // the box can't be pushed from this angle
      println("can't move");
    }
  }
  else // something in the way of the player moving
    println("can't move");
}

void move(int addX, int addY, int boxID) {
  // check for pulling
  playerX += addX;
  playerY += addY;
  if (boxID != -1) {
    levelData.moveBox(boxID, playerX + addX, playerY + addY);
    drawBox(playerX + addX, playerY + addY);
    drawTile(playerX, playerY);
  }
  drawPlayer();
  drawTile(playerX - addX, playerY - addY);
  if(levelData.isFinish(playerX,playerY)) {
    drawMenu(3);
  }
  //levelDrawer.playerPosition(playerX, playerY);
}

void keyPressed() {
  switch (menuPage) {
    case 0:
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
          case RESET_LEVEL:
            drawMenu(2);
            break;
        }
      } 
      lastMove = millis();
      break;
    case 1:
    // fall through
    case 3:
      if (key == NEXT) {
        println("load");
        levelData.loadNewLevel();
        levelIndex++;
        drawMenu(0);
      }
      break;
    case 2:
      if (key == NEXT) {
        levelData.resetLevel();
        drawMenu(0);
      } else if (key == BACK) {
        drawMenu(0);
      }
      break;
  }
}