
boolean overButton(Button b)  {
  if (mouseX >= b.startX && mouseX <= b.startX + b.w && 
      mouseY >= b.startY && mouseY <= b.startY + b.h) {
    return true;
  } else {
    return false;
  }
}