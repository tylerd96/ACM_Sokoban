public class MapBlock {
   public final int SIZE = (int)(height*.7);
   public int row,col;
   public boolean allowVisitors,visible;
   public PImage picture;
   public ArrayList<Item> items = new ArrayList<Item>();
  
   public MapBlock(int row,
                   int col,
                    String picture, 
                    boolean allowVisitors) {
    this.col = col;
    this.row = row;
    this.picture = loadImage(picture);
    this.allowVisitors = allowVisitors;
     
   }
   public void removeItem(int i) {
     if(i>=0 && i<items.size()) items.remove(i);     
   }
   public void addItem(Item item) {
     items.add(item);
   }
   public PImage getImage() {
     return picture;
   }
   public int getCol() {
     return col;
   }
   public int getRow() {
     return row;
   }
   public boolean isMoveable() {
     return allowVisitors;
   }
   public ArrayList<Item> getItemList() {
     return items;
   }
  
}