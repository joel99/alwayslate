import java.util.ArrayList;
import java.util.Stack;

public class Game {

  public ArrayList<Player> players;
  private boolean started;
  private boolean win;
  private Board board;

  public Game(Board b) {
    players = new ArrayList<Player>();
    started = false;
    win = false;
    board = b;
  }

  public void addPlayer(String x) {
    players.add(new Player(x));
  }

  public void play() {
    // GAME START: PLAYERS PICK 2 SETTLEMENTS AND ROADS
    /*
	while (!started) {
     	    Stack<Player> x = new Stack<Player>();
     	    Stack<Player> backX = new Stack<Player>();
     	    for (int i = 0; i < players.length(); i++) {
     		Player a = players.get(i);
     		//pick a settlement
     		//picka  road
     		x.push(a);
     	    }
     	    while (!x.empty()) {
     		Player a = x.pop();
     		// pick a settlement
     		//pick a road
     		//receive resourcs from the hexes
     		
     	    }
     	    started = true;
     	}
     
    //GAME CONTINUES: ROLL DIE, TAKE TURNS
    while (!win) {
      int d = Math.random() * 6;
      int e = Math.random() * 6;
      int dice = d + e;
      // get board info ??? need acccessors
      // for (int i = 0; i < board.
    }
    */
  }
}