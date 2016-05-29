public class Button {

  public int startX, startY;
  public int w, h;
  public String text;
  public boolean highlight; 

  public Button(String name, int x, int y, int wid, int hei) {
    text = name;
    startX = x;
    startY = y;
    w = wid;
    h = hei;
    highlight = false;
  }
}