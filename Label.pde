public class UILabel extends UIPositionnableControl implements IUIControl {
  public String text = "";
  public color foreColor = #000000;
  public PFont font;
  public int fontSize = 12;
  
  public UILabel(UIView view, int x, int y) {
    super(view);
    this.x = x;
    this.y = y;
  }
  
  public void draw() {
    PApplet applet = this.view.getApplet();
    
    applet.textSize(this.fontSize);
    if (font != null)
      applet.textFont(this.font);
    applet.fill(foreColor);
    applet.textAlign(anchor.horizontal, anchor.vertical);
    applet.text(text,x,y);
  }
  
  public void register() {
    this.view.addControl(this);
  }
  
  public void reset() {
    this.resetControl();
    text = "";
    foreColor = #000000;
    fontSize = 12;
    font = null;
  }
}
