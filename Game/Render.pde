class Render {
  PImage levelImage;
  int imagePositionX;
  int imagePositionY;
  int imageSize; // same for x and y
  
  Render (int levelIndex) {
    levelImage = loadImage("level" + levelIndex + ".png");
    imageSize = (int) (height * 0.7);
    imagePositionX = (width - imageSize) / 2;
    imagePositionY = (height - imageSize) / 2;
  }
  
  void drawLevel() {
    image(levelImage, imagePositionX, imagePositionY, imageSize, imageSize);
  }
  
}