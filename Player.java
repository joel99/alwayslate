import java.util.ArrayList;

public class Player {

  //0: Wheat 1: Wood 2: Rock 3: Sheep 4: Brick
  private int[] resources;
  private ArrayList<Node> settlements;
  public ArrayList<String> eventQueue;
  private String name;

  public Player(String x) {
    name = x;
    resources = new int[5];
    settlements = new ArrayList<Node>();
    eventQueue = new ArrayList<String>();
  }

  public void buyRoad() {
    if (resources[1] > 0 && resources[4] > 0) {
    }
  }

  public void buySettlement() {
  }

  public void buyCity() {
  }


  public void addEvent(String a) {
    eventQueue.add(a);
  }

  public String nextEvent() {
    return eventQueue.remove(0);
  }
}