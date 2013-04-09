public class UILabel extends UIControl implements IUIControl {
  public int x = 0;
  public int y = 0;
  public String text = "";
  public color foreColor = #000000;
  public PFont font;
  
  public UILabel(UIView view, int x, int y) {
    super(view);
    this.x = x;
    this.y = y;
  }
  
  public void draw() {
    PApplet applet = this.view.getApplet();
    
    if (font != null)
      applet.textFont(this.font);
    applet.fill(foreColor);
    applet.text(text,x,y);
  }
  
  public void register() {
    this.view.addControl(this);
  }
}
