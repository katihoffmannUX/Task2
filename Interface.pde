class Interface {
  Interface() {
  }

  //Basiselemente des Interfaces
  void showUI() {
    //Schrift festlegen
    PFont font;
    font = createFont("Lato-Regular.ttf", 32);
    textFont(font);
    strokeWeight(1);
    stroke(0);
    //Trennungslinie
    line(width-400, 30, width-400, height-30);
  }

  //Buttons die dafür zuständig sind, ob man sich testen lassen sollte
  void setUITest() {
    fill(0);
    textSize(12);
    text("Erforderlich sich auf COVID-19 testen zu lassen?", 1120, 50); 
    noFill();
    text("JA", 1155, 82); 
    rect(1120, 62, 80, 30);
    text("NEIN", 1235, 82); 
    rect(1210, 62, 80, 30);
  }

  //Slider wie vielen Erkrankten man begegnet ist
  void setUIEncounter() {
    fill(0);
    textSize(12);
    text("Begegnungen mit Erkrankten", 1120, 130); 
    int x = 1120;
    int widthR = 300;
    int y = 155;
    int heightR= 10;
    setGradient(x, widthR, y, heightR);
    stroke(0);
    fill(0);
    circle(1120, 160, 12);
  }

  //Slider was den Graphen steuert
  void setUIGraph() {
    fill(0);
    textSize(12);
    text("Neu-Infektionen heute", 1120, 215); 
    line(1120, 245, 1420, 245);
    int x = 1120;
    int widthR = 300;
    int y = 240;
    int heightR= 10;
    setGradient(x, widthR, y, heightR);
    stroke(0);
    fill(0);
    circle(1120, 245, 12);
  }

  //Slider was anzeigt, ob es bald ein Risikogebiet ist
  void setUIRisk() {
    fill(0);
    textSize(12);
    text("Bald Corona Risikogebiet?", 1120, 300); 
    int x = 1120;
    int widthR = 300;
    int y = 325;
    int heightR= 10;
    setGradient(x, widthR, y, heightR);
    stroke(0);
    fill(0);
    circle(1120, 330, 12);
  }

  //Verlauf UI
  void setGradient(int _x, int _widthR, int _y, int _heightR) {
    for (int i = _x; i <= _x+_widthR; i++) {
      float z = map(i, _x, _x+_widthR, 0, 1);
      color c = lerpColor(colors[1], colors[0], z);
      stroke(c);
      line(i, _y, i, _y+_heightR);
    }
  }

  void setGrayGradient(int _x, int _widthR, int _y, int _heightR) {
    for (int i = _x; i <= _x+_widthR; i++) {
      float z = map(i, _x, _x+_widthR, 0, 1);
      color c = lerpColor(colors[3], colors[3], z);
      stroke(c);
      line(i, _y, i, _y+_heightR);
    }
  }

  //Buttons ob Daten vorhanden sind
  void setUINoData() {
    fill(0);
    textSize(12);
    text("Daten vorhanden?", 1120, 380); 
    noFill();
    text("JA", 1155, 412); 
    rect(1120, 392, 80, 30);
    text("NEIN", 1235, 412); 
    rect(1210, 392, 80, 30);

    stroke(colors[2]);
    strokeWeight(1);
    fill(255);
    rect(1120, 392, 80, 30);
    textSize(12);
    fill(0);
    text("JA", 1155, 412);
    stroke(0);
  }

  //Aktiver Ja-Button, ob man sich testen lassen sollte
  void activeButtonYesTest() {
    stroke(colors[0]);
    strokeWeight(1);
    fill(255);
    rect(1120, 62, 80, 30);
    textSize(12);
    fill(0);
    text("JA", 1155, 82);
  }

  //Aktiver Nein-Button, ob man sich testen lassen sollte
  void activeButtonNoTest() {
    strokeWeight(1);
    stroke(colors[1]);
    fill(255);
    rect(1210, 62, 80, 30);
    textSize(12);
    fill(0);
    text("NEIN", 1235, 82);
  }

  //Inaktive Test-Buttons
  void inactiveButtonsTest() {
    strokeWeight(1);
    fill(colors[3]);
    rect(1120, 62, 80, 30);
    rect(1210, 62, 80, 30);
    textSize(12);
    stroke(0);
    fill(0);
    text("JA", 1155, 82);
    text("NEIN", 1235, 82);
  }

  //Aktiver Ja-Button, ob Daten vorhanden sind
  void activeButtonYesData() {
    stroke(colors[2]);
    strokeWeight(1);
    fill(255);
    rect(1120, 392, 80, 30);
    textSize(12);
    fill(0);
    text("JA", 1155, 412);
  }

  //Aktiver Nein-Button, ob Daten vorhanden sind
  void activeButtonNoData() {
    strokeWeight(1);
    stroke(colors[2]);
    fill(255);
    rect(1210, 392, 80, 30);
    textSize(12);
    fill(0);
    text("NEIN", 1235, 412);
  }

  //Slidertext Begegnungen
  void textEncounter(int _text) {
    fill(255);
    noStroke();
    rect(1430, 150, 30, 30);
    fill(0);
    textSize(12);
    text(_text, 1430, 165);
  }

  //Slidertext Begegnungen
  void textGraph(int _text, boolean _new) {
    fill(255);
    noStroke();
    rect(1430, 235, 30, 30);
    fill(0);
    textSize(12);
    if (_new==false) {
      _text = (int)map(_text, -48, 50, 0, 50);
    }
    text(_text, 1430, 250);
  }

  //Slidertext Begegnungen
  void textRisk(int _text) {
    fill(255);
    noStroke();
    rect(1430, 320, 50, 30);
    fill(0);
    textSize(12);
    _text = (int)map(_text, 0, 10, 0, 100);
    if(_text==110){
      _text = 100;
    }
    text(_text + "%", 1430, 335);
  }

  //Werte überdecken
  void setCover(boolean _data) {
    if (_data==false) {
      noStroke();
      fill(255);
      rect(1430, 150, 30, 200);
    }
  }
}
