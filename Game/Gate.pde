public class Gate extends Item {
  public byte gateColor;
  public Gate(int col, int row, byte gateColor, String img) {
    super(col, row, img, false,false);
    this.gateColor = gateColor;
  }
  
}