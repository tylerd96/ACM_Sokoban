byte[][] currentLevel;
ArrayList<MapBlock> blocks = new ArrayList<MapBlock>();
int playerX,playerY,levelIndex=0, menuPage=1;
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

void setup() {
  size(displayWidth,displayHeight);
  levelData = new LevelData();
  blocks = levelData.loadNewLevel();
  print(width*.5 - height*.35);
  SIZE = (int)(height*.07);
  ORIGIN_X = (int)(width*.5 - height*.35);
  ORIGIN_Y = (int)(height*.15);
  //drawMenu(menuPage);
}

void draw() {
  fill(127,127,255);
  rect(0,0,width,height);
  //fill(255,255,255);
  drawLevel();
  drawPlayer();
}

void drawPlayer() {
  player = levelData.getPlayer();
  image(player.getImage(), ORIGIN_X+player.getCol()*SIZE, ORIGIN_Y + player.getRow()*SIZE,SIZE,SIZE);
}
void drawMenu(int drawPage) {
  background(127, 127, 255);
  textSize(height / 20);
  switch (drawPage) {
    case 0:
      drawLevel();
      //drawPlayer();
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
void drawLevel() {
  ArrayList<Item> items;
  drawPlayer();
  for(MapBlock mb : blocks) {
    image(mb.getImage(),ORIGIN_X+mb.getCol()*SIZE, ORIGIN_Y + mb.getRow()*SIZE,SIZE,SIZE);
    items = mb.getItemList();
    for(Item i : items){
      image(i.getPicture(), ORIGIN_X+mb.getCol() * SIZE, ORIGIN_Y + mb.getRow()*SIZE,SIZE,SIZE);
    }
  }
}