public class UISlider extends UISizeableControl implements IUIControl {
  private color borderColor = #555555;
  private color focusBorderColor = #1C34FF;
  
  private color backColor = #DDDDDD;
  private color hoverBackColor = #C4EEFF;
  private color pushedBackColor = #3BC7FF;
  
  private color barBorderColor = #bbbbbb;
  private color barBackColor = #eeeeee;
  
  public int min = 0;
  public int max = 100;
  
  private int value = 0;
  private boolean dragging = false;
  
  private UILabel linkedLabel;
  
  public UISlider(UIView view, int x, int y, int w) {
    super(view);
    this.construct(x, y, w);
  }
  
  private void construct(int x, int y, int w) {
    this.x = x;
    this.y = y;
    this.width = w;
    this.height = 32;
  }
  
  public void drag() { dragging = true; }
  public void drop() { dragging = false; }
  public boolean isDragging() { return dragging; }
  
  public void setValue(int v) { value = v; }
  public int getValue() { return value; }
    
  public void linkLabel(UILabel l)
  {
    this.linkedLabel = l;
  }
  
  public void draw() {
    PApplet applet = this.view.getApplet();
    
    // Modify value of slider if its slidPApplet applet = this.view.getApplet();
    if (dragging) {
      int mouseX = applet.mouseX;
      //int mouseY = applet.mouseY;
      
      if (mouseX < x)
        value = min;
      else if (mouseX > (x+width))
        value = max;
      else
        value = int(map(mouseX, x, x+width, min, max))-6;
      if (value < min)
        value = min;
    }
    
    if (linkedLabel != null)
      this.linkedLabel.text = str(value);
    
    // Draw the bar
    applet.stroke(this.barBorderColor);
    applet.fill(this.barBackColor);
    if (this.view.getApp().isProcessing2())
      applet.rect(x, y+11, width, 10, 5);
    else
      applet.rect(x, y+11, width, 10);
    
    // Drawing the Slider
    if (this.isFocused())
      applet.stroke(this.focusBorderColor);
    else
      applet.stroke(this.borderColor);
    
    if (this.isHovered() && !this.isDragging()) {
      applet.fill(this.hoverBackColor);
    } else if (this.isDragging() && this.view.focusId == this.getId()) {
      applet.fill(this.pushedBackColor);
    } else {
      applet.fill(this.backColor);
    }
    int xpos = int(applet.map(value, min, max, x-6, (x+width)-6));
    //int xpos = int(applet.map(value, min, max, x-8, (x+width)+8));
    if (this.view.getApp().isProcessing2())
      applet.rect(xpos, y, 12, 32, 6);
    else
      applet.rect(xpos, y, 12, 32);
  }
  
  public void register() {
    this.view.addControl(this);
  }
  
  public void reset() {
    resetControl();
    min = 0;
    max = 100;
    value = 0;
  }
}
