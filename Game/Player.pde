public class Player {
  private final int SIZE = (int)(height*.07);
  private String fileName;
  private int row, col;
  MapBlock mb;
  
  
  
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
}