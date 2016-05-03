public class MapBlock {
   public final int SIZE = (int)(height*.7);
   public int row,col;
   public boolean allowVisitors,visible,isPit;
   public PImage picture;
   public ArrayList<Item> items = new ArrayList<Item>();
  
   public MapBlock(int row,
                   int col,
                   String picture, 
                   boolean allowVisitors,
                   boolean isPit) {
    this.col = col;
    this.row = row;
    this.picture = loadImage(picture);
    this.allowVisitors = allowVisitors;
    this.isPit = isPit;
     
   }
   public void removeItem(int i) {
     if(i>=0 && i<items.size()) items.remove(i);     
   }
   public void removeItem(Item item) {
     for(Item i : items) {
       if (i == item) {
         items.remove(i);
         return;
       }
     }
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
   public boolean isMoveable(boolean isBox) {
     return (allowVisitors && (!isBox || !hasBox())) || (isBox && isPit);
   }
   public ArrayList<Item> getItemList() {
     return items;
   }
   public boolean hasBox() {
     for(Item i : items) {
       if(i instanceof Box)
         return true;
     }
     return false;
   }
   public Box getBox() {
     for(Item i : items) {
       if( i instanceof Box)
         return (Box)i;
     }
     return null;
   }
}