import java.util.ArrayList;
import java.util.File;
import java.util.FileReader;
import java.util.BufferedReader;

public class Board {

    private Hex[][][] board;
    private ArrayList<int> numbers;

    public Board() {
	int[] nums = {2,3,3,4,4,5,5,6,6,7,8,8,9,9,10,10,11,11,12};
	String[] res = {"wood","brick","rock","wheat","sheep"};

	for (int i = 0; i < nums.length; i++)
	    numbers.add(nums[i]);
	//first in random out numbers

	board = new Hex[7][7][7];
	for (int i = 0; i < board.length; i++){
	    for (int j = 0; j < board[i].length; j++){
		for (int k = 0; k < board[i][j].length; k++){
		    Hex = new Hex();
		}
	    }
	}

	for (int x = 0; x < board.length; x++){
	    for (int y = 0; y < board[x].length; y++){
		for (int z = 0; z < board[x][y].length; z++){
		    for (int a = 0; a < 6; a++){
			if (board[x][y][z].getNode(a) == null){
			    Node n = new Node();
			    switch (a){
				//nodes on hexes labeled clockwise from top - 0
			    case 0:
				if (z != 0 || y + z != 3){
				    board[x + 1, y, z - 1].setNode(4, n);
				}
				if (z != 0 || x + z != 3){
				    board[x, y + 1, z - 1].setNode(2, n);
				}
				break;
			    case 1:
				if (z != 0 || y + z != 3){
				    board[x + 1, y, z - 1].setNode(3,n);
				}
				if (x != 6 || x + z != 9){
				    board
				}
			    }
			}
		    }
		}
	    }
	}

    }

}
