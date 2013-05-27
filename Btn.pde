public class UIButton extends UISizeableControl implements IUIControl {
  public String text = "";
  public color borderColor = #555555;
  public color focusBorderColor = #1C34FF;
  public color backColor = #DDDDDD;
  public color textColor = #000000;
  
  public color hoverBackColor = #C4EEFF;
  public color hoverTextColor = #000000;
  
  public color pushedBackColor = #3BC7FF;
  public color pushedTextColor = #FFFFFF;
  public UILabel label;
  
  public UIButton(UIView view, int x, int y, int w, int h) {
    super(view);
    this.construct(x, y, w, h);
  }
  
  public UIButton(UIView view, int x, int y, int w) {
    super(view);
    this.construct(x, y, w, 24);
  }
  
  public UIButton(UIView view, int x, int y) {
    super(view);
    this.construct(x, y, 64, 24);
  }
  
  private void construct(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.width = w;
    this.height = h;
    
    this.label = new UILabel(view,0,0);
    this.label.anchor = new UIAnchor(CENTER,CENTER);
    this.label.x = x + (w/2);
    this.label.y = y + (h/2);
  }
  
  public void draw() {
    PApplet applet = this.view.getApplet();
    /*
    int textWidth = int(applet.textWidth(this.label.text));
    if (textWidth > this.width) {
      this.label.x += (this.width-textWidth)/2;
      this.width = textWidth + 8;
       
    }
    */
    // Drawing the Button
    if (this.isFocused())
      applet.stroke(this.focusBorderColor);
    else
      applet.stroke(this.borderColor);
      
    if (this.isHovered() && !applet.mousePressed) {
      this.label.foreColor = this.hoverTextColor;
      applet.fill(this.hoverBackColor);
    } else if (this.isHovered() && applet.mousePressed && this.view.focusId == this.getId()) {
      this.label.foreColor = this.pushedTextColor;
      applet.fill(this.pushedBackColor);
    } else {
      this.label.foreColor = this.textColor;
      applet.fill(this.backColor);
    }
    
    

    applet.rect(getX(), getY(), width, height, 5);
    
    // Drawing the Label on top
    this.label.draw();
  }
  
  public void register() {
    this.view.addControl(this);
  }
  
  public void reset() {
    resetControl();
    text = "";
    borderColor = #555555;
    focusBorderColor = #1C34FF;
    backColor = #DDDDDD;
    textColor = #000000;
    
    hoverBackColor = #C4EEFF;
    hoverTextColor = #000000;
    
    pushedBackColor = #3BC7FF;
    pushedTextColor = #FFFFFF;
  }
}
