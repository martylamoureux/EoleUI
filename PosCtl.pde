public class UIPositionnableControl extends UIControl {
  public int x = 0;
  public int y = 0;
  public UIAnchor anchor = new UIAnchor();
  
  public int getX() { return this.x; }
  public int getY() { return this.y; }
  public UIAnchor getAnchor() { return this.anchor; }
  
  public void setX(int value) { this.x = value; }
  public void setY(int value) { this.y = value; }
  public void setAnchor(UIAnchor value) { this.anchor = value; }
  public void setAnchor(int a) { this.anchor = new UIAnchor(a); }
  public void setAnchor(int a, int b) { this.anchor = new UIAnchor(a,b); }
  
  public UIPositionnableControl(UIView view) {
    super(view);
  }
  
}
