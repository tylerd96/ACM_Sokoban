public class MapBlock {
   private final int SIZE = (int)(height*.07);
   private int row,col;
   private boolean allowVisitors,visible;
   private String picture;
   private ArrayList<Item> items = new ArrayList<Item>();
  
   public MapBlock(int col,
                   int row,
                    String picture, 
                    boolean allowVisitors, 
                    boolean visible) {
    this.col = col*SIZE;
    this.row = row*SIZE;
    this.picture = picture;
    this.allowVisitors = allowVisitors;
    this.visible = visible;
     
   }
   public void removeItem(int i) {
     if(i>=0 && i<items.size()) items.remove(i);     
   }
   public void addItem(Item item) {
     items.add(item);
   }
  
}