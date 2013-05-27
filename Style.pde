public class UIStyle {
  public UIDrawing draw;
  
  public final int BLACK = color(0,0,0);
  public final int WHITE = color(255,255,255);
  
  public int borderColor = BLACK;
  public int borderWidth = 1;
  
  public int backgroundColor = WHITE;
  public int foregroundColor = BLACK;
  
  public int width = 0;
  public int height = 0;
  
  public UIStyle(UIApp app) {
    this.draw = new UIDrawing(this, app);
  }
  
  public void border(int borderColor, int borderWidth) {
    this.borderColor = borderColor;
    this.borderWidth = borderWidth;
  }
  
  public void border(int borderColor) {
    this.border(borderColor, 1);
  }
}

public class UIDrawing {
  private UIStyle style;
  private UIApp app;
  
  public UIDrawing(UIStyle style, UIApp app) {
    this.app = app;
    this.style = style;
  }
  
  public static void rect() {
    
  }
}
