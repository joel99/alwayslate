import java.util.Stack;
import java.util.ArrayList;
int buttonGap;
color rectColor, bgColor;
color rectHighlight;
Button[] buttons;
int gameState;
PImage bg;
boolean boardDrawn;

void setup() {
  bg = loadImage("bg.jpg");
  image(bg, 0, 0);
  size(1600, 900);
  rectColor = color(0);
  rectHighlight = color(51);
  int startX = width * 3 / 10;
  int startY = 300;
  int bWidth = 200;
  int bHeight = 50;
  buttonGap = bHeight + 25;

  boardDrawn = false;
  String[] buttonNames = {"Play", "Exit"};

  buttons = new Button[buttonNames.length];

  for (int i = 0; i < buttonNames.length; i++) {
    buttons[i] = new Button(buttonNames[i], startX, startY, bWidth, bHeight);
    startY += buttonGap;
  }

  dispButtons(buttons);
}

void draw() {
  switch(gameState) {
    //main menu
  case 0:
    update(mouseX, mouseY);
    image(bg, 0, 0);
    dispButtons(buttons);
    break;

    //main game
  case 1: 
    Board b = new Board();
    update(mouseX, mouseY);
    background(0);
    System.out.println("!!!!!1");
    //let's draw some hexagons
    int ctr = 0;
    int initX = width * 2 / 5;
    int initY = height * 7 / 8;
    int rad = 75;
    int x = initX;
    int y = initY;

    int[] stops = {2, 6, 11, 15, 18};
    int stopCtr = 0;

    for (int i = 0; i < b.board.length; i++) {
      for (int j = 0; j < b.board[i].length; j++) {
        for (int k = 0; k < b.board[i][j].length; k++) {
          if (i + j + k == 6) {
            if (i == 3)
              b.board[i][j][k].setLoc((int)(x-rad*sqrt(3)/2), y-rad*3/2);
            else if (i == 4)
              b.board[i][j][k].setLoc((int)(x-rad*sqrt(3)), y-2*rad*3/2);
            else
              b.board[i][j][k].setLoc(x, y);
            x -= rad * sqrt(3) / 2;
            y -= rad * 3 / 2;              
            ctr++;
            if (ctr > stops[stopCtr]) {
              stopCtr++;
              initX += rad * sqrt(3);
              x = initX;
              y = initY;
            }
          }
        }
      }
    }

    for (int i = 0; i < b.board.length; i++) {
      for (int j = 0; j < b.board[i].length; j++) {
        for (int k = 0; k < b.board[i][j].length; k++) {
          if (i + j + k == 6) {
            for (int a = 0; a < 6; a++) {
              if (!b.board[i][j][k].getNode(a).isInit) {
                int baseX = b.board[i][j][k].x;
                int baseY = b.board[i][j][k].y;
                //add on radius * sin(theta);
                float theta = 2 * PI * a / 6;
                int radius = 75;
                b.board[i][j][k].getNode(a).setLoc((int)(baseX + sin(theta) * radius), (int)( baseY - cos(theta) * radius));
              }
            }
          }
        }
      }
    }

    for (int i = 0; i < b.board.length; i++) {
      for (int j = 0; j < b.board[i].length; j++) {
        for (int k = 0; k < b.board[i][j].length; k++) {
          if (i + j + k == 6) {
            if (b.board[i][j][k].getResource() == 0)
              fill(241, 196, 15);
            else if (b.board[i][j][k].getResource() == 1)
              fill(211, 84, 0);
            else if (b.board[i][j][k].getResource() == 2)
              fill(127, 140, 141);
            else if (b.board[i][j][k].getResource() == 3)
              fill(236, 240, 241);
            else if (b.board[i][j][k].getResource() == 4)               
              fill(192, 57, 43);
            else
              fill(255, 255, 0);
            dispHex(b.board[i][j][k]);
            String n = b.board[i][j][k].getNum() + "";
            int tx = b.board[i][j][k].getX();
            int ty = b.board[i][j][k].getY();
            textSize(32);
            fill(0, 0, 0);
            text(n, tx-15, ty+10);
          }
        }
      }
    }

    Game g= new Game(b);
    g.addPlayer("a");
    g.addPlayer("b");
    gameState++;
    break;
    //Initial distrib

  case 2:
    Player curr = null;
    boolean turnOver = false;
    boolean started = false;
    while (!started) {
      Stack<Player> playersBackward = new Stack<Player>();
      while (!g.players.isEmpty()) {
        curr = g.players.remove(0);
        playersBackward.add(curr);
        //it's current player's turn:
        curr.eventQueue.add("settle");
        curr.eventQueue.add("road");
        while (!turnOver) {
          boolean eventCompleted = false;
          String currEvent = curr.nextEvent();
          while (!eventCompleted) {
            if (currEvent.equals("settle")) {
              for (Node n : b.nodes) {
                if (n.state == 0) {
                  fill(41, 128, 185, .5);
                  Ellipse(n.x, n.y, 5, 5);
                }
              }
            }
          }
        }
      }
    }
    break;

    void update(int x, int y) {
      for (int i = 0; i < buttons.length; i++) {
        if (overButton(buttons[i])) {
          buttons[i].highlight = true;
        } else {
          buttons[i].highlight = false;
        }
      }
      if (gameState == 0) {
        if (mousePressed) {
          if (overButton(buttons[0])) {
            gameState = 1;
          } else if (overButton(buttons[1])) {
            exit();
          }
        }
      }
    }
  }
}