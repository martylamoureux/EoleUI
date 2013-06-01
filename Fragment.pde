public class UIFragment extends UIView implements IUIControl {
  
  public void register() {
    this.addControl(this);
  }
  
  public void reset() {
    //resetControl();
    for (IUIControl c : controls)
      c.reset();
  }
  
}
