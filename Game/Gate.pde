public class Gate extends Item {
  GateColor gateColor;
  public boolean open = false;
  public Gate(int col, int row, GateColor gateColor) {
    super(col, row, "tile14.png", false,true);
    this.gateColor = gateColor;
  }
  
}