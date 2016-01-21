//Mogura mog0 = new Mogura(100,100);
//Mogura mog1 = new Mogura(300,300);
//Mogura mog = new Mogura(100,100);
Mogura[] mogs = new Mogura[10];
//Mogura[] mogs;

TitleView startButton = new TitleView("Start", width/2, height/2, 150, 40, 18);
TitleView optionButton = new TitleView("Option", width/2, height/2 + 80, 150, 40, 18);
TitleView quitButton = new TitleView("Quit", width/2, height/2 + 160, 150, 40, 18);
OptionView argumentSlide = new OptionView(150, 40, 28);
TitleView optionOkButton = new TitleView("Ok", width/2, height/2, 80, 40, 18);
TitleView optionCancelButton = new TitleView("Cancel", width/2, height/2, 80, 40, 18);
TitleView gameoverReturnButton = new TitleView("Return", width/2, height/2, 80, 40, 18);
TitleView gameoverQuitButton = new TitleView("Quit", width/2, height/2, 80, 40, 18);

int gameFlag = 0;
int hiScore = 0;
int score = 0;
int mogura;
int damage = 0;


void setup() {
  //frameRate(100);
  //size(400, 600, JAVA2D);
  //size(400, 600, P2D);  
  size(400, 600, FX2D);
  //size(400, 600);
  //size(1280, 720);
  //size(720, 1280);
  //fullScreen();
  //colorMode(RGB,256);

  background(255);
  //frameRate(30);

  startButton.setCoordinate(width/2, height/2);
  startButton.setFillColor(255, 255, 255, 255);
  startButton.setStrokeColor(0, 0, 0, 255);
  startButton.setFontColor(0, 0, 0, 255);

  optionButton.setCoordinate(width/2, height/2 + 80);
  optionButton.setFillColor(255, 255, 255, 255);
  optionButton.setStrokeColor(0, 0, 0, 255);
  optionButton.setFontColor(0, 0, 0, 255);

  quitButton.setCoordinate(width/2, height/2 + 160);
  quitButton.setFillColor(255, 255, 255, 255);
  quitButton.setStrokeColor(0, 0, 0, 255);
  quitButton.setFontColor(0, 0, 0, 255);

  //mog0.setFillColor(0, 0, 0, 255);
  //mog0.setStrokeColor(0, 0, 0, 255);

  //mog1.setFillColor(0, 0, 0, 255);
  //mog1.setStrokeColor(0, 0, 0, 255);

  hiScore = getHiscore();
  mogura = argumentSlide.getConfig();

  argumentSlide.setCoordinate(width/2, height/2);
  argumentSlide.setFillColor(255, 255, 255, 255);
  argumentSlide.setStrokeColor(0, 0, 0, 255);
  argumentSlide.setFontColor(0, 0, 0, 255);

  optionOkButton.setCoordinate(width - 150, height - 50);
  optionOkButton.setFillColor(255, 255, 255, 255);
  optionOkButton.setStrokeColor(0, 0, 0, 255);
  optionOkButton.setFontColor(0, 0, 0, 255);

  optionCancelButton.setCoordinate(width - 50, height - 50);
  optionCancelButton.setFillColor(255, 255, 255, 255);
  optionCancelButton.setStrokeColor(0, 0, 0, 255);
  optionCancelButton.setFontColor(0, 0, 0, 255);

  gameoverReturnButton.setCoordinate(width/2 - 50, height/2 + 150);
  gameoverReturnButton.setFillColor(255, 255, 255, 255);
  gameoverReturnButton.setStrokeColor(0, 0, 0, 255);
  gameoverReturnButton.setFontColor(0, 0, 0, 255);

  gameoverQuitButton.setCoordinate(width/2 + 50, height/2 + 150);
  gameoverQuitButton.setFillColor(255, 255, 255, 255);
  gameoverQuitButton.setStrokeColor(0, 0, 0, 255);
  gameoverQuitButton.setFontColor(0, 0, 0, 255);

for (int i = 0; i < mogura; i++) {
 Mogura mog = new Mogura(0,0);
 mogs[i] = mog;
 mogs[i].setFillColor(0, 0, 0, 255);
 mogs[i].setStrokeColor(0, 0, 0, 255);
}
println("mogura: " + mogura);

}

void draw() {
  background(255);

  if(gameFlag == 1){
    for (int i = 0; i < mogura; i++) {
     if(mogs[i].getStatus() == 1) {
       mogs[i].ellipse_draw();
       mogs[i].strokeSizeAttenuator();
     } else if(mogs[i].getStatus() == 0 && random(0,100) <= 10) {
       //println("round(random(0,1)): " + round(random(0,1)));
       mogs[i].setCoordinate(random(width), random(height));
       mogs[i].setStatus(1);
     }
    }

    if(damage > 5){
      // damage effect
      loadPixels();
  
      stroke(0, 255, 255, 0);
      strokeWeight(1);
      line(0, 0, width, height);
      line(0, height, width, 0);
      ////mozaic
      for(int j = 0; j < height; j+=(damage+10)) {  
        for(int i = 0; i < width; i+=(damage+10)) {  
          color c = pixels[j * width + i];
          fill(c);
          rect(i, j, (damage+5), (damage+5));
        }
      }
    }
    fill(0, 0, 0);
    stroke(0, 0, 0);
    textSize(24);
    text("HI-SCORE", width/2, 10);
    if(hiScore > score){
      text(hiScore, width/2, 36);
    } else {
      text(score, width/2, 36);
    }
    text(score, 30, 36);

  } else if(gameFlag == 0) {
    stroke(0, 0, 0, 255);
    strokeWeight(1);
    line(0, 0, width, height);
    line(0, height, width, 0);
    startButton.menu_draw();
    optionButton.menu_draw();
    quitButton.menu_draw();

    textSize(24);
    text("HI-SCORE", width/2, 10);
    text(hiScore, width/2, 36);

  } else if(gameFlag == 2) {
    argumentSlide.optionDraw();
    optionOkButton.menu_draw();
    optionCancelButton.menu_draw();

    textSize(24);
    text("HI-SCORE", width/2, 10);
    text(hiScore, width/2, 36);

  } else if(gameFlag == 3) {
    textSize(72);
    text("GAME", width/2, height/2 - 150);
    text("OVER", width/2, height/2 - 80);
    textSize(36);
    text("SCORE", width/2, height/2 + 10);
    text(score, width/2, height/2 + 50);
    gameoverReturnButton.menu_draw();
    gameoverQuitButton.menu_draw();
  }

  delay(50);
}

void mousePressed(){

  if(gameFlag == 0){
    if(startButton.hit_check(mouseX, mouseY)) {
      gameFlag = 1;
    } else if(optionButton.hit_check(mouseX, mouseY)){
      gameFlag = 2;
    } else if(quitButton.hit_check(mouseX, mouseY)){
      exit();
    }
  } else if(gameFlag == 1) {
    //mog0.hit_check(mouseX, mouseY);
    //mog1.hit_check(mouseX, mouseY);
    for (int i = 0; i < mogura; i++) {
     mogs[i].hit_check(mouseX, mouseY);
    }

  } else if(gameFlag == 2) {
    if(optionOkButton.hit_check(mouseX, mouseY)) {
      argumentSlide.setConfig();
      gameFlag = 0;
    } else if(optionCancelButton.hit_check(mouseX, mouseY)){
      gameFlag = 0;
    }
  } else if(gameFlag == 3) {
    if(gameoverReturnButton.hit_check(mouseX, mouseY)) {
      damage = 0;
      gameFlag = 0;
    } else if(gameoverQuitButton.hit_check(mouseX, mouseY)){
      exit();
    }
  }
  gameoverReturnButton.setFontColor(0, 0, 0, 255);
}

void mouseDragged(){
  if(gameFlag == 2){
    argumentSlide.drugGaugePos(mouseX, mouseY);
  }
}

  int getHiscore(){
    JSONObject gameHiscore = loadJSONObject("hisocre.json");
    return gameHiscore.getInt("hiscore");
  }