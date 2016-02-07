class Render {
  PImage levelImage;
  PImage playerImage;
  int imagePositionX;
  int imagePositionY;
  int playerPositionX, playerPositionY, moveLength;
  int imageSize; // same for x and y
  int playerSize;
  
  Render (int levelIndex, String playerName) {
    levelImage = loadImage("level" + levelIndex + ".png");
    playerImage = loadImage(playerName);
    imageSize = (int) (height *.7);
    playerSize = 50;
    imagePositionX = (width - imageSize) / 2;
    imagePositionY = (height - imageSize) / 2;
    playerPositionX = 410;
    playerPositionY =140;
  }
  int getMoveLength() {
    moveLength = (int)(levelImage.height/10);
    return moveLength;
  }
  void drawLevel() {
    image(levelImage, imagePositionX, imagePositionY, imageSize, imageSize);
    image(playerImage, playerPositionX, playerPositionY, playerSize, playerSize);
  }
  
}