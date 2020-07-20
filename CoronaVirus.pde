//Die Klasse zeichnet das Virus, was das meiste des Logobildes ausmacht
class CoronaVirus { 
  //Variablen für die Position und Größe
  float xVirus;
  float yVirus;
  float sizeVirus;
  //Farbe der Linien und Größe
  color colorVirus = color(0);
  int strokeWVirus = 7;
  //Prozentzahl in wieweit der Ort bald ein Risikogebiet ist. Z.B. bei 50 Neuerkrankten bei 100 000 einwohnern wären es 100%.
  //bei 25 erkrankten bei 100 000 wären es 50%
  int numberRisk;
  //Falls keine Daten vorhanden
  boolean data;

  CoronaVirus(float _xV, float _yV, float _sizeV, float _numberRisk, boolean _data) {
    xVirus = _xV;
    yVirus = _yV;
    sizeVirus = _sizeV;
    numberRisk = (int)_numberRisk;
    data = _data;
  }

  void showVirus() {
    //Linie die dabei helfen soll den Graph besser zu lesen
    strokeWeight(2);
    stroke(colorVirus);
    line(xVirus-sizeVirus/2, yVirus, xVirus+sizeVirus/2, yVirus);

    //Kreis der den Grundkörper darstellt
    noFill();
    stroke(colorVirus);
    strokeWeight(strokeWVirus);
    circle(xVirus, yVirus, sizeVirus);

    //"Nicht sichtbarer"/Weißer Kreis im Hintergrund, der den Graph überdeckt, falls dieser zulang wird
    stroke(255);
    strokeWeight(30);
    circle(xVirus, yVirus, sizeVirus+strokeWVirus+30);

    //Zeichnet die Linien und die dazugehörigen kleine Kreise um das Virus herum
    translate(xVirus, yVirus);
    pushMatrix();
    float counter = 0;
      for (int i=0; i<360; i+=36)
      {
        pushMatrix();
        stroke(0);
        strokeWeight(7);
        rotate(radians(i+180));
        line(0, sizeVirus/2+30, 0, sizeVirus/2);
        if (counter<numberRisk) {
          counter++;
          //Färbt den Teil orangerot
          fill(colors[0]);
        } else {
          //Färbt den Teil grün
          fill(colors[1]);
        }
        
        if(data==false){
          //Falls keine Daten vorhanden sind die Kügelchen weiß
          fill(255);
        }
        circle(0, sizeVirus/2+30, 20);
        popMatrix();
        noFill();
      }
  
    popMatrix();
  }
}
