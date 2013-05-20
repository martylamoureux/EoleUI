class UITextBox extends UISizeableControl implements IUIControl {
  
  private UILabel label;
  private int margin = 3;
  
  public UITextBox(UIView view, int x, int y, int w) {
    super(view);
    this.construct(x, y, w);
  }
  
  public UITextBox(UIView view, int x, int y) {
    super(view);
    this.construct(x, y, 150);
  }
  
  private void construct(int x, int y, int w) {
    this.x = x;
    this.y = y;
    this.width = w;
    this.height = 24;
    
    this.label = new UILabel(view,0,0);
    this.label.anchor = new UIAnchor(LEFT,CENTER);
    this.label.x = x + margin;
    this.label.y = y + (height/2);
  }
  
  public String getText() {
    return this.label.text;
  }
  
  public void setText(String s) {
    this.label.text = s;
  }
  
  public void draw() {
    PApplet applet = this.view.getApplet();
    
    int w = width+(margin*2);
    int h = height;
    
    if (this.isHovered())
      fill(0xFF);
    else
      fill(0xFF);
      
    if (this.isHovered())
      stroke(#1C34FF);
    else
      stroke(0x66);
      
    applet.rect(x, y, w, h, 3);
    this.label.draw();
  }
  
  public void register() {
    this.view.addControl(this);
  }
  
  public void reset() {
    this.resetControl();
  }
}
