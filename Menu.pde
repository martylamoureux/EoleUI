public class UIMenu extends UISizeableControl implements IUIControl {
  
  
  
  public void register() {
    this.view.addControl(this);
  }
  
  public void reset() {
    resetControl();
  }
  
}

public class UIMenuItem extends UISizeableControl implements IUIControl {
  
}
