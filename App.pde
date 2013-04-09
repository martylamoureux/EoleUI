public final class UIApp {
  UIView view;
  PApplet applet;
  private int windowWidth;
  private int windowHeight;
  HashMap<String, UIView> views = new HashMap<String, UIView>();
  
  public UIApp(PApplet a, int w, int h) {
    this.windowWidth = w;
    this.windowHeight = h;
    this.applet = a;
    a.size(w, h);
    a.smooth();
  }
  
  public final void setView(UIView view) {
    view.setApp(this);
    this.view = view;
    this.view.show();
  }
  
  public final void setView(String viewName) {
    this.setView(views.get(viewName));
  }
  
  public UIView getView() {
    return view;
  }
  
  public PApplet getApplet() {
    return this.applet;
  }
  
  public void addView(String n, UIView v) { views.put(n, v); }
  
  public void draw() {
    this.view.draw();
  }
  
  public void mousePressed() {
    this.getView().mousePressed();
  }
  
  public void mouseReleased() {
    this.getView().mouseReleased();
  }
  
  public boolean isProcessing2() { return (P3D == OPENGL); }
}
