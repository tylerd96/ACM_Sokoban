byte[][] currentLevel;
final int SIZE = (int)(height*.07);
ArrayList<MapBlock> blocks = new ArrayList<MapBlock>();
int playerX,playerY;
PImage[] tiles;

final char MOVE_UP = 'w';
final char MOVE_DOWN = 's';
final char MOVE_LEFT = 'a';
final char MOVE_RIGHT = 'd';
final char NEXT = ' ' ;
final char BACK = '\b';
final char RESET_LEVEL = 'r';

void setup() {
  size(displayWidth,displayHeight);
  
  
}
void draw() {
  fill(127,127,255);
  rect(0,0,width,height);
  //fill(255,255,255);
  
  
}