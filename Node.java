import java.util.ArrayList;

public class Node {

  public int x, y;
  public boolean isInit;
  public int state;
  //-1 - can't build house
  //0 - unused
  //1 - settlment
  //2 - city
  private ArrayList<Node> neighbors;
  private ArrayList<Hex> hexes;
  private Player owner;

  public Node() {
    neighbors = new ArrayList<>();
    hexes = new ArrayList<>();
    owner = null;
    x = 0;
    y = 0;
    isInit = false;
    state = 0;
  }

  /*
    public void checkRes(int roll){
   	for (Hex h: hexes){
   	    if (h.getNum() == roll){
   		if (!h.isBlocked()){
   		    owner.addRes(h.getResource(), state);
   		}
   	    }
   	}
   }
   
   */
  public void addNeighbor() {
  }

  public void addHex(Hex h) {
    hexes.add(h);
  }

  public void setLoc(int x, int y) {
    this.x = x;
    this.y = y;
    isInit = true;
  }
}