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
  
  /**
   * Switch the displayed view
   *
   * @param view
   *    The view to display
   * @param resetView
   *    if true, resets all controls of the view
   */
  public final void setView(UIView view, boolean resetView) {
    view.setApp(this);
    if (resetView)
      view.reset();
    this.view = view;
    this.view.show();
  }
  
  /**
   * Switch the displayed view
   *
   * @param view
   *    The view to display
   */
  public final void setView(UIView view) {
    this.setView(view, false);
  }
  
  /**
   * Switch the displayed view using his identifier
   *
   * @param view
   *    The view's identifier
   * @param resetView
   *    if true, resets all controls of the view
   *
   * @see UIApp#addView(String, UIVIew)
   */
  public final void setView(String viewName, boolean resetView) {
    this.setView(views.get(viewName));
  }
  
  /**
   * Switch the displayed view using his identifier
   *
   * @param view
   *    The view's identifier
   * @param resetView
   *    if true, resets all controls of the view
   *
   * @see UIApp#addView(String, UIVIew)
   */
  public final void setView(String viewName) {
    this.setView(viewName, false);
  }
  
  /**
   * Returns the currently displayed view
   *
   * @return The currently displayed view
   *
   * @see UIView
   */
  public UIView getView() {
    return view;
  }
  
  
  
  /**
   * Returns the Processing Applet
   *
   * @return The PApplet of the application
   */
  public PApplet getApplet() {
    return this.applet;
  }
  
  /**
   * Register a view using an identifier
   * You will be able to switch to this view only using the identifier
   *
   * @param identifier
   *    The view's identifier
   * @param v
   *    The registered view
   *
   * @see UIApp#setView(String)
   */
  public void addView(String identifier, UIView v) {
    views.put(identifier, v);
  }
  
  /**
   * Draw the current view
   * This method must be called in your main file
   * in the main draw() method
   * e.g. "void draw() { app.draw() }"
   */
  public void draw() {
    this.view.draw();
  }
  
  /**
   * Handle "MousePressed" events in the app
   * This method must be called in your main file
   * in the main mousePressed() method
   * e.g. "void mousePressed() { app.mousePressed() }"
   */
  public void mousePressed() {
    this.getView().mousePressed();
  }
  
  /**
   * Handle "MouseReleased" events in the app
   * This method must be called in your main file
   * in the main mouseReleased() method
   * e.g. "void mouseReleased() { app.mouseReleased() }"
   */
  public void mouseReleased() {
    this.getView().mouseReleased();
  }
  
  /**
   * Know if the running version of Processing is >= 2.0b
   *
   * @return true if the application is upper than 2.0b (false if it's not Processing 2)
   */
  public boolean isProcessing2() { return (P3D == OPENGL); }
}
