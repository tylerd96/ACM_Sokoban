class Render {
  PImage levelImage;
  PImage playerImage;
  int imagePositionX;
  int imagePositionY;
  int imageSize; // same for x and y
  int playerSize;
  
  Render (int levelIndex, String playerName) {
    levelImage = loadImage("level" + levelIndex + ".png");
    playerImage = loadImage(playerName);
    imageSize = (int) (height * 0.7);
    playerSize = (int) (height *.1);
    imagePositionX = (width - imageSize) / 2;
    imagePositionY = (height - imageSize) / 2;
  }
   {
    
  }
  
  void drawLevel() {
    image(levelImage, imagePositionX, imagePositionY, imageSize, imageSize);
    image(playerImage, imagePositionX, imagePositionY, playerSize, playerSize);
  }
  
}