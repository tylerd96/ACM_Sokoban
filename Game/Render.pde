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
    playerSize = (int)(imageSize*.1);
    imagePositionX = (width - imageSize) / 2;
    imagePositionY = (height - imageSize) / 2;
    playerPositionX = (int)((width-imageSize)/2);
    playerPositionY =(int)((height -imageSize)/2);
  }
  int getMoveLength() {
    moveLength = (int)(levelImage.height/10);
    return moveLength;
  }
  void move (int num) {
    playerPositionX+=moveLength;
  }
  void drawLevel() {
    image(levelImage, imagePositionX, imagePositionY, imageSize, imageSize);
    image(playerImage, playerPositionX, playerPositionY, playerSize, playerSize);
  }
  
}