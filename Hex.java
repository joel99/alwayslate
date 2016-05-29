import java.util.ArrayList;

public class Hex {

  public int x, y;
  private int num;
  private int resource; //0: Wheat 1: Wood 2: Rock 3: Sheep 4: Brick
  private boolean blocked;
  private Node[] nodes;

  public Hex() {
    x = 0;
    y = 0;	
    blocked = false;
    nodes = new Node[6];
    num = 0;
    resource = -1;
  }

  public int getNum() {
    return num;
  }

  public int getResource() {
    return resource;
  }

  public void setNum(int x) {
    num = x;
  }

  public void setLoc(int x, int y) {
    this.x = x;
    this.y = y;
  }

  public void setResource(int res) {
    resource = res;
  }

  public boolean isBlocked() {
    return blocked;
  }

  public void block() {
    blocked = true;
  }

  public void unblock() {
    blocked = false;
  }

  public void setNode(int i, Node n) {
    nodes[i] = n;
  }

  public Node getNode(int i) {
    return nodes[i];
  }
}