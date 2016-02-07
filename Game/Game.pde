Render levelDrawer;
int levelIndex, moveLength;
String playerName;

void setup() {
  size(displayWidth,displayHeight);
  print("hello world");
  playerName = "Circle.png";
  levelIndex = 2;
  levelDrawer = new Render(levelIndex, playerName);
  moveLength = levelDrawer.getMoveLength();
  print(moveLength);
}

void draw () {
  background(255,0,0);
  levelDrawer.drawLevel();
  
  
}