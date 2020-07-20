//Die Klasse zeichnet kleine Kreise um das Logo, die die Anzahl der Begegnungen mit Erkrankten anzeigen sollen

class Encounter{
  Encounter(){  
  }
  
  //Zeichnet einen Kreis um das Logo in einer zufälligen Position
  void showEncounter(float _xC, float _yC, boolean _data){
      if(_data==true){
      int sizeC = (int)random(5,10);
      circle(_xC, _yC, sizeC);
      }
  }
}
