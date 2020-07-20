//Die Klasse zeichnet den Graph in das Virus hinein

//
float[] randomNumbers = new float[6];
class Graph {
  Graph() {
  }

  //Setzt Zufallswerte für die ersten sechs Stellen/Tage von dem Graph
  public void setRandom() {
    float yoff = 0;
    for (int i=0; i<6; i++) {
      //Falls Werte zufällig sein sollen, nächste Zeile ausklammern und die zwei Zeilen darunter wegklammern
      //randomNumbers[i] = random((height/2-50), (height/2+50));
      //Zufällige Werte die sich aufeinander beziehen werden erstellt
      randomNumbers[i] = map(noise(yoff), 0, 1, (height/2-50), (height/2+50));
      yoff = yoff + 0.5;
    }
  }

//Zeichnet den Graphen
  void showGraph(float _start, float _end, float _size) {
    noFill();
    beginShape();
    strokeWeight(5);
    for (int i=0; i<7; i++) {
      if (i!=6) {
        //Die ersten sechs Punkte/Tage werden eingezeichent
        float gY = randomNumbers[i];
        vertex(_start+i*_size/6, gY);
      } else {
        //Der letzte Tag der wird durch den Parameter _end bestimmt und kann man durch das Interface bewegen
        vertex(_start+i*_size/6, _end);
      }
    }
    endShape();
  }
}
