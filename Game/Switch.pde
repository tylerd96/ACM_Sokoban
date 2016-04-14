public class Switch extends Item {
  public byte switchColor;
  public boolean on;
  public Switch(int col, int row, byte switchColor, boolean on, String img) {
    super(col, row, img, true,false);
    this.switchColor = switchColor;
    this.on = on;
  }
  
}