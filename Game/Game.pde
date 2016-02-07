Render levelDrawer;
int levelIndex;
String playerName;

void setup() {
  size(displayWidth,displayHeight);
  print("hello world");
  playerName = "Circle.png";
  levelIndex = 0;
  levelDrawer = new Render(levelIndex, playerName);
}

void draw () {
  background(255,0,0);
  levelDrawer.drawLevel();
  
}