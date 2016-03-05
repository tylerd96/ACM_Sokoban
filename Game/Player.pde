public class Player {
  private final int SIZE = (int)(height*.07);
  private PImage picture;
  private int row, col;
  MapBlock mb;
  
  public Player(int row, int col, String fileName) {
    this.row = row;
    this.col = col;
    picture = loadImage(fileName);
  }
  
  public void setRow(int row) {
      this.row = row;
  }
  public int getRow() {
    return row;
  }
  public void setCol(int col) {
    this.col = col;
  }
  public int getCol() {
    return col;
  }
  public PImage getImage() {
    return picture;
  }
  public boolean isOpen(MapBlock mb) {
    return mb.isMoveable();
  }
  public void move(int row, int col) {
    this.row = row;
    this.col = col;
  }
  
}