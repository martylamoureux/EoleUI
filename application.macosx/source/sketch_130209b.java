import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_130209b extends PApplet {

UIApp app;
UIView view;
UILabel lbl;

public void setup() {
  app = new UIApp(this);
  view = new UIView(300,150);
  view.backColor = 0xffff0000;
  app.setView(view);
  lbl = new UILabel(view,50,50);
  lbl.text = "un texte";
  lbl.foreColor = 0xff;
  lbl.register();
}

public void draw() {
  app.draw();
  lbl.x++;
}
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
public class UIControl {
  UIView view;
  
  public UIControl(UIView v) {
    this.view = v;
   }
  
}
public interface IUIControl {
  public void draw();
  public void register();
}
public class UILabel extends UIControl implements IUIControl {
  public int x = 0;
  public int y = 0;
  public String text = "";
  public int foreColor = 0xff000000;
  public PFont font;
  
  public UILabel(UIView view, int x, int y) {
    super(view);
    this.x = x;
    this.y = y;
  }
  
  public void draw() {
    PApplet applet = this.view.getApplet();
    
    if (font != null)
      applet.textFont(this.font);
    applet.fill(foreColor);
    applet.text(text,x,y);
  }
  
  public void register() {
    this.view.addControl(this);
  }
}
class UIView {
  UIApp app;
  private int windowWidth;
  private int windowHeight;
  public int backColor = 0xffffffff;
  
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_130209b" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
