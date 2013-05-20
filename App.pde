/**
 * <bUIApp is the base class for the EoleUI Library.</b>
 * 
 * @author Marty Lamoureux
 * @version Beta
 */
public final class UIApp {
  /**
   * The currently displayed UIView
   *
   * @see UIView
   */
  UIView view;
  /**
   * The Processing Applet
   */
  PApplet applet;
  /**
   * The width of the window
   */
  private int windowWidth;
  /**
   * The height of the window
   */
  private int windowHeight;
  
  /**
   * A list of saved views, referenced by string identifiers, in order to find
   * more efficently a view.
   *
   * @see UIView
   */
  HashMap<String, UIView> views = new HashMap<String, UIView>();
  
  /**
   * UIApp Constructor
   *
   * @param a
   *    The Proccesing parent Applet
   * @param w
   *    The window width
   * @param h
   *    The window height
   */
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
