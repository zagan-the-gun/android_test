class Mogura{
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

  int strokeSize = 50;
  // 0 dead 1 alive
  int status = 0;
  // 0 stroke 1 fill
  int type = 0;

  int strokeWeightSize = 2;

  Mogura(float x, float y){
    setCoordinate(x,y);
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

  void ellipse_draw(){

    strokeWeight(this.strokeWeightSize);

    if(type == 0) {
     noFill();
     stroke(0);
    } else if(type == 1) {
     noStroke();
     fill(0);
    }

    ////imageMode(CENTER);
    //int tmp_strokeSize;

    //if(strokeSize > 255){
    //  strokeSize = 255;
    //}

    //tmp_strokeSize = strokeSize;

    //for(int i=0; i<16; i++){
    //  ellipse(this.px, this.py, tmp_strokeSize, tmp_strokeSize);
    //  if(10 >= tmp_strokeSize) break;
    //  tmp_strokeSize = tmp_strokeSize - 10; 
    //}
    ellipse(this.px, this.py, strokeSize, strokeSize);
  }

  void strokeSizeAttenuator(){
    if (0 < strokeSize){
      this.strokeSize--;
    } else {
      this.status = 0;
      damage++;
      if(damage > 10){
        exit();
      }
    }
  }

  void hit_check(float x, float y){
    if(x < (this.px + this.strokeSize/2) && x > (this.px - this.strokeSize/2)){
      if(y < (this.py + this.strokeSize/2) && y > (this.py - this.strokeSize/2)){
        this.status = 0;
        this.strokeSize = 0;
        score++;
        println("score: " + score);
      }
    }
  }
  
  void setStatus(int _status){
    if(_status == 1) {
      this.strokeSize = int(random(50,150));
      this.type = round(random(0,1));
      this.status = _status;
    }
  }

  int getStatus(){
    return this.status;
  }

  void setType(int _type){
    this.type = _type;
    println("type: " + type);
  }
}