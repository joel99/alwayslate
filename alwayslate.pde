int buttonGap;
color rectColor, bgColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;
Button[] buttons, buttons2;
int gameState;
PImage bg;

void setup() {
  bg = loadImage("bg.jpg");
  image(bg,0,0);
  size(1600, 900);
  rectColor = color(0);
  rectHighlight = color(51);
  int startX = width * 3 / 10;
  int startY = 300;
  int bWidth = 200;
  int bHeight = 50;
  buttonGap = bHeight + 25;
  String[] buttonNames = {"Play", "Exit"};
  String[] buttonNames2 = {"Back"};
  buttons = new Button[buttonNames.length];
  buttons2 = new Button[buttonNames2.length];
  for (int i = 0; i < buttonNames.length; i++){
    buttons[i] = new Button(buttonNames[i], startX, startY, bWidth, bHeight);
    startY += buttonGap;
  }
  startY = 300;
  for (int i = 0; i < buttonNames2.length; i++) {
    buttons2[i] = new Button(buttonNames2[i], startX, startY, bWidth, bHeight);
  }
  dispButtons(buttons);
}

void draw() {
  if (gameState == 0) {
  update(mouseX, mouseY);
  image(bg,0,0);
  dispButtons(buttons);
  }
  else if (gameState == 1) {
    update(mouseX, mouseY);
    background(0);
    dispButtons(buttons2);
  }
}

void update(int x, int y) {
  for (int i = 0; i < buttons.length; i++){
    if (overButton(buttons[i])) {
      buttons[i].highlight = true;
      rectOver = true;
    }
    else {
      buttons[i].highlight = false;
      rectOver = false;
    }
  }
  if (overButton(buttons2[0])) {
    buttons2[0].highlight = true;
    rectOver = true;
  }
  else {
    buttons2[0].highlight = false;
    rectOver = false;
  }
}

void mousePressed() {
  if (overButton(buttons[0]) && mouseButton == LEFT)
    gameState = 1;
  else if (overButton(buttons[1]) && mouseButton == LEFT)
    exit();
  else if (overButton(buttons2[0]) && mouseButton == RIGHT)
    gameState = 0;
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