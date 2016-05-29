import java.util.ArrayList;

public class Board {

    private Hex[][][] board;
    private ArrayList<Node> nodes;
    private ArrayList<Integer> numbers;

    public Board() {
	int[] nums = {2,3,3,4,4,5,5,6,6,7,8,8,9,9,10,10,11,11,12};
	String[] res = {"wood","brick","rock","wheat","sheep"};

	//first in random out numbers

	board = new Hex[7][7][7];

	//make hexes
  int x1;
  int y1;
  int ctr = 0;
  
	for (int i = 0; i < board.length; i++){
	    for (int j = 0; j < board[i].length; j++){
		    for (int k = 0; k < board[i][j].length; k++){
          if (i + j + k == 0){}
		        //Hex h = new Hex(x, y);
		    }
	    }
	}
	
	//add nodes to hexes

	for (int x = 0; x < board.length; x++){
	    for (int y = 0; y < board[x].length; y++){
		for (int z = 0; z < board[x][y].length; z++){
		    for (int a = 0; a < 6; a++){
			if ((x + y + z) == 0 && board[x][y][z].getNode(a) == null){
			    Node n = new Node();
			    switch (a){
				//nodes on hexes labeled clockwise from top - 0
			    case 0:
				if (z != 0 || x + z != 3){
				    board[x][y + 1][z - 1].setNode(2, n);
				}
				if (z != 0 || y + z != 3){
				    board[x + 1][y][z - 1].setNode(4, n);
				}
				break;
			    case 1:
				if (z != 0 || y + z != 3){
				    board[x + 1][y][z - 1].setNode(3, n);
				}
				if (x != 6 || x + z != 9){
				    board[x + 1][y - 1][z].setNode(5, n);
				}
				break;
			    case 2:
				if (x != 6 || x + z != 9){
				    board[x + 1][y - 1][z].setNode(4, n);
				}
				if (z != 6 || x + z != 9){
				    board[x][y - 1][z + 1].setNode(0, n);
				}
				break;
			    case 3:
				if (z != 6 || x + z != 9){
				    board[x][y - 1][z + 1].setNode(5, n);
				}
				if (z != 6 || y + z != 9){
				    board[x - 1][y][z + 1].setNode(1, n);
				}
				break;
			    case 4:
				if (z != 6 || y + z != 9){
				    board[x - 1][y][z + 1].setNode(0, n);
				}
				if (y != 6 || y + z != 9){
				    board[x - 1][y + 1][z].setNode(2, n);
				}
				break;
			    case 5:
				if (y != 6 || y + z != 9){
				    board[x - 1][y + 1][z].setNode(1, n);
				}
				if (y != 6 || y + x != 9){
				    board[x][y + 1][z - 1].setNode(3, n);
				}
				break;
			    }
			}
		    }
		}
	    }
	}
	
	//make arraylist of nodes
	
	for (int i = 0; i < board.length; i++){
	    for (int j = 0; j < board[i].length; j++){
		for (int k = 0; k < board[i][j].length; k++){
		    if ((i + j + k) == 0)
			for (int a = 0; a < 6; a++){
			    Node n = board[i][j][k].getNode(a);
			    if (nodes.indexOf(n) == -1)
				nodes.add(n);
			}
		}
	    }
	}
	
	//add hexes to nodes
	for (int i = 0; i < board.length; i++){
	    for (int j = 0; j < board[i].length; j++){
		for (int k = 0; k < board[i][j].length; k++){
		    if ((i + j + k) == 0)
			for (int a = 0; a < 6; a++){
			    board[i][j][k].getNode(a).addHex(board[i][j][k]);
			}
		}
	    }
	}

	//number distribution
	boolean distrib = false;
	while (!distrib){
	    numbers = new ArrayList<>();
	    for (int i = 0; i < nums.length; i++)
		numbers.add(nums[i]);
	
	    for (int i = 0; i < board.length; i++){
		for (int j = 0; j < board[i].length; j++){
		    for (int k = 0; k < board[i][j].length; k++){
			if ((i + j + k) == 0){
			    int randomInt = (int)(Math.random() * numbers.size());
			    board[i][j][k].setNum(numbers.remove(randomInt));
			}
		    }
		}
	    }
	    distrib = true;

	    for (int i = 0; i < board.length-1; i++) {
		for (int j = 0; j < board[i].length-1; j++) {
		    for (int k = 0; k < board[i][j].length-1; k++) {
			if (i + j + k == 0) {
			    if ((board[i][j][k].getNum() == 6 || board[i][j][k].getNum() == 8) && (board[i][j+1][k-1].getNum() == 8 || board[i][j+1][k-1].getNum() == 6 
												   || board[i+1][j][k-1].getNum() == 8 || board[i+1][j][k-1].getNum() == 6 
												   || board[i+1][j-1][k].getNum() == 8 || board[i+1][j-1][k].getNum() == 6))
				distrib = false;
			}
		    }
		}	    
	    }
	}
    }
}