byte[][] currentLevel;
MapBlock[][] blocks;
int playerX,playerY,levelIndex=-1, menuPage=1;
final int N_LEVELS = 8;
MapBlock[] tiles;
LevelData levelData;
Player player;

final char MOVE_UP = 'w';
final char MOVE_DOWN = 's';
final char MOVE_LEFT = 'a';
final char MOVE_RIGHT = 'd';
final char NEXT = ' ' ;
final char BACK = '\b';
final char RESET_LEVEL = 'r';
int SIZE, ORIGIN_X, ORIGIN_Y;

final int MOVE_DURATION = 200;
int moveTime = 0;
int moveAddX = 0;
int moveAddY = 0;
Box moveBox = null;
int totMoves;

void setup() {
  size(displayWidth,displayHeight);
  frameRate(60);
  levelData = new LevelData();
  //blocks = levelData.loadNewLevel();
  //print(width*.5 - height*.35);
  SIZE = (int)(height*.07);
  ORIGIN_X = (int)(width*.5 - height*.35);
  ORIGIN_Y = (int)(height*.15);
  drawMenu(menuPage);
}

void draw() {
  if (menuPage == 0) {
    if (moveTime > 0) {
      moveTime -= (int) (1000 / frameRate);
      int animShift = (int) (Math.min((1 - moveTime / (float)MOVE_DURATION), 1) * SIZE);
      drawTile(player.getRow(), player.getCol());
      drawTile(player.getRow() + moveAddX, player.getCol() + moveAddY);
      
      if (moveBox != null) {
        drawTile(player.getRow() + 2 * moveAddX, player.getCol() + 2 * moveAddY);
        drawBox(moveBox, moveAddY * animShift, moveAddX * animShift);
      }
      
      drawPlayer(moveAddY * animShift, moveAddX * animShift);
      
      if (moveTime <= 0) {
        finishMove(moveAddX, moveAddY, moveBox);
        if (menuPage == 0)
          checkInput();
      }
    } else {
      checkInput();
    }
  }
}

void drawPlayer() {
  drawPlayer(0,0);
}

void drawPlayer(int offsetX, int offsetY) {
  player = levelData.getPlayer();
  //System.out.println(player.getRow() + "  " + player.getCol());
  image(player.getImage(), ORIGIN_X+player.getCol()*SIZE+offsetX, ORIGIN_Y + player.getRow()*SIZE+offsetY,SIZE,SIZE);
}

void drawBox(Box box, int offsetX, int offsetY) { // used only for a box that is moving
  image(box.getPicture(), ORIGIN_X+box.getRow()*SIZE+offsetX, ORIGIN_Y + box.getCol()*SIZE+offsetY, SIZE, SIZE);
}

void drawMenu(int drawPage) {
  background(127, 127, 255);
  textSize(height / 20);
  switch (drawPage) {
    case 0: // in game
      drawLevel();
      drawPlayer();
      fill(0, 0, 0);
      text("Level " + (levelIndex + 1), 20, height / 20);
      break;
    case 1: // main menu
      fill(0, 0, 0);
      text("ACM Grid Game - Main Menu", (width - textWidth("ACM Grid Game - Main Menu")) / 2, height / 3);
      text("New game: SPACE", (width - textWidth("New game: SPACE")) / 2, 2 * height / 3);
      break;
    case 2: // level reset
      fill(0, 0, 0);
      text("Reset level?", (width - textWidth("Reset level?")) / 2, height * 0.25);
      text("Reset: SPACE", (width - textWidth("Reset: SPACE")) / 2, height * 0.5);
      text("Cancel: BACKSPACE", (width - textWidth("Cancel: BACKSPACE")) / 2, height * 0.75);
      break;
    case 3: // level complete
      text("Level complete!", (width - textWidth("Level complete!")) / 2, height / 3);
      text("Next level: SPACE", (width - textWidth("Next level: SPACE")) / 2, 2 * height / 3);
      break;
    case 4: // game won
      text("You won!", (width - textWidth("You won!")) / 2, height * 0.25);
      text("You solved the puzzles in a total of " + totMoves + " moves.", (width - textWidth("You solved the puzzles in a total of " + totMoves + " moves.")) / 2, height * 0.5);
      text("To menu: SPACE", (width - textWidth("To menu: SPACE")) / 2, height * 0.75);
      totMoves = 0;
      levelData.closeScanner();
      levelData = new LevelData();
      levelIndex = -1;
  }
  menuPage = drawPage;
}
void checkInput() {
  if(keyPressed) {
    switch(key) {
      case MOVE_UP:      tryMove(-1,0);    break;
      case MOVE_DOWN:    tryMove(1,0);     break;
      case MOVE_LEFT:    tryMove(0,-1);     break;
      case MOVE_RIGHT:   tryMove(0,1);     break;
      case RESET_LEVEL:  drawMenu(2);   break;
    }
  }
}

void tryMove(int addX, int addY) {
  //moveTime = MOVE_DURATION;
  MapBlock block = getBlock(player.getRow() + addX, player.getCol() + addY);
  if (player.isOpen(block)) {
    Box boxThere = block.getBox();
    if (boxThere == null) {
      startMove(addX, addY, null);
    }
    else {
      MapBlock block2 = getBlock(player.getRow() + 2 * addX, player.getCol() + 2 * addY);
      if (block2 != null && block2.isMoveable(true)) {
        block.removeItem(boxThere);
        startMove(addX, addY, boxThere);
      }
    }
  }
  
}

void startMove(int addX, int addY, Box boxThere) {
  moveTime = MOVE_DURATION;
  moveAddX = addX;
  moveAddY = addY;
  moveBox = boxThere;
  totMoves++;
  fill(127, 127, 255);
  rect(0, height * 0.85, width, height * 0.15);
  fill(255, 255, 255);
  text("Moves: " + totMoves, height * 0.1, height * 0.9);
}

void finishMove(int addX, int addY, Box boxThere) {
  player.move(player.getRow() + addX, player.getCol() + addY);
  interact(getBlock(player.getRow(), player.getCol()), false);
  if (menuPage >= 3) // stop processing gameplay if the level has been completed
    return;
  if (boxThere != null) {
    boxThere.move(player.getCol() + addY, player.getRow() + addX);
    getBlock(boxThere.getCol(), boxThere.getRow()).addItem(boxThere);
    interact(getBlock(boxThere.getCol(), boxThere.getRow()), true);
    drawTile(boxThere.getCol(), boxThere.getRow());
  }
  drawTile(player.getRow(), player.getCol());
  
  drawPlayer();
  drawTile(player.getRow() - addX, player.getCol() - addY);
}

void interact(MapBlock space, boolean isBox) {
  if (space.isPit) {
    space.isPit = false;
    space.picture = loadImage("tile22.png");
    space.allowVisitors = true;
    space.removeItem(space.getBox());
  }
  for (Item it : space.items) {
    if (it instanceof Switch) {
      Switch sw = (Switch) it;
      byte c = sw.switchColor;
      if (sw.on) {
        if (levelData.offSwitches[c]++ == 0)
          closeGates(c);
        sw.on = false;
        sw.setPicture("tile" + (6 + 2 * c) + ".png");
      } else {
        if (--levelData.offSwitches[c] == 0)
          openGates(c);
        sw.on = true;
        sw.setPicture("tile" + (5 + 2 * c) + ".png");
      }
    } else if (it instanceof Finish)
      if (!isBox) {
        if (levelIndex >= N_LEVELS - 1)
          drawMenu(4);
        else
          drawMenu(3);
      }
  }
}

void closeGates(byte c) {
  for (MapBlock mb : levelData.gates[c]) {
    mb.allowVisitors = false;
    for (Item it : mb.items)
      if (it instanceof Gate)
        ((Gate) it).setPicture("tile" + (14 + 2 * c) + ".png");
    drawTile(mb.getRow(), mb.getCol());
  }
}

void openGates(byte c) {
  for (MapBlock mb : levelData.gates[c]) {
    mb.allowVisitors = true;
    for (Item it : mb.items)
      if (it instanceof Gate)
        ((Gate) it).setPicture("tile" + (13 + 2 * c) + ".png");
    drawTile(mb.getRow(), mb.getCol());
  }
}

void drawLevel() {
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      drawTile(i, j);
    }
  }
  drawMoveCount();
}

void drawMoveCount () {
  fill(127, 127, 255);
  rect(0, height * 0.85, width, height * 0.15);
  fill(255, 255, 255);
  text("Moves: " + totMoves, height * 0.1, height * 0.9);
}

void drawTile(int x, int y) {
  MapBlock mb = getBlock(x, y);
  image(mb.getImage(), ORIGIN_X + y * SIZE, ORIGIN_Y + x * SIZE, SIZE, SIZE);
  for (Item i : mb.getItemList())
    image(i.getPicture(), ORIGIN_X + y * SIZE, ORIGIN_Y + x * SIZE, SIZE, SIZE);
}

MapBlock getBlock(int x, int y) {
  return (x >= 0 && x <= 9 && y >= 0 && y <= 9) ? blocks[x][y] : null;
}

void keyPressed() {
  switch (menuPage) {
    case 1: case 3:
      if (key == NEXT) {
        blocks = levelData.loadNewLevel();
        levelIndex++;
        drawMenu(0);
      }
      break;
    case 2:
      if (key == NEXT) {
        blocks = levelData.resetLevel();
        drawMenu(0);
      } else if (key == BACK) {
        drawMenu(0);
      }
      break;
    case 4:
      if (key == NEXT)
        drawMenu(1);
  }
}