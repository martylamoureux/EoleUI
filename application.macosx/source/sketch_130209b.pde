UIApp app;
UIView view;
UILabel lbl;

void setup() {
  app = new UIApp(this);
  view = new UIView(300,150);
  view.backColor = #ff0000;
  app.setView(view);
  lbl = new UILabel(view,50,50);
  lbl.text = "un texte";
  lbl.foreColor = 0xff;
  lbl.register();
}

void draw() {
  app.draw();
  lbl.x++;
}
