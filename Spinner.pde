public class UISpinner extends UIPositionnableControl implements IUIControl {
    int speed = 4;
    int step;
    int counter;
  public UISpinner(UIView view, int x, int y) {
    super(view);
    this.x = x;
    this.y = y;
    //this.start = millis();
    this.counter = 0;
    this.step = 1;
  }
  
  public void draw() {
    this.counter++;
    if (this.counter >= this.speed) {
      this.counter = 0;
      this.step++;
      if (this.step > 8)
        this.step = 1;   
    }
    PApplet applet = this.view.getApplet();
    //applet.rect(x,y,32,32);
    applet.fill(255);
    applet.stroke(0);
    
    int size = 8;
    int firstOffset = 12;
    int secondOffset = 24;
    
    int X = this.x;
    if (this.anchor.horizontal == CENTER)
      X = X - 16;
    else if (this.anchor.horizontal == RIGHT)
      X = X - 32;
      
    int Y = this.y;
    if (this.anchor.vertical == CENTER)
      Y = Y - 16;
    else if (this.anchor.vertical == BOTTOM)
      Y = Y - 32;
    
    fill(colorFill(1));
    applet.rect(X,Y,size,size);
    fill(colorFill(2));
    applet.rect(X+firstOffset,Y,size,size);
    fill(colorFill(3));
    applet.rect(X+secondOffset,Y,size,size);
    
    fill(colorFill(8));
    applet.rect(X,Y+firstOffset,size,size);
    fill(colorFill(4));
    applet.rect(X+secondOffset,Y+firstOffset,size,size);
    
    fill(colorFill(7));
    applet.rect(X,Y+secondOffset,size,size);
    fill(colorFill(6));
    applet.rect(X+firstOffset,Y+secondOffset,size,size);
    fill(colorFill(5));
    applet.rect(X+secondOffset,Y+secondOffset,size,size);
    //applet.ellipse();
  }
  
  private color colorFill(int square) {
    color res = #ffffff;
    if (square == this.step)
      res = #333333;
    else if (square == this.step-1)
      res = #888888;
    else if (square == this.step-2)
      res = #CCCCCC;
    else if (square == 8 && this.step == 1)
      res = #888888;
    else if (square == 7 && this.step == 1)
      res = #CCCCCC;
    else if (square == 8 && this.step == 2)
      res = #CCCCCC;
    return res;
  }
  
  public void register() {
    this.view.addControl(this);
  }
  
  public void reset() {
    this.resetControl();
  }
  
}
