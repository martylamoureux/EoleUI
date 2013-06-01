public class UIFragmentView extends UIPositionnableControl implements IUIControl {
  
  public UIFragment fragment;
  
  public UIFragmentView(UIView view, int x, int y, UIFragment fragment) {
    super(view);
    this.x = x;
    this.y = y;
    this.fragment = fragment;
    this.fragment.setView(view);
    this.fragment.offsetX = x;
    this.fragment.offsetY = y;
  }
  
  public void draw() {
    this.fragment.draw();
  }
  
  public void register() {
    this.view.addControl(this);
  }
  
  public void reset() {
    resetControl();
    this.fragment = null;
  }
}
