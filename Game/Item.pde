public abstract class Item {
   private int col,row;
   private String picture;
   private boolean allowVisitors, pushable;
   
   public Item(int col, int row,  
               String picture, 
               boolean allowVisitors, 
               boolean pushable) {
     this.col = col;
     this.row = row;
     this.picture = picture;
     this.allowVisitors = allowVisitors;
     this.pushable = pushable;
   }
   
}