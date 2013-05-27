public class UINestedFrame extends UIPositionnableControl implements IUIControl {
  
  public UIView view;
  
  public UILabel(UIView view, int x, int y, UIView nestedView) {
    super(view);
    this.x = x;
    this.y = y;
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
    min = 0;
    max = 100;
    value = 0;
  }
}
