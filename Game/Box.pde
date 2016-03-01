public class Box extends Item {
  //int row,col;
  public Box(int col, int row) {
    super(col, row, "box.png", false,true); 
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
  
  
  
}