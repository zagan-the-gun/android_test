class OptionView{
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

  int optionTextFontSize = 28;
  String buttonText = "no text";

  int gaugeValue;
  float gaugePos;

  OptionView(int widthSize, int heightSize, int fontSize){
    this.textWidthSize = widthSize;
    this.textHeightSize = heightSize;
    this.optionTextFontSize = fontSize;
  }

  void setCoordinate(float _px, float _py){
    this.px = _px;
    this.py = _py;
    this.gaugePos = (mogura * 20) + (px - 100);
    this.gaugeValue = mogura;
    println("DEBUG DEBUG DEBUG gaugePos : " + this.gaugePos);
    println("DEBUG DEBUG DEBUG gaugeValue : " + this.gaugeValue);
    println("DEBUG DEBUG DEBUG mogura : " + mogura);

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

  void optionDraw(){
    //println("DEBUG DEBUG DEBUG");

    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    colorMode(RGB,255);
    strokeJoin(ROUND);

    strokeWeight(3);
    line(int(px) - 100, int(py), int(px) + 100, int(py));

    strokeWeight(2);
    for(int i = int(px) - 90; i <= int(px) + 100; i = i + 30){
      line(i, py - 8, i, py + 8);
    }

    strokeWeight(8);
    stroke(strokeR, strokeG, strokeB, strokeA);
    fill(fillR, fillG, fillB, fillA);
    rect(gaugePos, py, 20, 40);

    fill(fontR, fontG, fontB, fontA);
    textSize(optionTextFontSize);
    text(gaugeValue, px, py - 50);
  }

  boolean hit_check(float x, float y){
    if(x < (px + textWidthSize/2) && x > (px - textWidthSize/2)){
      if(y < (py + textHeightSize/2) && y > (py - textHeightSize/2)){
        return true;
      }
    }
    return false;
  }

  void drugGaugePos(float _x, float _y){
    if(_y < (py + 40) && _y > (py - 40)){

      if(_x < px - float(100)){
        this.gaugePos = px - 100;
      } else if(_x > px + float(100)){
        this.gaugePos = px + 100;
      } else {
        this.gaugePos = _x;
      }
      this.gaugeValue = int((gaugePos - (px - 100))/20);
      //println("DEBUG DEBUG DEBUG gaugeValue: " + gaugeValue);
    }
  }

  void setConfig(){
    JSONObject gameConfig = new JSONObject();
    gameConfig.setInt("mogura", this.gaugeValue);
    saveJSONObject(gameConfig,"config.json");
    mogura = this.gaugeValue;
    setup();
  }

  int getConfig(){
    JSONObject gameConfig = loadJSONObject("config.json");
    return gameConfig.getInt("mogura");
  }
}