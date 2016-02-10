class Render {
  PImage levelImage;
  PImage playerImage;
  int imagePositionX;
  int imagePositionY;
  int playerPositionX, playerOriginX, playerPositionY, playerOriginY, moveLength;
  int imageSize; // same for x and y
  int playerSize;
  
  Render (int levelIndex, String playerName) {
    levelImage = loadImage("level" + levelIndex + ".png");
    playerImage = loadImage(playerName);
    imageSize = (int) (height *.7);
    playerSize = (int)(imageSize*.1);
    imagePositionX = (width - imageSize) / 2;
    imagePositionY = (height - imageSize) / 2;
    playerOriginX = (int)((width-imageSize)/2);
    playerOriginY = (int)((height -imageSize)/2);
    playerPositionX = playerOriginX;
    playerPositionY = playerOriginY;
  }
  int getMoveLength() {
    return playerSize;
  }
  void move (int num) {
    int oldX = playerPositionX;
    int newX = oldX+playerSize;
    for(int i=0;i<10;i++) {
      playerPositionX = (int)lerp(oldX, newX, i/10.0);
      delay(100);
    }
  }
  void drawLevel() {
    image(levelImage, imagePositionX, imagePositionY, imageSize, imageSize);
    image(playerImage, playerPositionX, playerPositionY, playerSize, playerSize);
  }
  
  void playerPosition(int toX, int toY) {
    playerPositionX = playerOriginX + toX * playerSize;
    playerPositionY = playerOriginY + toY * playerSize;
  }
  
}