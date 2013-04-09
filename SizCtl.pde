public class UISizeableControl extends UIPositionnableControl {
  public int width = 0;
  public int height = 0;
  
  public int getWidth() { return this.width; }
  public int getHeight() { return this.height; }
  
  public void setWidth(int value) { this.width = value; }
  public void setHeight(int value) { this.height = value; }
  
  public UISizeableControl(UIView view) {
    super(view);
  }
  
  public boolean isHovered() {
     PApplet applet = this.view.getApplet();
     return (applet.mouseX >= x && applet.mouseX <= (x+width) && applet.mouseY >= y && applet.mouseY <= (y+height));
  }
  
}
