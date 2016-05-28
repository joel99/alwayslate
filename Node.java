import java.util.ArrayList;

public class Node {

    private int state;
    //0 - unused
    //1 - settlment
    //2 - city
    private ArrayList<Node> neighbors;
    private ArrayList<Hex> hexes;
    private Player owner;

    public Node(){
	isUsed = false;
	neighbors = new ArrayList<>();
	hexes = newArrayList<>();
    }
    
    public void checkRes(int roll){
	for (Hex h: hexes){
	    if (h.getNum() == roll){
		if (h.isOpen()){
		    owner.addRes(h.getResource(), state);
		}
	    }
	}
    }
    
    public void addNeighbor(){}
}
