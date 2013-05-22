class UIView {
  UIApp app;
  public color backColor = #ffffff;
  public int focusId = 0;
  
  boolean resetting = false;
  
  private ArrayList<IUIControl> controls = new ArrayList<IUIControl>();
  
  public UIView() {
    this.setup();
  }
  
  public void setup() {}
  
  public void reset() {
    resetting = true;
    this.getApplet().noLoop();
    for (IUIControl c : this.controls) 
      c.reset();
    this.setup();
    resetting = false;
    this.getApplet().loop();
  }
  
  public void setApp(UIApp a) {
    this.app = a;
  }
  
  public UIApp getApp() {
    return app;
  }
  
  public PApplet getApplet() {
    return this.app.getApplet();
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
    this.focusId = 0;
    for (IUIControl c : this.controls) {
      UIControl ctl = (UIControl)c;
      if (!ctl.isVisible())
        continue;
      
      if (c instanceof UIButton)
      {
        UIButton btn = (UIButton) c;
        if (!btn.isHovered())
          continue;
        focusId = ctl.getId();
        this.onButtonClick(btn);
      }
      else if (c instanceof UISlider) {
        UISlider slider = (UISlider) ctl;
        if (!slider.isHovered())
          continue;
        focusId = ctl.getId();
        slider.drag();
      }
    }
  }
  
  public final void mouseReleased() {
    for (IUIControl c : this.controls) {
      UIControl ctl = (UIControl)c;
      if (ctl.getId() != this.focusId)
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
    this.getApplet().background(this.backColor);
    for (IUIControl c : this.controls)
      if (((UIControl)c).isVisible())
        c.draw();
  }
}
