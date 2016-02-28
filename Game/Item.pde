public abstract class Item {
   private String picture;
   private boolean allowVisitors, pushable;
   
   public Item(String picture, boolean allowVisitors, boolean pushable) {
     this.picture = picture;
     this.allowVisitors = allowVisitors;
     this.pushable = pushable;
   }
   
}