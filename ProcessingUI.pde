UIApp app;
MyView view;
SecondView view2;

public class MyView extends UIView {
  UILabel lbl;
  UIButton btn;
  UIButton btn2;
  UISlider slider;
  UILabel move;
  
  public void setup() {
    lbl = new UILabel(this,(300/2),10);
    lbl.fontSize = 16;
    lbl.text = "Test UI";
    lbl.setAnchor(CENTER, TOP);
    lbl.register();
    
    UISpinner spinner = new UISpinner(this,30, 30);
    spinner.anchor = new UIAnchor(CENTER, CENTER);
    spinner.register();
    
    btn = new UIButton(this,100,50);
    btn.setTag("ok");
    btn.label.text = "OK";
    //this.focusId = btn.getId();
    btn.hide();
    btn.register();
    
    btn2 = new UIButton(this,170,50);
    btn2.setTag("show");
    btn2.label.text = "Afficher";
    btn2.register();
    
    slider = new UISlider(this, 50,100, 80);
    slider.setTag("slider");
    slider.register();
    
    UIButton sliderBtn = new UIButton(this,180,104, 48);
    sliderBtn.setTag("slider");
    sliderBtn.label.text = "= 50";
    sliderBtn.register();
    
    UILabel sliderLabel = new UILabel(this, 150, 116);
    sliderLabel.setAnchor(LEFT, CENTER);
    slider.linkLabel(sliderLabel);
    sliderLabel.register();
    
  }
  
  public void onButtonClickUp(UIButton btn) {
   if (btn.getTag() == "ok") {
     this.getApp().setView("second");
   } else if (btn.getTag() == "show") {
     this.btn.show();
   } else if (btn.getTag() == "slider") {
     this.slider.setValue(50);
   }
  }
}

public class SecondView extends UIView {
  UIButton btn;
  
  public void setup() {
    UILabel lbl = new UILabel(this, 150, 75);
    lbl.setAnchor(CENTER,CENTER);
    lbl.fontSize = 20;
    lbl.text = "Vue 2";
    lbl.register();
    
    btn = new UIButton(this,150-32,100);
    btn.setTag("back");
    btn.label.text = "Retour";
    this.focusId = btn.getId();
    btn.register();
    
  }
  
  public void onButtonClickUp(UIButton btn) {
   if (btn.getTag() == "back") {
      this.getApp().setView("main");
   }
  }
}

void setup() {
  app = new UIApp(this, 300, 150);
  
  view = new MyView();
  app.addView("main",view);
  
  SecondView view2 = new SecondView();
  app.addView("second",view2);
  
  app.setView("main");
}

void draw() {
  app.draw();
  //lbl.x++;
}

void mousePressed() { app.mousePressed(); }
void mouseReleased() { app.mouseReleased(); }
