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

void dispButtons(Button[] buttons){
  for (int i = 0; i < buttons.length; i++)
    dispButton(buttons[i]);
}

void dispHex(Hex h){
  polygon(h.x, h.y, 75, 6);
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;  
  beginShape();
  /*
  for (float a = PI/3; a < TWO_PI + PI/3; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }*/
  vertex(x+cos(PI/6)*radius,y+sin(PI/6)*radius);
  vertex(x+cos(PI/2)*radius,y+sin(PI/2)*radius);
  vertex(x+cos(5*PI/6)*radius,y+sin(5*PI/6)*radius);
  vertex(x+cos(7*PI/6)*radius,y+sin(7*PI/6)*radius);
  vertex(x+cos(3*PI/2)*radius,y+sin(3*PI/2)*radius);
  vertex(x+cos(11*PI/6)*radius,y+sin(11*PI/6)*radius);
  endShape(CLOSE);
}