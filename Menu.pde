public class UIMenu extends UISizeableControl implements IUIControl {
  
  public UIMenu(UIView v) {
    super(v);
  }
  
  public void draw() {
    
  }
  
  public void register() {
    this.view.addControl(this);
  }
  
  public void reset() {
    resetControl();
  }
  
}

public class UIMenuItem extends UISizeableControl implements IUIControl {
  UILabel label;
  
  public UIMenuItem(UIView v) {
    super(v);
  }
  
  public void draw() {
    
  }
  
  public void register() {
    this.view.addControl(this);
  }
  
  public void reset() {
    resetControl();
  }
}
