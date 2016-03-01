public abstract class Item {
   public int col,row;
   public PImage picture;
   public boolean allowVisitors, pushable;
   
   public Item(int col, int row,  
               String picture, 
               boolean allowVisitors, 
               boolean pushable) {
     this.col = col;
     this.row = row;
     this.picture = loadImage(picture);
     this.allowVisitors = allowVisitors;
     this.pushable = pushable;
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
   public PImage getPicture() {
     return picture;
   }
}