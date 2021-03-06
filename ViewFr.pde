public class UINestedFrame extends UIPositionnableControl implements IUIControl {
  
  public UIView view;
  
  public UINestedFrame(UIView view, int x, int y, UIView nestedView) {
    super(view);
    this.x = x;
    this.y = y;
    this.view.setApp(view.getApp());
    this.view = nestedView;
    this.view.offsetX = x;
    this.view.offsetY = y;
  }
  
  public void draw() {
    this.view.draw();
  }
  
  public void register() {
    this.view.addControl(this);
  }
  
  public void reset() {
    resetControl();
    this.view = null;
  }
}
