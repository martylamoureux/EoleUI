class UIFragment {
  UIView view;
  
  public int offsetX = 0;
  public int offsetY = 0;
  
  boolean resetting = false;
  
  protected ArrayList<IUIControl> controls = new ArrayList<IUIControl>();
  
  public UIFragment() {
    this.setup();
  }
  
  public void setup() {}
  
  public void reset() {
    resetting = true;
    for (IUIControl c : this.controls) 
      c.reset();
    this.setup();
    resetting = false;
  }
  
  public UIView getView() {
    return view;
  }
  
  public UIFragment setView(UIView v) {
    this.view = v;
    return this;
  }
  
  public void addControl(IUIControl c) {
    if (!this.controls.contains(c) && !resetting)
      this.controls.add(c);
  }
  
  public void removeControl(IUIControl c) {
    this.controls.remove(c);
  }
  
  public void show() {
    //this.app.getApplet().size(windowWidth, windowHeight); //<>//
  }
  
  public final void mousePressed() {
    this.view.focusId = 0;
    for (IUIControl c : this.controls) {
      UIControl ctl = (UIControl)c;
      if (!ctl.isVisible())
        continue;
      
      if (c instanceof UIButton)
      {
        UIButton btn = (UIButton) c;
        if (!btn.isHovered())
          continue;
        this.view.focusId = ctl.getId();
        this.onButtonClick(btn);
      }
      else if (c instanceof UISlider) {
        UISlider slider = (UISlider) ctl;
        if (!slider.isHovered())
          continue;
        this.view.focusId = ctl.getId();
        slider.drag();
      }
    }
  }
  
  public final void mouseReleased() {
    for (IUIControl c : this.controls) {
      UIControl ctl = (UIControl)c;
      if (ctl.getId() != this.view.focusId)
        continue;
      if (c instanceof UIButton)
      {
        UIButton btn = (UIButton) c;
        this.onButtonClickUp(btn);
      }
      else if (c instanceof UISlider) {
        UISlider slider = (UISlider) ctl;
        slider.drop();
      }
    }
  }
  
  public void onButtonClick(UIButton c) {}
  public void onButtonClickUp(UIButton c) {}
  
  public final void draw() {
    //this.getApplet().background(this.backColor);
    for (IUIControl c : this.controls)
      if (((UIControl)c).isVisible())
        c.draw();
  }
}
