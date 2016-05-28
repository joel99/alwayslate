public class Hex {

    private int num;
    private String resource;
    private boolean blocked;
    private Node[] nodes;

    public Hex() {
      	blocked = false;
	nodes = new Node[6];
	num = 0;
	resource = "";
	hexes = new Hex[3];
    }

    public int getNum() {
	return num;
    }

    public String getResource() {
	return resource;
    }

    public void setNum(int x){
	num = x;
    }

    public void setResource(String res){
	resource = res;
    }

    public boolean isBlocked() {
	return blocked;
    }

    public void block() {
	isBlocked = true;
    }

    public void unblock() {
	isBlocked = false;
    }
    
    public void setNode(int i, Node n){
	nodes[i] = n;
    }
    
    public Node getNode(int i){
	return nodes[i];
    }

}
