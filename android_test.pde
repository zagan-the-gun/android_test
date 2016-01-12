Mogura mog0 = new Mogura(100,100);
Mogura mog1 = new Mogura(300,300);
TitleView startMenu = new TitleView("Start", width/2, height/2, 150, 40, 18);
TitleView optionMenu = new TitleView("Option", width/2, height/2 + 80, 150, 40, 18);
TitleView quitMenu = new TitleView("Quit", width/2, height/2 + 160, 150, 40, 18);

int gameFlag = 0;
int menuSelect = 1;
int score = 0;

void setup() {
  size(400, 600, P2D);
  //size(400, 600);
  //size(1280, 720);
  //size(720, 1280);
  //fullScreen();
  //colorMode(RGB,256);

  background(255);
  //frameRate(1);

  startMenu.setCoordinate(width/2, height/2);
  startMenu.setFillColor(255, 255, 255, 255);
  startMenu.setStrokeColor(0, 0, 0, 255);
  startMenu.setFontColor(0, 0, 0, 255);

  optionMenu.setCoordinate(width/2, height/2 + 80);
  optionMenu.setFillColor(255, 255, 255, 255);
  optionMenu.setStrokeColor(0, 0, 0, 255);
  optionMenu.setFontColor(0, 0, 0, 255);

  quitMenu.setCoordinate(width/2, height/2 + 160);
  quitMenu.setFillColor(255, 255, 255, 255);
  quitMenu.setStrokeColor(0, 0, 0, 255);
  quitMenu.setFontColor(0, 0, 0, 255);

  mog0.setFillColor(0, 0, 0, 255);
  mog0.setStrokeColor(0, 0, 0, 255);
  mog1.setFillColor(0, 0, 0, 255);
  mog1.setStrokeColor(0, 0, 0, 255);

}

void draw() {
  background(255);

  if(gameFlag == 1){
    
    if(mog0.getStatus() == 1) {
      mog0.ellipse_draw();
      mog0.strokeSizeAttenuator();
    } else if(mog0.getStatus() == 0 && random(0,100) <= 10) {
      //println("round(random(0,1)): " + round(random(0,1)));
      mog0.setCoordinate(random(0,width),random(0,height));
      mog0.setStatus(1);
    }

    if(mog1.getStatus() == 1) {
      mog1.ellipse_draw();
      mog1.strokeSizeAttenuator();
    } else if(mog1.getStatus() == 0 && random(0,100) <= 10) {
      mog1.setCoordinate(random(0,width),random(0,height));
      mog1.setStatus(1);
    }

  } else if(gameFlag == 0) {
    stroke(0, 0, 0, 255);
    strokeWeight(1);
    line(0, 0, width, height);
    line(0, height, width, 0);
    startMenu.menu_draw();
    optionMenu.menu_draw();
    quitMenu.menu_draw();
  }
  delay(50);
}

void mousePressed(){

  if(gameFlag == 0){
    if(startMenu.hit_check(mouseX, mouseY)) {
      menuSelect = 1;
      gameFlag = 1;
    } else if(optionMenu.hit_check(mouseX, mouseY)){
      menuSelect = 2;
    } else if(quitMenu.hit_check(mouseX, mouseY)){
      exit();
    }
  } else if(gameFlag == 1) {
    mog0.hit_check(mouseX, mouseY);
    mog1.hit_check(mouseX, mouseY);
  }
}