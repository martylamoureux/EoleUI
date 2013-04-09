class UIApp {
  UIView view;
  PApplet applet;
  
  public UIApp(PApplet a) {
    this.applet = a;
  }
  
  public void setView(UIView view) {
    view.setApp(this);
    this.view = view;
    this.view.show();
  }
  
  public UIView getView() {
    return view;
  }
  
  public PApplet getApplet() {
    return this.applet;
  }
  
  public void draw() {
    this.view.draw();
  }
}
