class TitleView{
  float px = 0;
  float py = 0;

  float fillR = 127;
  float fillG = 127;
  float fillB = 127;
  float fillA = 127;

  float strokeR = 127;
  float strokeG = 127;
  float strokeB = 127;
  float strokeA = 127;

  float fontR = 127;
  float fontG = 127;
  float fontB = 127;
  float fontA = 127;

  // 0 dead 1 alive
  int status = 1;

  int textWidthSize = 200;
  int textHeightSize = 40;

  int strokeWeightSize = 8;

  int menuTextFontSize = 16;
  String buttonText = "no text";

  TitleView(String text, float x, float y, int widthSize, int heightSize, int fontSize){
    this.px = x;
    this.py = y;
    this.buttonText = text;
    this.textWidthSize = widthSize;
    this.textHeightSize = heightSize;
    this.menuTextFontSize = fontSize;
    //menu_draw();
  }

  void setCoordinate(float x, float y){
    this.px = x;
    this.py = y;
  }

  void setFillColor(float r, float g, float b, float a){
    this.fillR = r;
    this.fillG = g;
    this.fillB = b;
    this.fillA = a;
  }

  void setStrokeColor(float r, float g, float b, float a){
    this.strokeR = r;
    this.strokeG = g;
    this.strokeB = b;
    this.strokeA = a;
  }

  void setFontColor(float r, float g, float b, float a){
    this.fontR = r;
    this.fontG = g;
    this.fontB = b;
    this.fontA = a;
  }

  void menu_draw(){
    //println("DEBUG DEBUG DEBUG ");

    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    colorMode(RGB,255);

    strokeWeight(this.strokeWeightSize);
    //strokeWeight(20);
    strokeJoin(ROUND);
    //strokeJoin(MITER);
    //strokeJoin(BEVEL);

    stroke(strokeR, strokeG, strokeB, strokeA);

    fill(fillR, fillG, fillB, fillA);

    rect(px, py, textWidthSize, textHeightSize);

    fill(fontR, fontG, fontB, fontA);
    textSize(menuTextFontSize);
    text(buttonText, px, py, textWidthSize, textHeightSize);

  }

  boolean hit_check(float x, float y){
    if(x < (px + textWidthSize/2) && x > (px - textWidthSize/2)){
      if(y < (py + textHeightSize/2) && y > (py - textHeightSize/2)){
        return true;
      }
    }
    return false;
  }

}