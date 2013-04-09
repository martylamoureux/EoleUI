public class UIControl {
  protected UIView view;
  public String tag = "";
  protected int id;
  protected boolean visible = true;
  
  public UIControl(UIView v) {
    this.view = v;
    this.id = int(random(1000,9999));
   }
   
   public String getTag() { return this.tag; }
   public int getId() { return this.id; }
   
   public void setTag(String value) { this.tag = value; }
   
   public void show() { this.visible = true; }
   public void hide() { this.visible = false; }
   
   public boolean isFocused() { return this.id == this.view.focusId; }
   public boolean isVisible() { return this.visible; }
   
   public void resetControl() {
     this.show();
     this.setTag("");
     this.id = int(random(1000,9999));
   }
  
}

public class UIAnchor {
  public int horizontal;
  public int vertical;
  
  public UIAnchor() {
    this.horizontal = LEFT;
    this.vertical = TOP;
  }
  
  public UIAnchor(int h) {
    this.horizontal = h;
    this.vertical = TOP;
  }
  
  public UIAnchor(int h, int v) {
    this.horizontal = h;
    this.vertical = v;
  }
}
