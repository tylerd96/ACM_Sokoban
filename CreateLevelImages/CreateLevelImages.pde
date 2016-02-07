/* final int[][] levelData = {{0,0,1,1,0,0,0,1,1,0},
                     {1,1,1,0,0,0,0,0,1,0},
                     {0,0,1,1,0,0,0,1,1,0},
                     {1,1,1,0,0,0,0,0,1,0},
                     {1,1,1,0,0,0,0,0,1,0},
                     {0,0,1,1,0,0,0,1,1,0},
                     {0,0,1,1,0,0,0,1,1,0},
                     {1,1,1,0,0,0,0,0,1,0},
                     {1,1,1,0,0,0,0,0,1,0},
                     {0,0,1,1,0,0,0,1,1,0}}; // level 1 */
                     
final int[][] levelData = {{1,1,1,1,1,1,1,1,1,1},
                           {1,1,1,1,1,1,1,1,1,1},
                           {1,1,1,1,1,1,1,1,1,1},
                           {1,1,1,1,1,1,1,1,1,1},
                           {1,1,1,1,1,1,1,1,1,1},
                           {1,1,1,1,1,1,1,1,1,1},
                           {1,1,1,1,1,1,1,1,1,1},
                           {1,1,1,1,1,1,1,1,1,1},
                           {1,1,1,1,1,1,1,1,1,1},
                           {1,1,1,1,1,1,1,1,1,1}}; // level 1

final int numberOfRows = 10;
final int numberOfColumns = 10;
final int tileSize = 16;

PImage[] tiles;
final int numberTiles = 2;

void setup() {
  size(160,160);
  tiles = new PImage[numberTiles];
  for (int i = 0; i < numberTiles; i++) {
    tiles[i] = loadImage("tile" + i + ".png");
  }
  for (int row = 0; row < numberOfRows; row++) {
    for (int column = 0; column < numberOfColumns; column++) {
      image(tiles[levelData[row][column]], column * tileSize, row * tileSize, tileSize, tileSize);
    }
  }
  saveFrame("levelImage.png");
}

void draw () {
  
}