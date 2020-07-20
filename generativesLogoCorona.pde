//Generatives Logo
/*• Schwarze Kreise zeigen an, wie vielen mit COVID-19 man begenet ist.
 Falls man mehr als 10 Menschen mit COVID-19 begegnet ist, steht
 ein farbiger Kreis, für 10 Menschen 
 • Farbe der Schrift zeigt an, ob man sich vielleicht test lassen sollte
 • Graph zeigt die neuen Infektionen in Deutschland der letzten Tage an
 • Rote oder grüne Kreise zeigen die Prozentzahl an, wann das jeweilig Gebiet
 wo man sich befindet, zum Corona Risikogebiet werden kann
 • Bei nicht vorhandenen Daten ist das Logo schwarzweiß
 */

//Zuständig für die Aktivierung von den Buttons, ob man sich testen lassen sollte
boolean yesButtonTest = false;
boolean noButtonTest = false;

//Zuständig für die Aktivierung von den Buttons, ob Daten vorhanden sind
boolean yesButtonData = true;
boolean noButtonData = false;

//SliderVariable Anfangswert
float sliderXEncounter=0;
float sliderXInfection = 50;
float sliderXRisk = 0;

//Setzt den Wert bei Data-Ja auf neue Werte
boolean startNew = false;

//Klassen
Interface ui = new Interface();
Encounter encounter = new Encounter();
Graph graph = new Graph();

//Farben
public color colors[] = new color[4];
//Orangerot
int rO = 255;
int gO = 109;
int bO =24;
//Grün
int rG = 55;
int gG = 169;
int bG =0;


void setup() {
  //Oragnerot
  colors[0] = color(rO, gO, bO);
  //Grün
  colors[1] = color(rG, gG, bG);
  size(1500, 800);
  //Blau
  colors[2] = color(108, 159, 204);
  //Grau
  colors[3] = color(200, 200, 200);
  size(1500, 800);
  //Werte die am Anfang festgelegt werden müssen
  graph.setRandom();
  //Zeichnet alles
  setAll();
}

void draw() {
  hoverButton();
  pressedSliderEncounter();
  pressedSliderInfection();
  pressedSliderRisk();
}

//Setzt alle Elemente
void setAll() {
  background(255);
  //UI
  setUI();
  //Font
  setFont();
  //Graph
  setGraph();
  //Begegnungen
  setEncounter();
  //Virus
  setVirus();
}

//Falls keine Daten vorhanden sind, wird diese Funktion aufgerufen
void setNoData() {
  background(255);
  //UI wird erneuert
  setUI();
  ui.activeButtonNoData();
  setFont();
  setVirus();
}

//UI wird erstellt
void setUI() {
  ui.showUI();
  ui.setUITest();
  ui.setUIEncounter();
  ui.setUIGraph();
  ui.setUIRisk();
  ui.setUINoData();  
  ui.textEncounter((int)sliderXEncounter);
  ui.textGraph((int)sliderXEncounter, true);
  ui.textRisk((int)sliderXEncounter);
  ui.setCover(yesButtonData);
}



//Font wird erstellt
void setFont() {
  fill(255);
  noStroke();
  rect(354, height/2-31, 700, 62);
  if (yesButtonTest == true && yesButtonData==true && startNew == false) {
    //Färbt Font orangerot
    Font font = new Font(355, height/2+30, 80, rO, gO, bO);
    font.showFont();
  } else if (noButtonTest == true && yesButtonData==true && startNew == false) {
    //Färbt Font Grün
    Font font = new Font(355, height/2+30, 80, rG, gG, bG);
    font.showFont();
  } else {
    //Färbt Font Schwarz
    Font font = new Font(355, height/2+30, 80, 0, 0, 0);
    font.showFont();
  }
  stroke(0);
}

//Graph wird erstellt
void setGraph() {
  float vSizeG = 150;
  float vXG = 200;
  if (yesButtonData == true) {
    if (sliderXInfection == 50)
    {
      graph.showGraph(vXG-vSizeG/2, sliderXInfection+height/2, vSizeG);
    } else {
      sliderXInfection = map(sliderXInfection, 0, 60, -50, 50);
      //Falls Slider noch nicht verwendet worden ist
      float randomEnd = (height/2+((-1)*sliderXInfection));
      graph.showGraph(vXG-vSizeG/2, randomEnd, vSizeG);
    }
  }
}

//Setzt wie viele Begegnungen man gehabt hat mit erkrankten
void setEncounter() {
  float vSizeE = 150;
  float vXE = 200;
  float vYE = height/2;
  float sliderXEncounterTen = floor(sliderXEncounter/10);
  float sliderXEncounterRest = sliderXEncounter - sliderXEncounterTen*10;

  //Zehn Kreise werden zu einem farbigen Kreis zusammengefasst
  for (int i = 0; i < sliderXEncounterTen; i++) {
    float eX= (int)random(vXE-vSizeE/2-70, vXE+vSizeE/2+70);
    float eY= (int)random(vYE-vSizeE/2-70, vYE+vSizeE/2+70);
    if ((eX>vXE-vSizeE/2-45)&&(eX<vXE+vSizeE/2+45)&&(eY>vYE-vSizeE/2-45)&&(eY<vYE+vSizeE/2+45)) {
      i--;
    } else {
      fill(colors[0]);
      noStroke();
      encounter.showEncounter(eX, eY, yesButtonData);
      stroke(colors[0]);
    }
  }

  //Einzelne Kreise sind schwarz
  for (int i = 0; i < sliderXEncounterRest; i++) {
    float eX= (int)random(vXE-vSizeE/2-70, vXE+vSizeE/2+70);
    float eY= (int)random(vYE-vSizeE/2-70, vYE+vSizeE/2+70);
    if ((eX>vXE-vSizeE/2-45)&&(eX<vXE+vSizeE/2+45)&&(eY>vYE-vSizeE/2-45)&&(eY<vYE+vSizeE/2+45)) {
      i--;
    } else {
      fill(0);
      noStroke();
      encounter.showEncounter(eX, eY, yesButtonData);
    }
  }
}

//Virus wird erstellt
void setVirus() {
  float vSize = 150;
  float vX = 200;
  float vY = height/2;
  strokeWeight(3);
  CoronaVirus cv = new CoronaVirus(vX, vY, vSize, sliderXRisk, yesButtonData);
  cv.showVirus();
}

//Funktion ermöglicht, dass die Buttons sich bei Hover einfärben
void hoverButton() {
  //JA-Button, ob man sich testen lassen sollte
  if (yesButtonTest==false) {
    if (mouseX>1120&&mouseX<1200 && mouseY>62 && mouseY<92 && yesButtonData==true) {
      fill(colors[0]);
      strokeWeight(1);
      stroke(0);
      rect(1120, 62, 80, 30);
      textSize(12);
      fill(0);
      text("JA", 1155, 82);
    } else {
      strokeWeight(1);
      stroke(0);
      fill(255);
      rect(1120, 62, 80, 30);
      fill(0);
      textSize(12);
      text("JA", 1155, 82);
    }
  }
  //NEIN-Button, ob man sich testen lassen sollte
  if (noButtonTest==false) {
    if (mouseX>1210&&mouseX<1290 && mouseY>62 && mouseY<92 && yesButtonData==true) {

      fill(colors[1]);
      strokeWeight(1);
      rect(1210, 62, 80, 30);
      textSize(12);
      fill(0);
      text("NEIN", 1235, 82);
    } else {

      stroke(0);
      strokeWeight(1);
      fill(255);
      rect(1210, 62, 80, 30);
      fill(0);
      textSize(12);
      text("NEIN", 1235, 82);
    }
  }

  if (noButtonData==true) {
    ui.inactiveButtonsTest();
  }


  //JA-Button, ob Daten vorhanden sind
  if (yesButtonData==false) {
    if (mouseX>1120&&mouseX<1200 && mouseY>392 && mouseY<422) {
      fill(colors[2]);
      strokeWeight(1);
      stroke(0);
      rect(1120, 392, 80, 30);
      textSize(12);
      fill(0);
      text("JA", 1155, 412);
    } else {
      strokeWeight(1);
      stroke(0);
      fill(255);
      rect(1120, 392, 80, 30);
      fill(0);
      textSize(12);
      text("JA", 1155, 412);
    }
  }

  //NEIN-Button, ob Daten vorhanden sind
  if (noButtonData==false) {
    if (mouseX>1210&&mouseX<1290 && mouseY>392 && mouseY<422) {

      fill(colors[2]);
      strokeWeight(1);
      rect(1210, 392, 80, 30);
      textSize(12);
      fill(0);
      text("NEIN", 1235, 412);
    } else {

      stroke(0);
      strokeWeight(1);
      fill(255);
      rect(1210, 392, 80, 30);
      fill(0);
      textSize(12);
      text("NEIN", 1235, 412);
    }
  }
}


void mouseReleased() {
  clickTest();
  clickData();
}

//Falls auf den Test-Buttons geklickt wird
void clickTest() {
  if (mouseX>1120&&mouseX<1200 && mouseY>62 && mouseY<92 && yesButtonData == true) {
    //Falls auf Ja geklickt wird
    yesButtonTest=true;
    noButtonTest=false;
    ui.activeButtonYesTest();
    setFont();
    stroke(0);
  } else if (mouseX>1210&&mouseX<1290 && mouseY>62 && mouseY<92 && yesButtonData == true) {
    //Falls auf Nein geklickt wird
    noButtonTest=true;
    yesButtonTest = false;
    ui.activeButtonNoTest();
    setFont();
    stroke(0);
  }
}

//Falls auf den Daten-Buttons geklickt wird
void clickData() {
  if (mouseX>1120&&mouseX<1200 && mouseY>392 && mouseY<422 && noButtonData==true) {
    //Falls auf Ja geklickt wird
    yesButtonData=true;
    noButtonData=false;
    ui.activeButtonYesData();
    sliderXRisk=0;
    sliderXEncounter=0;
    startNew = true;

    sliderXInfection = 50;
    graph.setRandom();
    setAll();
    stroke(0);
    startNew = false;
  } else if (mouseX>1210&&mouseX<1290 && mouseY>392 && mouseY<422) { 
    //Falls auf Nein geklickt wird
    noButtonData=true;
    yesButtonData = false;
    ui.inactiveButtonsTest();
    setNoData();
    stroke(0);
    ui.activeButtonNoData();
  }
}


//Überprüft ob der Slider bewegt wurde, wo geschaut wird wieviele Erkrankten man begegnet ist
void pressedSliderEncounter() {
  int x = 1120;
  int widthR = 300;
  int y = 155;
  int heightR= 10;
  if (mouseX>1120&&mouseX<1420 &&mouseY>150&&mouseY<170 && mousePressed && yesButtonData == true) {

    fill(255);
    noStroke();
    rect(1112, 150, 320, 20);
    ui.setGradient(x, widthR, y, heightR);
    fill(0);
    stroke(0);
    circle(mouseX, 160, 12);

    sliderXEncounter = (mouseX-1120)/15;

    ui.textEncounter((int)sliderXEncounter);
    float vX = 200;
    float vY = height/2;
    noFill();
    stroke(255);
    strokeWeight(70);
    rectMode(RADIUS);
    rect(vX, vY, 120, 120);
    stroke(0);
    strokeWeight(3);
    rectMode(CORNER);
    setEncounter();

    setVirus();
  }
  if (noButtonData == true) {
    ui.setGrayGradient(x, widthR, y, heightR);
    fill(0);
    stroke(0);
    circle(x, 160, 12);
  }
}

//Überprüft ob der Slider bewegt wurde, wie viele heute erkrankt sind
void pressedSliderInfection() {
  int x = 1120;
  int widthR = 300;
  int y = 240;
  int heightR= 10;
  if (mouseX>1120&&mouseX<1420 &&mouseY>235&&mouseY<255 && mousePressed && yesButtonData == true) {

    float vSize = 150;
    float vX = 200;
    float vY = height/2;
    fill(255);
    noStroke();
    rect(1112, 235, 320, 20);

    ui.setGradient(x, widthR, y, heightR);
    fill(0);
    stroke(0);
    circle(mouseX, 245, 12);
    fill(255);
    circle(vX, vY, vSize);

    sliderXInfection = ((mouseX-1120)/(300/60))+1;


    setGraph();
    ui.textGraph((int)sliderXInfection, false);
    setVirus();
  }

  if (noButtonData == true) {
    ui.setGrayGradient(x, widthR, y, heightR);
    fill(0);
    stroke(0);
    circle(x, 245, 12);
  }
}

//Überprüft ob der Slider bewegt wurde, ob man sich im Risikogebiet befindet
void pressedSliderRisk() {
  int x = 1120;
  int widthR = 300;
  int y = 325;
  int heightR= 10;
  if (mouseX>1120&&mouseX<1420 &&mouseY>320&&mouseY<340 && mousePressed && yesButtonData == true) {
    fill(255);
    noStroke();
    rect(1112, 320, 320, 20);
    ui.setGradient(x, widthR, y, heightR);
    fill(0);
    stroke(0);
    circle(mouseX, 330, 12);

    sliderXRisk = ((mouseX-1120)/(300/11));
    println(sliderXRisk);
    ui.textRisk((int)sliderXRisk);
    setVirus();
  }

  if (noButtonData == true) {
    ui.setGrayGradient(x, widthR, y, heightR);
    fill(0);
    stroke(0);
    circle(x, 330, 12);
  }
}

void keyPressed() {
  //Speichern als PNG
  if(key == 's'){
  saveFrame("data/logo-######.png");
  println("Frame wurde gespeichert.");
  }
}
