int buttonGap;
color rectColor, bgColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;
Button[] buttons;

void setup() {
  size(1600, 900);
  background(255);
  rectColor = color(0);
  rectHighlight = color(51);
  int startX = width * 3 / 10;
  int startY = 300;
  int bWidth = 200;
  int bHeight = 50;
  buttonGap = bHeight + 25;
  String[] buttonNames = {"Play", "Exit"};
  buttons = new Button[buttonNames.length];
  for (int i = 0; i < buttonNames.length; i++){
    buttons[i] = new Button(buttonNames[i], startX, startY, bWidth, bHeight);
    startY += buttonGap;
  }
  dispButtons(buttons);
}

void draw() {
  background(255);
  update(mouseX, mouseY);
  dispButtons(buttons);
}

void update(int x, int y) {
  for (int i = 0; i < buttons.length; i++){
    if (overButton(buttons[i])) 
      buttons[i].highlight = true;
    else
      buttons[i].highlight = false;
  }
}

void mousePressed() {
  if (rectOver) {
    currentColor = rectColor;
  }
}

boolean overButton(Button b)  {
  if (mouseX >= b.startX && mouseX <= b.startX + b.w && 
      mouseY >= b.startY && mouseY <= b.startY + b.h) {
    return true;
  } else {
    return false;
  }
}

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