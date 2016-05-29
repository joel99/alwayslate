void dispButton(Button a) {
  if (a.highlight)
    fill(46, 204, 113);
  else
    fill(39, 174, 96);
  stroke(255);
  rect(a.startX, a.startY, a.w, a.h, 2);
  fill(0);
  textSize(16);
  stroke(200);
  text(a.text, a.startX + a.w / 8, a.startY + a.h * 3 / 5);
}

void dispButtons(Button[] buttons) {
  for (int i = 0; i < buttons.length; i++)
    dispButton(buttons[i]);
}

void dispHex(Hex h) {
  polygon(h.x, h.y, 75, 6);
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;  
  beginShape();
  for (float a = PI/6; a < TWO_PI; a += angle) {
   float sx = x + cos(a) * radius;
   float sy = y + sin(a) * radius;
   vertex(sx, sy);
   }
  endShape(CLOSE);
}

void dispBoard(Board b){

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
}