class UIView {
  UIApp app;
  private int windowWidth;
  private int windowHeight;
  public color backColor = #ffffff;
  
  private ArrayList<IUIControl> controls = new ArrayList<IUIControl>();
  
  public UIView(int w, int h) {
    this.windowWidth = w;
    this.windowHeight = h;
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
    this.controls.add(c);
  }
  
  public void show() {
    this.app.getApplet().size(windowWidth, windowHeight); //<>//
  }
  
  public void draw() {
    this.getApplet().background(this.backColor);
    for (IUIControl c : this.controls)
      c.draw();
  }
}
