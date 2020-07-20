//Die Klasse Font ist dafür zuständig den Schriftzug "Corona-Radar" zu setzen und farblich zu verändern
class Font{
  
  //Position und Größe der Font
  float xFont;
  float yFont;
  float sizeFont;
  //Farbe
  color rgb;
  
  //Position und Größe des Fonts werden durch Parameterwerte des Hauptsketches festgelegt
  Font(float _xF, float _yF, float _sizeF, int _r, int _g, int _b){
    xFont = _xF;
    yFont = _yF;
    sizeFont = _sizeF;
    rgb = color(_r,_g,_b);
  }
  
  //Erzeugt die Font. Parameter gibt die Farbe an
  void showFont(){
    //Festlegung der Schriftart
    PFont font;
    font = createFont("Lato-Black.ttf", 32);
    textFont(font);
    //Farbe
    fill(rgb);
    //Größe
    textSize(sizeFont);
    //Text
    text("CORONA-RADAR", xFont, yFont); 
  }
  
}
