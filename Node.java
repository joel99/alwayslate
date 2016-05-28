import java.util.ArrayList;

public class Node {

    private int state;
    //0 - unused
    //1 - settlment
    //2 - city
    private ArrayList<Node> neighbors;
    private ArrayList<Hex> hexes;
    private Player owner;
    private boolean isUsed;

    public Node(){
	isUsed = false;
	neighbors = new ArrayList<>();
	hexes = new ArrayList<>();
	owner = null;
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
    public void addNeighbor(){}
}
